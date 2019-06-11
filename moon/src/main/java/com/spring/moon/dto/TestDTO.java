package com.spring.moon.dto;

public class TestDTO {
	String num;
	String name;
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "num" + num + "name" + name;
	}

}
