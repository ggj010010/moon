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

	// 1. ?���? ?��?��
	@Override
	public void create(ReplyVO vo) {
		replyDao.create(vo);
	}
	// 2. ?���? 목록
	@Override
	public List<ReplyVO> list(Integer bno, int start, int end, HttpSession session) {
		List<ReplyVO> items = replyDao.list(bno, start, end);
		// ?��?��?��?�� ?��?�� ?��?��?�� id�? ???��
		String userId = (String) session.getAttribute("userId");
		for(ReplyVO vo : items){
			// ?���? 목록중에 중에 비�? ?���??�� ?��?�� 경우
			if(vo.getSecretReply().equals("y")){
				if(userId== null){ // 비로그인 ?��?���? 비�? ?���?�? 처리
					vo.setReplytext("비�? ?���??��?��?��.");
				} else { // 로그?�� ?��?��?�� 경우
					String writer = vo.getWriter(); // 게시�? ?��?��?�� ???��
					String replyer = vo.getReplyer(); // ?���? ?��?��?�� ???��
					// 로그?��?�� ?��?��?���? 게시물의 ?��?��?��X ?���? ?��?��?��?�� X 비�??���?�? 처리
					if(!userId.equals(writer) && !userId.equals(replyer)) {
						vo.setReplytext("비�? ?���??��?��?��.");
					}
				}
			}
		}
		return items; 
	}
	// 3. ?���? ?��?��보기
	@Override
	public ReplyVO detail(Integer rno) {
		return replyDao.detail(rno);
	}
	// 4. ?���? ?��?��
	@Override
	public void update(ReplyVO vo) {
		replyDao.update(vo);
	}
	// 5. ?���? ?��?��
	@Override
	public void delete(Integer rno) {
		replyDao.delete(rno);
	}
	// 6. ?���? �??��
	@Override
	public int count(Integer bno) {
		return replyDao.count(bno);
	}
	@Override
	public int reply_delete(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyDao.reply_delete(vo);
	}
}
