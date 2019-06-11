package com.spring.moon.dao;

import java.util.List;

import com.spring.moon.dto.PatternDTO;

public interface PatternDAO {

	List<PatternDTO> selectPattern();

	int insertPattern(PatternDTO patternDTO);

	int deletePattern(PatternDTO patternDTO);

}
