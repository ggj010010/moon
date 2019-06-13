package com.spring.moon.service;

import java.util.List;

import com.spring.moon.dto.PatternDetailDTO;

public interface PatternDetailService {

	List<PatternDetailDTO> selectPatternDetail(String ed_id);

	int insertPatternDetail(PatternDetailDTO patternDetailDTO);

	int fileNameUpdate(int pd_id, String fileName);

}
