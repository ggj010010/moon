package com.spring.moon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.moon.dao.PatternDetailDAO;
import com.spring.moon.dto.PatternDetailDTO;
import com.spring.moon.service.PatternDetailService;

@Service
public class PatternDetailServiceImpl implements PatternDetailService {
	
	@Autowired
	PatternDetailDAO patternDetailDAO;
	
	@Override
	public List<PatternDetailDTO> selectPatternDetail(String ed_id) {
		// TODO Auto-generated method stub
		return patternDetailDAO.selectPatternDetail(ed_id);
	}
	

}
