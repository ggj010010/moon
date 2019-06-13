package com.spring.moon.service;

import java.util.List;

import com.spring.moon.dto.BoardDTO;

public interface BoardService {

	public int write_bbs(BoardDTO b);
	public List<BoardDTO> bbs_all();
	public BoardDTO get_bbs(BoardDTO b);
}
