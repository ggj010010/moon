package com.spring.moon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.moon.dao.EventDetailDAO;
import com.spring.moon.dto.EventDetailDTO;
import com.spring.moon.service.EventDetailService;

@Service
public class EventDetailServiceImpl implements EventDetailService {

	@Autowired
	EventDetailDAO eventDetailDAO;
	
	@Override
	public List<EventDetailDTO> selectEventDetail(String e_id) {
		// TODO Auto-generated method stub
		return eventDetailDAO.selectEventDetail(e_id);
	}
	
	@Override
	public int insertEventDetail(EventDetailDTO eventDetailDTO) {
		// TODO Auto-generated method stub
		return eventDetailDAO.insertEventDetail(eventDetailDTO);
	}

}
