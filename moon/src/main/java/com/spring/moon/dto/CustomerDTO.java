package com.spring.moon.dto;

import java.sql.Date;

public class CustomerDTO {
	String c_id;
	String c_pw;
	String c_tel;
	String c_sex;
	String c_name;
	Date c_birth;
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getC_pw() {
		return c_pw;
	}
	public void setC_pw(String c_pw) {
		this.c_pw = c_pw;
	}
	
	public String getC_tel() {
		return c_tel;
	}
	public void setC_tel(String c_tel) {
		this.c_tel = c_tel;
	}
	public String getC_sex() {
		return c_sex;
	}
	public void setC_sex(String c_sex) {
		this.c_sex = c_sex;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public Date getC_birth() {
		return c_birth;
	}
	public void setC_birth(Date c_birth) {
		this.c_birth = c_birth;
	}
	
	@Override
	public String toString() {
		return "id : " + c_id + "pw : " + c_pw + "tel" + c_tel + "sex" + c_sex + "name" + c_name+"birth"+c_birth;
	}

}
