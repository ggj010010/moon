package com.spring.moon.Controller;

import java.util.HashMap;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.moon.HomeController;
import com.spring.moon.common.CommonUtil;
import com.spring.moon.dto.CustomerDTO;
import com.spring.moon.service.CustomerService;

@Controller
public class CustomerController {

	@Autowired
	CustomerService customerService;
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@RequestMapping(value = "/customer/customer")
	public String selectCustomer(Model model) {
		logger.info("selectCustomer");

		model.addAttribute("customerList", customerService.selectCustomer());

		return "customer/customer";
	}

	@RequestMapping(value = "/customer/deleteCustomer", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String deleteCustomer(Locale locale, CustomerDTO customerDTO) throws Exception {
		System.out.println(customerDTO.getC_id());
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = customerService.deleteCustomer(customerDTO);

		result.put("success", (resultCnt > 0) ? "Y" : "N");

		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}

	

}
