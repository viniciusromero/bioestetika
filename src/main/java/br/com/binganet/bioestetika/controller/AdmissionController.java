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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import br.com.binganet.bioestetika.vo.AdmissionListVO;
import br.com.binganet.bioestetika.model.Admission;
import br.com.binganet.bioestetika.model.Patient;
import br.com.binganet.bioestetika.service.AdmissionService;

@Controller
@RequestMapping(value = "/protected/admissions")
@SessionAttributes("admissionSelected")
public class AdmissionController {
	
	private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";
	
	@Autowired
    private AdmissionService admissionService;
	
    @Autowired
    private MessageSource messageSource;

    @Value("5")
    private int maxResults;
    
    private ModelAndView modelAndView;
    
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome() {
    	modelAndView = new ModelAndView("admissionsList");
        return modelAndView;
    }
    
    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<Patient> getPatientSession(HttpSession session, Locale locale) {
    	Patient patient = new Patient();
    	
    	if (!isNull(session.getAttribute("patientSelected")))
    	{
    		patient = (Patient)session.getAttribute("patientSelected");    		
    	}
    	
    	return new ResponseEntity<Patient>(patient, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/patient/{patientId}", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> listAll(HttpSession session, @PathVariable("patientId") int patientId, @RequestParam int page, Locale locale) {
        return createListAllResponse(patientId, page, locale);    	
    }
    
    @RequestMapping(method = RequestMethod.POST, produces = "application/json")
    public ResponseEntity<?> create(@RequestBody Admission admission,                                    
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {
    	
        admissionService.save(admission);

        return createListAllResponse(admission.getPatient().getId(), page, locale, "message.create.success");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, produces = "application/json")
    public ResponseEntity<?> update(@PathVariable("id") int admissionId,
                                    @RequestBody Admission admission,                                    
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {
    	if (admissionId != admission.getId()) {
            return new ResponseEntity<String>("Bad Request", HttpStatus.BAD_REQUEST);
        }

    	admissionService.save(admission);

        return createListAllResponse(admission.getPatient().getId(), page, locale, "message.create.success");
    }
    
    @RequestMapping(value="/addAdmissionSession")
    public ModelAndView selectPatient(HttpSession session, @RequestBody Admission admission){      	    	    	
    	modelAndView.addObject("admissionSelected", admission);    	        	    	    	    
    	
    	return modelAndView;
    }
    
    
    private AdmissionListVO listAll(int page, int patientId) {
        return admissionService.findAll(page, maxResults, patientId);
    }

    private ResponseEntity<AdmissionListVO> returnListToUser(AdmissionListVO admissionListVO) {
        return new ResponseEntity<AdmissionListVO>(admissionListVO, HttpStatus.OK);
    }

    private ResponseEntity<?> createListAllResponse(int patientId, int page, Locale locale) {
        return createListAllResponse(patientId, page, locale, null);
    }

    private ResponseEntity<?> createListAllResponse(int patientId, int page, Locale locale, String messageKey) {
    	AdmissionListVO admissionListVO = listAll(page, patientId);
    	addActionMessageToVO(admissionListVO, locale, messageKey, null);

        return returnListToUser(admissionListVO);
    }

    private AdmissionListVO addActionMessageToVO(AdmissionListVO admissionListVO, Locale locale, String actionMessageKey, Object[] args) {
        if (StringUtils.isEmpty(actionMessageKey)) {
            return admissionListVO;
        }

        admissionListVO.setActionMessage(messageSource.getMessage(actionMessageKey, args, null, locale));
        
        return admissionListVO;
    }
	
    private boolean isNull(Object obj) {
        return obj == null;
    }
}
