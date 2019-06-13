package com.spring.moon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.moon.dao.PatternDetailDAO;
import com.spring.moon.dto.EventDTO;
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
	
	@Override
	public int insertPatternDetail(PatternDetailDTO patternDetailDTO) {
		// TODO Auto-generated method stub
		return patternDetailDAO.insertPatternDetail(patternDetailDTO);
	}
	
	@Override
	public int fileNameUpdate(int pd_id, String fileName) {
		// TODO Auto-generated method stub
		
		PatternDetailDTO patternDetailDTO = new PatternDetailDTO();
		patternDetailDTO.setPd_id(pd_id);
		patternDetailDTO.setPd_img(fileName);
		
		return patternDetailDAO.fileNameUpdate(patternDetailDTO);
	}
	

}
