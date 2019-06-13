package com.spring.moon.service;

import java.util.List;

import com.spring.moon.dto.EventDetailDTO;

public interface EventDetailService {

	List<EventDetailDTO> selectEventDetail(String e_id);
	
	EventDetailDTO selectEventDetailOne(String ed_id);

	int insertEventDetail(EventDetailDTO eventDetailDTO);

	int sortChange(EventDetailDTO eventDetailDTO);

}
