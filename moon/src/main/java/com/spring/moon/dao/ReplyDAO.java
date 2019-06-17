package com.spring.moon.dao;

import java.util.List;

import com.spring.moon.dto.ReplyVO;

public interface ReplyDAO {
	// 1. ?���? ?��?��
	public void create(ReplyVO vo);
	// 2. ?���? 목록
	public List<ReplyVO> list(Integer bno, int start, int end);
	// 3. ?���? ?��?��보기
	public ReplyVO detail(Integer rno);
	// 4. ?���? ?��?��
	public void update(ReplyVO vo);
	// 5. ?���? ?��?��
	public void delete(Integer rno);
	
	public int reply_delete(ReplyVO vo);
	// 6. ?���? �??��
	public int count(Integer bno);
}
