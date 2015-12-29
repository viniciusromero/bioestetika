package br.com.binganet.bioestetika.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.binganet.bioestetika.model.Anamenese;
import br.com.binganet.bioestetika.repository.AnameneseRepository;
import br.com.binganet.bioestetika.vo.AnameneseListVO;

@Service
@Transactional
public class AnameneseService {
	
	@Autowired
	private AnameneseRepository AnameneseRepository;
	
	@Transactional(readOnly = true)
    public AnameneseListVO findAll(int page, int maxResults, int admissionId) {
        Page<Anamenese> result = executeQueryFindAllByAdmissionId(page, maxResults, admissionId);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindAllByAdmissionId(lastPage, maxResults, admissionId);
        }

        return buildResult(result);
    }
	
	private boolean shouldExecuteSameQueryInLastPage(int page, Page<Anamenese> result) {
        return isUserAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
    }

    private Page<Anamenese> executeQueryFindAllByAdmissionId(int page, int maxResults, int admissionId) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByUpdateDateASC());

        return AnameneseRepository.findByAdmissionId(pageRequest, admissionId);
    }
    
    private AnameneseListVO buildResult(Page<Anamenese> result) {
        return new AnameneseListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
    }
    
    private boolean isUserAfterOrOnLastPage(int page, Page<Anamenese> result) {
        return page >= result.getTotalPages() - 1;
    }

    private boolean hasDataInDataBase(Page<Anamenese> result) {
        return result.getTotalElements() > 0;
    }
    
    private Sort sortByUpdateDateASC() {
        return new Sort(Sort.Direction.ASC, "updatedate");
    }
}
