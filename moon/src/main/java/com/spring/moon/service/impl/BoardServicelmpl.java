package com.spring.moon.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.moon.dao.BoardDAO;
import com.spring.moon.dto.BoardDTO;
import com.spring.moon.service.BoardService;

@Service
public class BoardServicelmpl implements BoardService{

	@Autowired
	BoardDAO BoardDAO;
	
	@Override
	public int write_bbs(BoardDTO b) {
		// TODO Auto-generated method stub
		return BoardDAO.write_bbs(b);
	}

	@Override
	public List<BoardDTO> bbs_all() {
		// TODO Auto-generated method stub
		return BoardDAO.bbs_all();
	}

	@Override
	public BoardDTO get_bbs(BoardDTO b) {
		// TODO Auto-generated method stub
		return BoardDAO.get_bbs(b);
	}

	
}
