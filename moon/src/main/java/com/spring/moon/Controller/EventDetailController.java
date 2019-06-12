package com.spring.moon.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.moon.common.CommonUtil;
import com.spring.moon.dto.EventDTO;
import com.spring.moon.dto.EventDetailDTO;
import com.spring.moon.dto.PatternDTO;
import com.spring.moon.service.EventDetailService;
import com.spring.moon.service.EventService;
import com.spring.moon.service.PatternService;

@Controller
public class EventDetailController {
	
	@Autowired
	EventService eventService;
	@Autowired
	PatternService patternService;
	@Autowired
	EventDetailService eventDetailService;
	
	private static final Logger logger = LoggerFactory.getLogger(EventDetailController.class);

	@RequestMapping("/event/eventDetail")
	public String selectEventDetail(Model model,HttpServletRequest request) {
		logger.info("selectEventDetail");
		EventDTO eventDTO = new EventDTO();
		List<PatternDTO> patternList = new ArrayList<PatternDTO>();
		List<EventDetailDTO> eventDetailList = new ArrayList<EventDetailDTO>();
		
		String e_id = request.getParameter("e_id");
		eventDTO = eventService.selectEventOne(e_id);
		patternList = patternService.selectPattern();
		eventDetailList = eventDetailService.selectEventDetail(e_id);
		
		model.addAttribute("eventDTO",eventDTO);
		model.addAttribute("patternList",patternList);
		model.addAttribute("eventDetailList",eventDetailList);

		return "/event/eventDetail";
	}
	
	@RequestMapping(value="/event/insertEventDetail",method = RequestMethod.POST)
	@ResponseBody
	public String insertEventDetail(EventDetailDTO eventDetailDTO
			,HttpServletRequest request) throws Exception{
		logger.info("selectEventDetail :: p_sort ::"+ request.getParameter("p_sort"));

		HashMap<String, String> result = new HashMap<String, String>();
		
		CommonUtil commonUtil = new CommonUtil(); 
		
		String p_sort = request.getParameter("p_sort");
		if(p_sort == "0") {
			p_sort = "1";
		}
		
		eventDetailDTO.setP_sort(Integer.parseInt(p_sort));
		
		int resultCnt = eventDetailService.insertEventDetail(eventDetailDTO);
		result.put("success", (resultCnt > 0)?"Y":"N");
		result.put("e_id", Integer.toString(eventDetailDTO.getE_id()));
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
}
