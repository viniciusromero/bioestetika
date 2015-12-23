package br.com.binganet.bioestetika.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/protected/home")
public class IndexController {
	
	@RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome(SessionStatus sessionStatus) {
		ModelAndView modelAndView = new ModelAndView("welcomePage");  
    	sessionStatus.setComplete();
        return modelAndView;
    }
	
}
