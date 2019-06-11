package com.spring.moon.dao;

import java.util.List;

import com.spring.moon.dto.EventDTO;

public interface EventDAO {

	List<EventDTO> selectEvent();

	int insertEvent(EventDTO eventDTO);

	int updateEvent(EventDTO eventDTO);

	int deleteEvent(EventDTO eventDTO);

	int fileNameUpdate(EventDTO eventDTO);

}
