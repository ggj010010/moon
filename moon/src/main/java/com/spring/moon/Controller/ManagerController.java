package com.spring.moon.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerController {


	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	
	@RequestMapping(value = "/manager/managerMoon")
	public String login(Model model) throws Exception {

		return "/Manager/manager";
	}
	
	@RequestMapping(value = "/manager/managerMain")
	public String main(Model model) throws Exception {

		return "/Manager/managerMain";
	}
}
