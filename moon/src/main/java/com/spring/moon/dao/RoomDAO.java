package com.spring.moon.dao;

import java.util.List;

import com.spring.moon.dto.RoomDTO;

public interface RoomDAO {

	public List<RoomDTO> selectRoom();

	public int insertRoom(RoomDTO roomDTO);

	public int fileNameUpdate(RoomDTO roomDTO);

	public int deleteRoom(RoomDTO roomDTO);

	public int updateRoom(RoomDTO roomDTO);

}
