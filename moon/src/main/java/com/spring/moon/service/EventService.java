package com.spring.moon.service;

import java.util.List;

import com.spring.moon.dto.EventDTO;

public interface EventService {

	List<EventDTO> selectEvent();
	
	EventDTO selectEventOne(String e_id);

	int insertEvent(EventDTO eventDTO);

	int updateEvent(EventDTO eventDTO);

	int deleteEvent(EventDTO eventDTO);

	int fileNameUpdate(int e_id, String fileName);
}
