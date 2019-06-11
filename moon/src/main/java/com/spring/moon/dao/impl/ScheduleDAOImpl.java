package com.spring.moon.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.moon.dao.ScheduleDAO;
import com.spring.moon.dto.ScheduleDTO;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ScheduleDTO> selectSchedule() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("schedule.selectSchedule");
	}
	
	@Override
	public int deleteSchedule(ScheduleDTO scheduleDTO) {
		// TODO Auto-generated method stub
		return sqlSession.delete("schedule.deleteSchedule",scheduleDTO);
	}

}
