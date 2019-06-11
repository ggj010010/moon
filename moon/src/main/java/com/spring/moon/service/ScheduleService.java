package com.spring.moon.service;

import java.util.List;

import com.spring.moon.dto.ScheduleDTO;

public interface ScheduleService {

	List<ScheduleDTO> selectSchedule();

	int deleteSchedule(ScheduleDTO scheduleDTO);

}
