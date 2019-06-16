package com.spring.moon.Controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.moon.dto.ReplyPager;
import com.spring.moon.dto.ReplyVO;
import com.spring.moon.service.ReplyService;


// REST : Representational State Transfer
// ?��?��?�� URI�? ?��?��?�� 고유?�� 리소?���? ???��?��?���? ?��계된 개념

// http://localhost/spring02/list?bno=1 ==> url+?��?��미터
// http://localhost/spring02/list/1 ==> url
// RestController?? ?��?���? 4.0�??�� �??��
// @Controller, @RestController 차이?��?? 메서?���? 종료?���? ?��면전?��?�� ?���?

@Controller

@RequestMapping("/reply/*")
public class ReplyController {
	
	@Inject
	ReplyService replyService;
	
	// 1_1. ?���? ?��?��(@Controller방식?���? ?���? ?��?��)
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public void insert(@ModelAttribute ReplyVO vo, HttpSession session){
		// ?��?��?�� ???��?�� ?��?��?��?��?���? ?���??��?��?��?�� ?��?��
		String userId = (String) session.getAttribute("c_id");
		vo.setReplyer(userId);
		// ?���? ?��?�� 메서?�� ?���?
		replyService.create(vo);
		
	}
	
	// 1_2. ?���??��?�� (@RestController방식?���? json?��?��?��?�� ?���??��?��)
	// @ResponseEntity : ?��?��?�� + http status code
	// @ResponseBody : 객체�? json?���? (json - String)
	// @RequestBody : json?�� 객체�?
	@RequestMapping(value="insertRest", method=RequestMethod.POST)
	public ResponseEntity<String> insertRest(@RequestBody ReplyVO vo, HttpSession session){
		ResponseEntity<String> entity = null;
		try {
			String userId = (String) session.getAttribute("c_id");
			vo.setReplyer(userId);
			replyService.create(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 2_1. ?���? 목록(@Controller방식 : veiw(?���?)�? 리턴)
	@RequestMapping("list")
	public ModelAndView list(@RequestParam int bno,	@RequestParam(defaultValue="1") int curPage, ModelAndView mav, HttpSession session){
		// ?��?���? 처리 
		int count = replyService.count(bno); // ?���? �??��
		ReplyPager replyPager = new ReplyPager(count, curPage);
		// ?��?�� ?��?���??�� ?��?���? ?��?�� 번호
		int start = replyPager.getPageBegin();
		// ?��?�� ?��?���??�� ?��?���?  ?�� 번호
		int end = replyPager.getPageEnd();
		List<ReplyVO> list = replyService.list(bno, start, end, session);
		// 뷰이�? �??��
		mav.setViewName("board/replyList");
		// 뷰에 ?��?��?�� ?��?��?�� �??��
		mav.addObject("list", list);
		mav.addObject("replyPager", replyPager);
		// replyList.jsp�? ?��?��?��
		return mav;
	}
	
	// 2_2. ?���? 목록(@RestController방식 : Json?���? ?��?��?���? 리턴)
	@RequestMapping("listJson")
	@ResponseBody // 리턴?��?��?���? json?���? �??��(RestController?��?��?�� @ResponseBody?��?���??��)
	public List<ReplyVO> listJson(@RequestParam int bno, @RequestParam(defaultValue="1") int curPage, HttpSession session){
		// ?��?���? 처리
		int count = replyService.count(bno); // ?���? �??��
		ReplyPager pager = new ReplyPager(count, curPage);
		// ?��?�� ?��?���??�� ?��?���? ?��?�� 번호
		int start = pager.getPageBegin();
		// ?��?�� ?��?���??�� ?��?���?  ?�� 번호
		int end = pager.getPageEnd();
		List<ReplyVO> list = replyService.list(bno, start, end, session);
		// list�? 리턴
		return list;
	}
	
	// ** Controller 추�? ?��?�� - Rest방식?���? ?���? 목록, ?��?��, ?��?�� 처리
	
	// 2_3. ?���? 목록(@RestController방식 :  json?���? ?��?��?��?�� 목록?��?��)
	// /reply/list/1 => 1�? 게시물의 ?���? 목록 리턴
	// /reply/list/2 => 2�? 게시물의 ?���? 목록 리턴
	// @PathVariable : url?�� ?��?��?�� �??���? �??��
	@RequestMapping(value="/list/{bno}/{curPage}", method=RequestMethod.GET)
	public ModelAndView replyList(@PathVariable("bno") int bno, @PathVariable int curPage, ModelAndView mav, HttpSession session){
		// ?��?���? 처리
		int count = replyService.count(bno); // ?���? �??��
		ReplyPager replyPager = new ReplyPager(count, curPage);
		// ?��?�� ?��?���??�� ?��?���? ?��?�� 번호
		int start = replyPager.getPageBegin();
		// ?��?�� ?��?���??�� ?��?���?  ?�� 번호
		int end = replyPager.getPageEnd();
		List<ReplyVO> list = replyService.list(bno, start, end, session);
		// 뷰이�? �??��
		mav.setViewName("board/replyList");
		// 뷰에 ?��?��?�� ?��?��?�� �??��
		mav.addObject("list", list);
		mav.addObject("replyPager", replyPager);
		// replyList.jsp�? ?��?��?��
		return mav;
	}
	
	// 3. ?���? ?��?�� 보기
	// /reply/detail/1 => 1�? ?���??�� ?��?��?���? 리턴
	// /reply/detail/2 => 2�? ?���??�� ?��?��?���? 리턴
	// @PathVariable : url?�� ?��?��?�� �??���? �??��
	@RequestMapping(value="/detail/{rno}", method=RequestMethod.GET)
	public ModelAndView replyDetail(@PathVariable("rno") Integer rno, ModelAndView mav){
		ReplyVO vo = replyService.detail(rno);
		// 뷰이�? �??��
		mav.setViewName("board/replyDetail");
		// 뷰에 ?��?��?�� ?��?��?�� �??��
		mav.addObject("vo", vo);
		// replyDetail.jsp�? ?��?��?��
		return mav;
	}
	
	// 4. ?���? ?��?�� 처리 - PUT:?���? ?��?��, PATCH:?���??��?��
	// RequestMethod�? ?��?�� 방식?���? ?��?��?�� 경우 {}?��?�� ?��?��
	@RequestMapping(value="/update/{rno}", method={RequestMethod.POST})
	public ResponseEntity<String> replyUpdate(@PathVariable("rno") Integer rno, @RequestBody ReplyVO vo){
		ResponseEntity<String> entity = null;
		try {
			vo.setRno(rno);
			replyService.update(vo);
			// ?���? ?��?��?�� ?��공하�? ?���? ?��?��메시�? ???��
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			// ?���? ?��?��?�� ?��?��?���? ?��?�� ?��?��메시�? ???��
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// ?��?�� 처리 HTTP ?��?�� 메시�? 리턴
		return entity;
	}
	
	// 5. ?���? ?��?��처리
	@RequestMapping(value="/delete/{rno}")
	public ResponseEntity<String> replyDelete(@PathVariable("rno") Integer rno){
		ResponseEntity<String> entity = null;
		try {
			replyService.delete(rno);
			// ?���? ?��?���? ?��공하�? ?���? ?��?��메시�? ???��
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			// ?���? ?��?���? ?��?��?���? ?��?�� ?��?��메시�? ???��
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// ?��?�� 처리 HTTP ?��?�� 메시�? 리턴
		return entity;
	}
}
