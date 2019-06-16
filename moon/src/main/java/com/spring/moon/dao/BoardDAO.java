package com.spring.moon.dao;

import java.util.List;
import com.spring.moon.dto.BoardDTO;
import com.spring.moon.dto.Criteria;

public interface BoardDAO {

	public List<BoardDTO> listAll(int start, int end, String searchOption, String keyword) throws Exception;
	public int countArticle(String searchOption, String keyword) throws Exception;
	
	public List<BoardDTO> listPage(int page) throws Exception;
	public List<BoardDTO> listCriteria(Criteria cri) throws Exception;
	public int countPaging(Criteria cri) throws Exception;
	
	public void create(BoardDTO vo) throws Exception;
	public BoardDTO read(int bno) throws Exception;
	public void update(BoardDTO vo) throws Exception;
	public void delete(BoardDTO vo) throws Exception;
	public void increaseViewcnt(int bno) throws Exception;
	public void addAttach(String fullName);
	public List<String> getAttach(int bno);
	public void deleteFile(String fullname);
	public void updateAttach(String fullName, int bno);
	
	public BoardDTO selectBoard(BoardDTO boardVo) throws Exception;
	public int boardInsert(BoardDTO boardVo) throws Exception;
}
