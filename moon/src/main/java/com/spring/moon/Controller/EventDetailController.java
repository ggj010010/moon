package com.spring.moon.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		logger.info("selectEventDetail :: e_id ::" + request.getParameter("e_id"));
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
}
