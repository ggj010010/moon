package com.spring.moon.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.moon.dao.PatternDetailDAO;
import com.spring.moon.dto.PatternDetailDTO;

@Repository
public class PatternDetailDAOImpl implements PatternDetailDAO{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<PatternDetailDTO> selectPatternDetail(String ed_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("patternDetail.selectPatternDetail",ed_id);
	}
}
