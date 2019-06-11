package com.spring.moon.Controller;

import java.util.HashMap;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.moon.common.CommonUtil;
import com.spring.moon.dto.PatternDTO;
import com.spring.moon.dto.RoomDTO;
import com.spring.moon.service.PatternService;

@Controller
public class PatternController {
	
	@Autowired
	PatternService patternService;

	private static final Logger logger = LoggerFactory.getLogger(PatternController.class);
	
	@RequestMapping(value = "/pattern/pattern")
	public String selectPattern(Model model) {
		logger.info("selectPattern");

		model.addAttribute("patternList", patternService.selectPattern());

		return "pattern/pattern";
	}
	
	@RequestMapping(value = "/pattern/insertPattern", method = {RequestMethod.GET})
	@ResponseBody
	public String insertPattern(Locale locale, PatternDTO patternDTO) throws Exception {
		logger.info("insertPattern");

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		int resultCnt = patternService.insertPattern(patternDTO);

		System.out.println("insert p_id : " + patternDTO.getP_id());
		result.put("success", (resultCnt > 0) ? "Y" : "N");
		result.put("p_id", Integer.toString(patternDTO.getP_id()));

		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}
	
	@RequestMapping(value = "/pattern/deletePattern", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String productGroupDelete(Locale locale,  PatternDTO patternDTO) throws Exception {
		
		logger.info("deletePattern");
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = patternService.deletePattern(patternDTO);

		result.put("success", (resultCnt > 0) ? "Y" : "N");

		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}
}
