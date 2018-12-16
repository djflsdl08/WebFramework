package com.mycompany.helloSpringMVC.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller  // @Component : bean 등록 작업 
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);  // debug level!
															// com.mycompany.controller.HomeController
	
	@RequestMapping(value = "/", method = RequestMethod.GET)  
	public String home(HttpServletRequest request, Locale locale, Model model) {
		
		//logger.trace("trace level : Welcome home! The client locale is {}", locale); // print x
		//logger.debug("debug level : Welcome home! The client locale is {}", locale);
		logger.info("info level : Welcome home! The client locale is {}", locale);		
		//logger.warn("warn level : Welcome home! The client locale is {}", locale);
		//logger.error("error level : Welcome home! The client locale is {}", locale);
		
		String url = request.getRequestURL().toString();
		String clientIPAddr = request.getRemoteAddr();
		
		logger.info("Request URL : " + url);
		logger.info("Client IP Address : " + clientIPAddr);
		
		return "home";
	}
	
}
