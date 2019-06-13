package com.spring.moon.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.moon.dto.BoardDTO;
import com.spring.moon.dto.CustomerDTO;
import com.spring.moon.service.BoardService;



@Controller
public class BoardController {

	@Autowired
	BoardService BoardService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value = "/write_bbs", method = RequestMethod.GET)
	public String write_bbs(HttpSession session) {
		CustomerDTO c = (CustomerDTO) session.getAttribute("c");
		if(c == null) return "redirect:/";
		return "write_bbs";
	}
	@RequestMapping(value = "/board/test2")
	public String login(Model model) throws Exception {

		return "board/test2";
	}
	@ResponseBody
	@RequestMapping(value = "/write_bbs", method = RequestMethod.POST)
	public int write_bbs(BoardDTO b, HttpSession session) {
		CustomerDTO c = (CustomerDTO) session.getAttribute("u");
		if(c == null) return -1;
		b.setBc_id(c.getC_id());
		return BoardService.write_bbs(b);
	}
//	
	@ResponseBody
	@RequestMapping(value = "/bbs_all", method = RequestMethod.GET)
	public List<BoardDTO> bbs_all() {
		return BoardService.bbs_all();
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/get_bbs", method = RequestMethod.GET)
//	public BoardDTO get_bbs(BoardDTO b) {
//		return b_dao.get_bbs(b);
//	}
}
