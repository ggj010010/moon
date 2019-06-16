package com.spring.moon.service.impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.spring.moon.dao.ReplyDAO;
import com.spring.moon.dto.ReplyVO;
import com.spring.moon.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	ReplyDAO replyDao;

	// 1. ?Œ“ê¸? ?…? ¥
	@Override
	public void create(ReplyVO vo) {
		replyDao.create(vo);
	}
	// 2. ?Œ“ê¸? ëª©ë¡
	@Override
	public List<ReplyVO> list(Integer bno, int start, int end, HttpSession session) {
		List<ReplyVO> items = replyDao.list(bno, start, end);
		// ?„¸?…˜?—?„œ ?˜„?¬ ?‚¬?š©? idê°? ???¥
		String userId = (String) session.getAttribute("userId");
		for(ReplyVO vo : items){
			// ?Œ“ê¸? ëª©ë¡ì¤‘ì— ì¤‘ì— ë¹„ë? ?Œ“ê¸??´ ?ˆ?„ ê²½ìš°
			if(vo.getSecretReply().equals("y")){
				if(userId== null){ // ë¹„ë¡œê·¸ì¸ ?ƒ?ƒœë©? ë¹„ë? ?Œ“ê¸?ë¡? ì²˜ë¦¬
					vo.setReplytext("ë¹„ë? ?Œ“ê¸??…?‹ˆ?‹¤.");
				} else { // ë¡œê·¸?¸ ?ƒ?ƒœ?¼ ê²½ìš°
					String writer = vo.getWriter(); // ê²Œì‹œë¬? ?‘?„±? ???¥
					String replyer = vo.getReplyer(); // ?Œ“ê¸? ?‘?„±? ???¥
					// ë¡œê·¸?¸?•œ ?‚¬?š©?ê°? ê²Œì‹œë¬¼ì˜ ?‘?„±?X ?Œ“ê¸? ?‘?„±??„ X ë¹„ë??Œ“ê¸?ë¡? ì²˜ë¦¬
					if(!userId.equals(writer) && !userId.equals(replyer)) {
						vo.setReplytext("ë¹„ë? ?Œ“ê¸??…?‹ˆ?‹¤.");
					}
				}
			}
		}
		return items; 
	}
	// 3. ?Œ“ê¸? ?ƒ?„¸ë³´ê¸°
	@Override
	public ReplyVO detail(Integer rno) {
		return replyDao.detail(rno);
	}
	// 4. ?Œ“ê¸? ?ˆ˜? •
	@Override
	public void update(ReplyVO vo) {
		replyDao.update(vo);
	}
	// 5. ?Œ“ê¸? ?‚­? œ
	@Override
	public void delete(Integer rno) {
		replyDao.delete(rno);
	}
	// 6. ?Œ“ê¸? ê°??ˆ˜
	@Override
	public int count(Integer bno) {
		return replyDao.count(bno);
	}
}
