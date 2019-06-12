package com.spring.moon.dto;

import java.sql.Date;

public class EventDTO {
	int e_id;
	String e_name;
	String e_img;
	String e_com;
	Date e_start;
	Date e_end;
	
	public int getE_id() {
		return e_id;
	}
	public void setE_id(int e_id) {
		this.e_id = e_id;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public String getE_img() {
		return e_img;
	}
	public void setE_img(String e_img) {
		this.e_img = e_img;
	}
	public String getE_com() {
		return e_com;
	}
	public void setE_com(String e_com) {
		this.e_com = e_com;
	}
	
	public Date getE_start() {
		return e_start;
	}
	public void setE_start(Date e_start) {
		this.e_start = e_start;
	}
	public Date getE_end() {
		return e_end;
	}
	public void setE_end(Date e_end) {
		this.e_end = e_end;
	}
	@Override
	public String toString() {
		return "e_id : " + e_id + " e_name : " + e_name + " e_img : " + e_img + " e_com : " + e_com+ " e_start : " + e_start + " e_end : " + e_end;
	}
}
