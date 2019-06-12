package com.spring.moon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.moon.dao.EventDAO;
import com.spring.moon.dto.EventDTO;
import com.spring.moon.dto.RoomDTO;
import com.spring.moon.service.EventService;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	EventDAO eventDAO;
	
	@Override
	public List<EventDTO> selectEvent() {
		// TODO Auto-generated method stub
		return eventDAO.selectEvent();
	}
	
	@Override
	public EventDTO selectEventOne(String e_id) {
		// TODO Auto-generated method stub
		return eventDAO.selectEventOne(e_id);
	}
	
	@Override
	public int insertEvent(EventDTO eventDTO) {
		// TODO Auto-generated method stub
		return eventDAO.insertEvent(eventDTO);
	}
	
	@Override
	public int updateEvent(EventDTO eventDTO) {
		// TODO Auto-generated method stub
		return eventDAO.updateEvent(eventDTO);
	}
	
	@Override
	public int deleteEvent(EventDTO eventDTO) {
		// TODO Auto-generated method stub
		return eventDAO.deleteEvent(eventDTO);
	}
	
	@Override
	public int fileNameUpdate(int e_id, String fileName) {
		// TODO Auto-generated method stub
		
		EventDTO eventDTO = new EventDTO();
		eventDTO.setE_id(e_id);
		eventDTO.setE_img(fileName);
		
		return eventDAO.fileNameUpdate(eventDTO);
	}

}
