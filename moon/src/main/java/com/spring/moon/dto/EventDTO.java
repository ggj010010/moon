package com.spring.moon.dto;

public class EventDTO {
	int e_id;
	String e_name;
	String e_img;
	String e_com;
	
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
	
	@Override
	public String toString() {
		return "e_id : " + e_id + " e_name : " + e_name + " e_img : " + e_img + " e_com : " + e_com;
	}
}
