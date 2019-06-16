package com.spring.moon.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.moon.dto.BoardDTO;
import com.spring.moon.dto.Criteria;

public interface BoardService {


	public List<BoardDTO> listAll(int start, int end, String searchOption, String keyword) throws Exception;
	public int countArticle(String searchOption, String keyword) throws Exception;

	public List<BoardDTO> listCriteria(Criteria cri) throws Exception; // 페이징 계산용
	public int listCountCriteria(Criteria cri) throws Exception; // DB의 데이터 카운팅을 위한 메소드
	
	public void create(BoardDTO vo) throws Exception;
	// 02. 
	public BoardDTO read(int bno) throws Exception;
	// 03. 
	public void update(BoardDTO vo) throws Exception;
	// 04. 
	public void delete(BoardDTO vo) throws Exception;
	// 05. 
	public void increaseViewcnt(int bno, HttpSession session) throws Exception;

	public List<String> getAttach(int bno);
	// 09. 
	public void deleteFile(String fullname);
	
	public BoardDTO selectBoard(int boardNum) throws Exception;
	public int boardInsert(BoardDTO boardVo) throws Exception;
}
