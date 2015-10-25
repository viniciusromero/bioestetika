package br.com.binganet.bioestetika.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.binganet.bioestetika.repository.PatientRepository;
import br.com.binganet.bioestetika.vo.PatientListVO;
import br.com.binganet.bioestetika.model.Patient;

@Service
@Transactional
public class PatientService {
	
	@Autowired
    private PatientRepository PatientRepository;

    @Transactional(readOnly = true)
    public PatientListVO findAll(int page, int maxResults) {
        Page<Patient> result = executeQueryFindAll(page, maxResults);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindAll(lastPage, maxResults);
        }

        return buildResult(result);
    }

    public void save(Patient Patient) {
        PatientRepository.save(Patient);
    }

    @Secured("ROLE_ADMIN")
    public void delete(int PatientId) {
        PatientRepository.delete(PatientId);
    }

    @Transactional(readOnly = true)
    public PatientListVO findByNameLike(int page, int maxResults, String name) {
        Page<Patient> result = executeQueryFindByName(page, maxResults, name);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindByName(lastPage, maxResults, name);
        }

        return buildResult(result);
    }

    private boolean shouldExecuteSameQueryInLastPage(int page, Page<Patient> result) {
        return isUserAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
    }

    private Page<Patient> executeQueryFindAll(int page, int maxResults) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return PatientRepository.findAll(pageRequest);
    }

    private Sort sortByNameASC() {
        return new Sort(Sort.Direction.ASC, "name");
    }

    private PatientListVO buildResult(Page<Patient> result) {
        return new PatientListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
    }

    private Page<Patient> executeQueryFindByName(int page, int maxResults, String name) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return PatientRepository.findByNameLike(pageRequest, "%" + name + "%");
    }

    private boolean isUserAfterOrOnLastPage(int page, Page<Patient> result) {
        return page >= result.getTotalPages() - 1;
    }

    private boolean hasDataInDataBase(Page<Patient> result) {
        return result.getTotalElements() > 0;
    }
	
}
