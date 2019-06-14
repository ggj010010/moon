package com.spring.moon.service;

import java.util.List;

import com.spring.moon.dto.PagingDTO;
import com.spring.moon.dto.RoomDTO;

public interface RoomService {

	public List<RoomDTO> selectRoom();

	public int fileNameUpdate(int r_id, String fileName);

	public int insertRoom(RoomDTO roomDTO);

	public int deleteRoom(RoomDTO roomDTO);

	public int updateRoom(RoomDTO roomDTO);

	public List<RoomDTO> selectRoomView(PagingDTO pagingDTO);

	public RoomDTO selectRoomOne(RoomDTO roomDTO);

}
