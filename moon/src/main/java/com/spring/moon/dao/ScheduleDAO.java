package com.spring.moon.dao;

import java.util.List;

import com.spring.moon.dto.ScheduleDTO;

public interface ScheduleDAO {

	List<ScheduleDTO> selectSchedule();

	int deleteSchedule(ScheduleDTO scheduleDTO);

}
