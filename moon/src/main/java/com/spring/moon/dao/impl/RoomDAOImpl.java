package com.spring.moon.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.moon.dao.RoomDAO;
import com.spring.moon.dto.RoomDTO;

@Repository
public class RoomDAOImpl implements RoomDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<RoomDTO> selectRoom() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("room.selectRoom");
	}
	
	@Override
	public int insertRoom(RoomDTO roomDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert("room.insertRoom", roomDTO);
	}
	
	@Override
	public int updateRoom(RoomDTO roomDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update("room.updateRoom", roomDTO);
	}
	
	@Override
	public int deleteRoom(RoomDTO roomDTO) {
		// TODO Auto-generated method stub
		return sqlSession.delete("room.deleteRoom", roomDTO);
	}
	
	@Override
	public int fileNameUpdate(RoomDTO roomDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update("room.fileNameUpdate", roomDTO);
	}
}
