package com.spring.moon.service;

import java.util.List;

import com.spring.moon.dto.PatternDTO;

public interface PatternService {

	List<PatternDTO> selectPattern();

	int insertPattern(PatternDTO patternDTO);

	int deletePattern(PatternDTO patternDTO);

}
