package com.spring.moon.dao;

import java.util.List;

import com.spring.moon.dto.EventDetailDTO;

public interface EventDetailDAO {

	List<EventDetailDTO> selectEventDetail(String e_id);
	
	EventDetailDTO selectEventDetailOne(String ed_id);
	
	int insertEventDetail(EventDetailDTO eventDetailDTO);

}
