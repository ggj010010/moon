package com.spring.moon.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.moon.common.CommonUtil;
import com.spring.moon.dto.EventDetailDTO;
import com.spring.moon.dto.PatternDetailDTO;
import com.spring.moon.service.EventDetailService;
import com.spring.moon.service.PatternDetailService;

@Controller
public class PatternDetailController {
	
	@Autowired
	EventDetailService eventDetailService;
	@Autowired
	PatternDetailService patternDetailService;

	private static final Logger logger = LoggerFactory.getLogger(PatternDetailController.class);

	@RequestMapping("/pattern/patternDetail")
	@ResponseBody
	public String selectPatternDetail(Model model,EventDetailDTO ed) throws Exception{
		logger.info("selectPatternDetail");
		
		HashMap<String, Object> result = new HashMap<String,Object>();
		CommonUtil commonUtil = new CommonUtil(); 
		
		EventDetailDTO eventDetailDTO = new EventDetailDTO();
		List<PatternDetailDTO> patternDetailList = new ArrayList<PatternDetailDTO>();
		
		eventDetailDTO = eventDetailService.selectEventDetailOne(String.valueOf(ed.getEd_id()));
		patternDetailList = patternDetailService.selectPatternDetail(String.valueOf(ed.getEd_id()));
		
		model.addAttribute("eventDetailDTO",eventDetailDTO);
		model.addAttribute("patternDetailList",patternDetailList);

		result.put("eventDetailDTO",eventDetailDTO);
		result.put("patternDetailList",patternDetailList);
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
}
