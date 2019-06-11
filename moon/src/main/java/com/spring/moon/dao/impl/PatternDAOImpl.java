package com.spring.moon.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.moon.dao.PatternDAO;
import com.spring.moon.dto.PatternDTO;

@Repository
public class PatternDAOImpl implements PatternDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<PatternDTO> selectPattern() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("pattern.selectPattern");
	}
	
	@Override
	public int insertPattern(PatternDTO patternDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert("pattern.insertPattern", patternDTO);
	}
	
	@Override
	public int deletePattern(PatternDTO patternDTO) {
		// TODO Auto-generated method stub
		return sqlSession.delete("pattern.deletePattern", patternDTO);
	}

}
