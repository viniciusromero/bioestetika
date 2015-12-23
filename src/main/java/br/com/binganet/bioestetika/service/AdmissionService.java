package br.com.binganet.bioestetika.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.binganet.bioestetika.repository.AdmissionRepository;
import br.com.binganet.bioestetika.vo.AdmissionListVO;
import br.com.binganet.bioestetika.model.Admission;

@Service
@Transactional
public class AdmissionService {
	
	@Autowired
    private AdmissionRepository AdmissionRepository;
	
	@Transactional(readOnly = true)
    public AdmissionListVO findAll(int page, int maxResults, int patientId) {
        Page<Admission> result = executeQueryFindAllByPatientId(page, maxResults, patientId);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindAllByPatientId(lastPage, maxResults, patientId);
        }

        return buildResult(result);
    }
	
	private boolean shouldExecuteSameQueryInLastPage(int page, Page<Admission> result) {
        return isUserAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
    }

    private Page<Admission> executeQueryFindAllByPatientId(int page, int maxResults, int patientId) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByAdmDateASC());

        return AdmissionRepository.findByPatientId(pageRequest, patientId);
    }
    
    private AdmissionListVO buildResult(Page<Admission> result) {
        return new AdmissionListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
    }
    
    private boolean isUserAfterOrOnLastPage(int page, Page<Admission> result) {
        return page >= result.getTotalPages() - 1;
    }

    private boolean hasDataInDataBase(Page<Admission> result) {
        return result.getTotalElements() > 0;
    }
    
    private Sort sortByAdmDateASC() {
        return new Sort(Sort.Direction.ASC, "admdate");
    }
}
