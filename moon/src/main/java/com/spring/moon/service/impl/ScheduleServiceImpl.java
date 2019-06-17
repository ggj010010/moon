package com.spring.moon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.moon.dao.ScheduleDAO;
import com.spring.moon.dto.ScheduleDTO;
import com.spring.moon.service.ScheduleService;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	ScheduleDAO scheduleDAO;
	
	@Override
	public List<ScheduleDTO> selectSchedule() {
		// TODO Auto-generated method stub
		return scheduleDAO.selectSchedule();
	}
	
	@Override
	public List<ScheduleDTO> selectScheduleList(ScheduleDTO scheduleDTO) {
		// TODO Auto-generated method stub
		return  scheduleDAO.selectScheduleList(scheduleDTO);
	}
	
	@Override
	public int insertSchedule(ScheduleDTO scheduleDTO) {
		// TODO Auto-generated method stub
		return scheduleDAO.insertSchedule(scheduleDTO);
	}
	
	@Override
	public int deleteSchedule(ScheduleDTO scheduleDTO) {
		// TODO Auto-generated method stub
		return scheduleDAO.deleteSchedule(scheduleDTO);
	}

}
