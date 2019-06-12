package com.spring.moon.dao;

import java.util.List;

import com.spring.moon.dto.PatternDetailDTO;

public interface PatternDetailDAO {

	List<PatternDetailDTO> selectPatternDetail(String ed_id);

}
