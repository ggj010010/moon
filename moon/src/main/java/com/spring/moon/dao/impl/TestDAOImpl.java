package com.spring.moon.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.moon.dao.TestDAO;
import com.spring.moon.dto.TestDTO;

@Repository
public class TestDAOImpl implements TestDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<TestDTO> searchList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("moon.selectList");
	}
}
