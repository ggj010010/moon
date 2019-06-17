package com.spring.moon.dao;

import java.util.List;

import com.spring.moon.dto.ReplyVO;

public interface ReplyDAO {
	// 1. ?Œ“ê¸? ?…? ¥
	public void create(ReplyVO vo);
	// 2. ?Œ“ê¸? ëª©ë¡
	public List<ReplyVO> list(Integer bno, int start, int end);
	// 3. ?Œ“ê¸? ?ƒ?„¸ë³´ê¸°
	public ReplyVO detail(Integer rno);
	// 4. ?Œ“ê¸? ?ˆ˜? •
	public void update(ReplyVO vo);
	// 5. ?Œ“ê¸? ?‚­? œ
	public void delete(Integer rno);
	
	public int reply_delete(ReplyVO vo);
	// 6. ?Œ“ê¸? ê°??ˆ˜
	public int count(Integer bno);
}
