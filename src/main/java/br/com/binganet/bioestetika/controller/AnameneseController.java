package br.com.binganet.bioestetika.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.binganet.bioestetika.model.Admission;
import br.com.binganet.bioestetika.model.Anamenese;
import br.com.binganet.bioestetika.service.AnameneseService;
import br.com.binganet.bioestetika.vo.AnameneseListVO;

@Controller
@RequestMapping(value = "/protected/anameneses")
public class AnameneseController {
	
	private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";
	
	@Autowired
    private AnameneseService anameneseService;

    @Autowired
    private MessageSource messageSource;

    @Value("5")
    private int maxResults;
    
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome() {
        return new ModelAndView("anamenesesList");
    }
    
    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<Admission> getAdmissionSession(HttpSession session, Locale locale) {
    	Admission admission = new Admission();
    	
    	if (!isNull(session.getAttribute("admissionSelected")))
    	{
    		admission = (Admission)session.getAttribute("admissionSelected");    		    		
    	}
    	    	
    	return new ResponseEntity<Admission>(admission, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/admission/{admissionId}", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> listAll(HttpSession session, @PathVariable("admissionId") int admissionId, @RequestParam int page, Locale locale) {    	    	    	
        return createListAllResponse(admissionId, page, locale);    	
    }
       
    @RequestMapping(method = RequestMethod.POST, produces = "application/json")
    public ResponseEntity<?> create(@RequestBody Anamenese anamenese,                                    
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {
    	
    	anameneseService.save(anamenese);

        return createListAllResponse(anamenese.getAdmission().getId(), page, locale, "message.create.success");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, produces = "application/json")
    public ResponseEntity<?> update(@PathVariable("id") int anameneseId,
                                    @RequestBody Anamenese anamenese,                                    
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {
    	if (anameneseId != anamenese.getId()) {
            return new ResponseEntity<String>("Bad Request", HttpStatus.BAD_REQUEST);
        }

    	anameneseService.save(anamenese);

        return createListAllResponse(anamenese.getAdmission().getId(), page, locale, "message.create.success");
    }
    
    private AnameneseListVO listAll(int page, int admissionId) {
        return anameneseService.findAll(page, maxResults, admissionId);
    }

    private ResponseEntity<AnameneseListVO> returnListToUser(AnameneseListVO AnameneseListVO) {
        return new ResponseEntity<AnameneseListVO>(AnameneseListVO, HttpStatus.OK);
    }

    private ResponseEntity<?> createListAllResponse(int admissionId, int page, Locale locale) {
        return createListAllResponse(admissionId, page, locale, null);
    }

    private ResponseEntity<?> createListAllResponse(int admissionId, int page, Locale locale, String messageKey) {
    	AnameneseListVO AnameneseListVO = listAll(page, admissionId);
    	addActionMessageToVO(AnameneseListVO, locale, messageKey, null);

        return returnListToUser(AnameneseListVO);
    }

    private AnameneseListVO addActionMessageToVO(AnameneseListVO AnameneseListVO, Locale locale, String actionMessageKey, Object[] args) {
        if (StringUtils.isEmpty(actionMessageKey)) {
            return AnameneseListVO;
        }

        AnameneseListVO.setActionMessage(messageSource.getMessage(actionMessageKey, args, null, locale));
        
        return AnameneseListVO;
    }
	
    private boolean isNull(Object obj) {
        return obj == null;
    }
}
