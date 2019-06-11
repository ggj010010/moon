package com.spring.moon.dto;

public class RoomDTO {
	
	int r_id;
	String r_name;
	String r_com;
	int r_price;
	String r_img;
	
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_com() {
		return r_com;
	}
	public void setR_com(String r_com) {
		this.r_com = r_com;
	}
	public int getR_price() {
		return r_price;
	}
	public void setR_price(int r_price) {
		this.r_price = r_price;
	}
	public String getR_img() {
		return r_img;
	}
	public void setR_img(String r_img) {
		this.r_img = r_img;
	}
	
	@Override
	public String toString() {
		return "r_id" + r_id + "r_name" + r_name +"r_com" + r_com + "r_price" + r_price + "r_img" + r_img;
	}
	

}
