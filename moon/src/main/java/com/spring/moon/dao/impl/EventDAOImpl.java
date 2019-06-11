package com.spring.moon.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.moon.dao.EventDAO;
import com.spring.moon.dto.EventDTO;

@Repository
public class EventDAOImpl implements EventDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<EventDTO> selectEvent() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("event.selectEvent");
	}
	
	@Override
	public int insertEvent(EventDTO eventDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert("event.insertEvent",eventDTO);
	}
	
	@Override
	public int updateEvent(EventDTO eventDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update("event.updateEvent",eventDTO);
	}
	
	@Override
	public int deleteEvent(EventDTO eventDTO) {
		// TODO Auto-generated method stub
		return sqlSession.delete("event.deleteEvent",eventDTO);
	}
	
	@Override
	public int fileNameUpdate(EventDTO eventDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update("event.fileNameUpdate",eventDTO);
	}
}
