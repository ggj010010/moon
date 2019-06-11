package com.spring.moon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.moon.dao.RoomDAO;
import com.spring.moon.dto.RoomDTO;
import com.spring.moon.service.RoomService;

@Service
public class RoomServiceImpl implements RoomService{

	@Autowired
	RoomDAO roomDAO;
	
	@Override
	public List<RoomDTO> selectRoom() {
		// TODO Auto-generated method stub
		return roomDAO.selectRoom();
	}
	
	@Override
	public int insertRoom(RoomDTO roomDTO) {
		// TODO Auto-generated method stub
		return roomDAO.insertRoom(roomDTO);
	}
	
	@Override
	public int updateRoom(RoomDTO roomDTO) {
		// TODO Auto-generated method stub
		return roomDAO.updateRoom(roomDTO);
	}
	
	@Override
	public int deleteRoom(RoomDTO roomDTO) {
		// TODO Auto-generated method stub
		System.out.println(roomDTO.toString());
		return roomDAO.deleteRoom(roomDTO);
	}
	
	@Override
	public int fileNameUpdate(int r_id, String fileName) {
		// TODO Auto-generated method stub
		RoomDTO roomDTO = new RoomDTO();
		roomDTO.setR_id(r_id);
		roomDTO.setR_img(fileName);
		
		return roomDAO.fileNameUpdate(roomDTO);
	}
}
