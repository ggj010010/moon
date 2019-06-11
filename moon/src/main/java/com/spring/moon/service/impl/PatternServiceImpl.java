package com.spring.moon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.moon.dao.PatternDAO;
import com.spring.moon.dto.PatternDTO;
import com.spring.moon.service.PatternService;

@Service
public class PatternServiceImpl implements PatternService {
	
	@Autowired
	PatternDAO patternDAO;
	
	@Override
	public List<PatternDTO> selectPattern() {
		// TODO Auto-generated method stub
		return patternDAO.selectPattern();
	}
	
	@Override
	public int insertPattern(PatternDTO patternDTO) {
		// TODO Auto-generated method stub
		return patternDAO.insertPattern(patternDTO);
	}
	
	@Override
	public int deletePattern(PatternDTO patternDTO) {
		// TODO Auto-generated method stub
		return patternDAO.deletePattern(patternDTO);
	}

}
