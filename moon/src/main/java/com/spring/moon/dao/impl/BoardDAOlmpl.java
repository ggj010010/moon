package com.spring.moon.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.moon.dao.BoardDAO;
import com.spring.moon.dto.BoardDTO;

@Repository
public class BoardDAOlmpl implements BoardDAO{

	@Autowired
	private SqlSession sqlSession;
	@Override
	public int write_bbs(BoardDTO b) {
		try {
			sqlSession.insert("board.write_bbs", b);
			return 0;
		}
		catch (Exception e) {
			e.printStackTrace();
			return 1;
		}
	}
	@Override
	public List<BoardDTO> bbs_all(){
		try {
			return sqlSession.selectList("board.bbs_all");
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public BoardDTO get_bbs(BoardDTO b){
		//시도
		try {
			//리스트로 받은 게시글을 리턴
			return sqlSession.selectOne("board.get_bbs", b);
		}
		catch (Exception e) {
			//오류 로그 출력
			e.printStackTrace();
			//오류시 널 출력
			return null;
		}
	}
}
