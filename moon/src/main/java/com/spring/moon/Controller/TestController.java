package com.spring.moon.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.moon.HomeController;
import com.spring.moon.service.TestService;

@Controller
public class TestController {

	@Autowired
	TestService testService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/test")
	public String home(Model model) {
		logger.info("!!");
		
		model.addAttribute("testList", testService.searchList());

		return "test";
	}
}
