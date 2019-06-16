package com.spring.moon.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.spring.moon.dao.BoardDAO;
import com.spring.moon.dto.BoardDTO;
import com.spring.moon.dto.Criteria;

@Repository
public class BoardDAOlmpl implements BoardDAO{

	@Autowired
	private SqlSession sqlSession;


	@Override
	public List<BoardDTO> listAll(int start, int end, String searchOption, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("board.listAll", map);
	}
	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("board.countArticle", map);
	}
	
	public List<BoardDTO> listPage(int page) throws Exception {
		if (page <= 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		return sqlSession.selectList("board.listPage", page);
	}



	@Override
	public List<BoardDTO> listCriteria(Criteria cri) throws Exception {
		return sqlSession.selectList("board.listCriteria", cri);
	}
	@Override
	public int countPaging(Criteria cri) throws Exception {
		return sqlSession.selectOne("board.countPaging", cri);
	}
	
	@Override
	public void create(BoardDTO vo) throws Exception {
		sqlSession.insert("board.insert", vo);
	}
	
	@Override
	public void addAttach(String fullName) {
		sqlSession.insert("board.addAttach", fullName);
	}
	
	@Override
	public BoardDTO read(int bno) throws Exception {
		return sqlSession.selectOne("board.view", bno);
	}
	@Override
	public void update(BoardDTO vo) throws Exception {
		sqlSession.update("board.updateArticle", vo);

	}

	@Override
	public void delete(BoardDTO vo) throws Exception {
		sqlSession.delete("board.deleteArticle",vo);

	}

	@Override
	public void increaseViewcnt(int bno) throws Exception {
		sqlSession.update("board.increaseViewcnt", bno);
	}

	@Override
	public List<String> getAttach(int bno) {
		return sqlSession.selectList("board.getAttach", bno);
	}

	@Override
	public void deleteFile(String fullname) {
		sqlSession.delete("board.deleteAttach", fullname);
	}

	@Override
	public void updateAttach(String fullName, int bno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fullName", fullName);
		map.put("bno", bno);
		sqlSession.insert("board.updateAttach", map);
		
	}
	
	@Override
	public BoardDTO selectBoard(BoardDTO boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardView", boardVo);
	}
	
	@Override
	public int boardInsert(BoardDTO boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.boardInsert", boardVo);
	}
	
}
