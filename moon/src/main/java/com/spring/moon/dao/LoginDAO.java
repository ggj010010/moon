package com.spring.moon.dao;

import javax.servlet.http.HttpSession;

import com.spring.moon.dto.CustomerDTO;

public interface LoginDAO {
	public int Id_Check(CustomerDTO customerDTO);
	public int insertCustomer(CustomerDTO customerDTO);
	
	public int Login(CustomerDTO customerDTO, HttpSession Hsession);
}
