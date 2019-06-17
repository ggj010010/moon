package com.spring.moon;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.moon.dto.PagingDTO;
import com.spring.moon.dto.RoomDTO;
import com.spring.moon.dto.ScheduleDTO;
import com.spring.moon.service.RoomService;
import com.spring.moon.service.ScheduleService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	RoomService roomService;
	@Autowired
	ScheduleService scheduleService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("roomList", roomService.selectRoom());
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	@RequestMapping(value = "/check")
	public String check(Model model,ScheduleDTO scheduleDTO,HttpSession session) throws Exception {
		if(session.getAttribute("c_id").equals(scheduleDTO.getC_id())) {
			logger.info("c_id : " + scheduleDTO.getC_id());
			List<ScheduleDTO> sd = new ArrayList<ScheduleDTO>();
			sd = scheduleService.selectScheduleList(scheduleDTO);
			logger.info("sd : " + sd + " size : " + sd.size());
			model.addAttribute("scheduleList",sd);
		}
		
		return "/check";
	}
	@RequestMapping(value = "/room")
	public String room(Model model,PagingDTO pagingDTO) throws Exception {
		logger.info("room :: page :: " + pagingDTO.getPageNo());
 		int pageNo = 1;
		
 		if(pagingDTO.getPageNo() <= 0 ) {
 			pagingDTO.setPageNo(pageNo);
 		}
		
		model.addAttribute("roomList", roomService.selectRoomView(pagingDTO));
		model.addAttribute("totalCnt", roomService.selectRoomView(pagingDTO).get(0).getPagingDTO().getTotalCnt());
		model.addAttribute("pageNo", pagingDTO.getPageNo());
		
		return "room";
	}
	@RequestMapping(value = "/roomdetail")
	public String roomdetail(Model model,RoomDTO roomDTO) throws Exception {
		logger.info("roomdetail :: r_id :: " + roomDTO.getR_id());
		
		model.addAttribute("roomDetail", roomService.selectRoomOne(roomDTO));
		
		return "roomdetail";
	}
	@RequestMapping(value = "/locate")
	public String locate(Model model) throws Exception {

		return "locate";
	}
	
}
