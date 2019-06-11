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
import com.spring.moon.dto.CustomerDTO;
import com.spring.moon.dto.ScheduleDTO;
import com.spring.moon.service.ScheduleService;

@Controller
public class ScheduleController {
	
	@Autowired
	ScheduleService scheduleService;
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	@RequestMapping(value = "/schedule/schedule")
	public String selectSchedule(Model model) {
		logger.info("selectSchedule");

		model.addAttribute("scheduleList", scheduleService.selectSchedule());

		return "schedule/schedule";
	}
	
	@RequestMapping(value = "/schedule/deleteSchedule", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String deleteSchedule(Locale locale, ScheduleDTO scheduleDTO) throws Exception {
		System.out.println(scheduleDTO.getS_id());
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = scheduleService.deleteSchedule(scheduleDTO);

		result.put("success", (resultCnt > 0) ? "Y" : "N");

		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}

}
