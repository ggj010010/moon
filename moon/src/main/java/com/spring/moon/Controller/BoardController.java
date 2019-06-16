package com.spring.moon.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.moon.dto.BoardDTO;
import com.spring.moon.dto.BoardPager;
import com.spring.moon.dto.CustomerDTO;
import com.spring.moon.service.BoardService;
import com.spring.moon.service.ReplyService;

@Controller
public class BoardController {

	@Autowired
	BoardService BoardService;
	@Inject
	ReplyService replyService;
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	/*
	 * @RequestMapping(value = "/write_bbs", method = RequestMethod.GET) public
	 * String write_bbs(HttpSession session) {
	 * 
	 * if (c == null) return "redirect:/"; return "write_bbs"; }
	 */



	@RequestMapping("/board/test2")
	public ModelAndView list(@RequestParam(defaultValue="board_title") String searchOption,
							@RequestParam(defaultValue="") String keyword,
							@RequestParam(defaultValue="1") int curPage) throws Exception{
		int count = BoardService.countArticle(searchOption, keyword);
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		List<BoardDTO> list = BoardService.listAll(start, end, searchOption, keyword);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count); // �젅肄붾뱶�쓽 媛��닔
		map.put("searchOption", searchOption); // 寃��깋�샃�뀡
		map.put("keyword", keyword); // 寃��깋�궎�썙�뱶
		map.put("boardPager", boardPager);
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map); // 留듭뿉 ���옣�맂 �뜲�씠�꽣瑜� mav�뿉 ���옣
		mav.setViewName("board/test2"); // 酉곕�� list.jsp濡� �꽕�젙
		return mav; // list.jsp濡� List媛� �쟾�떖�맂�떎.
	}

	@RequestMapping(value="/board/view", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno, @RequestParam int curPage, @RequestParam String searchOption,
							@RequestParam String keyword, HttpSession session) throws Exception{
		BoardService.increaseViewcnt(bno, session);
		CustomerDTO c = (CustomerDTO) session.getAttribute("c");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/view");
		mav.addObject("count", replyService.count(bno)); 
		mav.addObject("dto", BoardService.read(bno));
		mav.addObject("curPage", curPage);
		mav.addObject("searchOption", searchOption);
		mav.addObject("keyword", keyword);
		logger.info("mav:", mav);
		return mav;
	}
	@RequestMapping(value="board/insert", method=RequestMethod.POST)
	public String insert(@ModelAttribute BoardDTO vo, HttpSession session) throws Exception{
		// session�뿉 ���옣�맂 userId瑜� writer�뿉 ���옣
		String writer = (String) session.getAttribute("c_id");
		// vo�뿉 writer瑜� �꽭�똿
		vo.setBc_id(writer);
		BoardService.create(vo);
		return "redirect:/board/test2";
	}
	
	@RequestMapping(value="/board/update", method=RequestMethod.GET)
	public String update(@ModelAttribute BoardDTO vo) throws Exception{
		BoardService.update(vo);
		return "redirect:/board/test2";
	}
	

	@RequestMapping(value="/board/delete", method=RequestMethod.GET)
	public String delete(@ModelAttribute BoardDTO vo) throws Exception{
		BoardService.delete(vo);
		return "redirect:/board/test2";
	}
	@RequestMapping("/getAttach/{bno}")
	@ResponseBody // view媛� �븘�땶 data瑜� 由ы꽩
	public List<String> getAttach(@PathVariable("bno") int bno){
		return BoardService.getAttach(bno);
	}
	@RequestMapping(value="/board/write", method=RequestMethod.GET)
	public String write(){
		return "board/write"; // write.jsp濡� �씠�룞
	}
	
}
