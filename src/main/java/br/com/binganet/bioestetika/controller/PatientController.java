package br.com.binganet.bioestetika.controller;

import java.util.Locale;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.binganet.bioestetika.model.Patient;
import br.com.binganet.bioestetika.vo.PatientListVO;
import br.com.binganet.bioestetika.service.PatientService;

@Controller
@RequestMapping(value = "/protected/patients")
public class PatientController {
	
	private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";

    @Autowired
    private PatientService patientService;

    @Autowired
    private MessageSource messageSource;

    @Value("5")
    private int maxResults;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome() {
        return new ModelAndView("patientsList");
    }

    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> listAll(@RequestParam int page, Locale locale) {
        return createListAllResponse(page, locale);
    }

    @RequestMapping(method = RequestMethod.POST, produces = "application/json")
    public ResponseEntity<?> create(@ModelAttribute("patient") Patient patient,
                                    @RequestParam(required = false) String searchFor,
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {
        patientService.save(patient);

        if (isSearchActivated(searchFor)) {
            return search(searchFor, page, locale, "message.create.success");
        }

        return createListAllResponse(page, locale, "message.create.success");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, produces = "application/json")
    public ResponseEntity<?> update(@PathVariable("id") int patientId,
                                    @RequestBody Patient patient,
                                    @RequestParam(required = false) String searchFor,
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {
        if (patientId != patient.getId()) {
            return new ResponseEntity<String>("Bad Request", HttpStatus.BAD_REQUEST);
        }

        patientService.save(patient);

        if (isSearchActivated(searchFor)) {
            return search(searchFor, page, locale, "message.update.success");
        }

        return createListAllResponse(page, locale, "message.update.success");
    }

    @RequestMapping(value = "/{patientId}", method = RequestMethod.DELETE, produces = "application/json")
    public ResponseEntity<?> delete(@PathVariable("patientId") int patientId,
                                    @RequestParam(required = false) String searchFor,
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {


        try {
            patientService.delete(patientId);
        } catch (AccessDeniedException e) {
            return new ResponseEntity<Object>(HttpStatus.FORBIDDEN);
        }

        if (isSearchActivated(searchFor)) {
            return search(searchFor, page, locale, "message.delete.success");
        }

        return createListAllResponse(page, locale, "message.delete.success");
    }

    @RequestMapping(value = "/nome/{name}", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> search(@PathVariable("name") String name,
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {
        return search(name, page, locale, null);
    }

    private ResponseEntity<?> search(String name, int page, Locale locale, String actionMessageKey) {
        PatientListVO patientListVO = patientService.findByNameLike(page, maxResults, name);

        if (!StringUtils.isEmpty(actionMessageKey)) {
            addActionMessageToVO(patientListVO, locale, actionMessageKey, null);
        }

        Object[] args = {name};

        addSearchMessageToVO(patientListVO, locale, "message.search.for.active", args);

        return new ResponseEntity<PatientListVO>(patientListVO, HttpStatus.OK);
    }

    private PatientListVO listAll(int page) {
        return patientService.findAll(page, maxResults);
    }

    private ResponseEntity<PatientListVO> returnListToUser(PatientListVO patientList) {
        return new ResponseEntity<PatientListVO>(patientList, HttpStatus.OK);
    }

    private ResponseEntity<?> createListAllResponse(int page, Locale locale) {
        return createListAllResponse(page, locale, null);
    }

    private ResponseEntity<?> createListAllResponse(int page, Locale locale, String messageKey) {
        PatientListVO patientListVO = listAll(page);

        addActionMessageToVO(patientListVO, locale, messageKey, null);

        return returnListToUser(patientListVO);
    }

    private PatientListVO addActionMessageToVO(PatientListVO patientListVO, Locale locale, String actionMessageKey, Object[] args) {
        if (StringUtils.isEmpty(actionMessageKey)) {
            return patientListVO;
        }

        patientListVO.setActionMessage(messageSource.getMessage(actionMessageKey, args, null, locale));
        
        return patientListVO;
    }

    private PatientListVO addSearchMessageToVO(PatientListVO patientListVO, Locale locale, String actionMessageKey, Object[] args) {
        if (StringUtils.isEmpty(actionMessageKey)) {
            return patientListVO;
        }

        patientListVO.setSearchMessage(messageSource.getMessage(actionMessageKey, args, null, locale));

        return patientListVO;
    }

    private boolean isSearchActivated(String searchFor) {
        return !StringUtils.isEmpty(searchFor);
    }
	
}
