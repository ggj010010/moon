package com.spring.moon.dao;

import java.util.List;

import com.spring.moon.dto.BoardDTO;

public interface BoardDAO {

	public int write_bbs(BoardDTO b);
	public List<BoardDTO> bbs_all();
	public BoardDTO get_bbs(BoardDTO b);
	
}
