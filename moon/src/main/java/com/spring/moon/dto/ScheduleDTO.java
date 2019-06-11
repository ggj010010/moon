package com.spring.moon.dto;

import java.sql.Date;

public class ScheduleDTO {
	int s_id;
	String c_id;
	int r_id;
	Date in;
	Date out;
	
	CustomerDTO customerDTO;
	RoomDTO roomDTO;
	
	public CustomerDTO getCustomerDTO() {
		return customerDTO;
	}
	public void setCustomerDTO(CustomerDTO customerDTO) {
		this.customerDTO = customerDTO;
	}
	public RoomDTO getRoomDTO() {
		return roomDTO;
	}
	public void setRoomDTO(RoomDTO roomDTO) {
		this.roomDTO = roomDTO;
	}
	
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public Date getIn() {
		return in;
	}
	public void setIn(Date in) {
		this.in = in;
	}
	public Date getOut() {
		return out;
	}
	public void setOut(Date out) {
		this.out = out;
	}

	@Override
	public String toString() {
		return "s_id : " + s_id + ",c_id : " + c_id + ",r_id : " + r_id + ",in : " + in + ",out : " + out;
	}
}
