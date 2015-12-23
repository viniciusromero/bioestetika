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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.binganet.bioestetika.vo.AdmissionListVO;
import br.com.binganet.bioestetika.model.Patient;
import br.com.binganet.bioestetika.service.AdmissionService;

@Controller
@RequestMapping(value = "/protected/admissions")
public class AdmissionController {

	@Autowired
    private AdmissionService admissionService;

    @Autowired
    private MessageSource messageSource;

    @Value("5")
    private int maxResults;
    
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome() {
        return new ModelAndView("admissionsList");
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
    
    @RequestMapping(value = "/{patientId}", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> listAll(HttpSession session, @PathVariable("patientId") int patientId, @RequestParam int page, Locale locale) {
    	
    	if (!isNull(session.getAttribute("patientSelected")))
    	{
    		Patient patient = (Patient)session.getAttribute("patientSelected");
    		System.out.println("Id do Paciente:"+patient.getId());
    	}
    	
        return createListAllResponse(patientId, page, locale);    	
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
