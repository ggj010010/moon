package com.spring.moon.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.moon.dao.LoginDAO;
import com.spring.moon.dto.CustomerDTO;
import com.spring.moon.service.LoginService;
@Service
public class LoginServicelmpl implements LoginService{
	
	@Autowired
	LoginDAO LoginDAO;
	
	@Override
	public int insertCustomer(CustomerDTO customerDTO){
		return LoginDAO.insertCustomer(customerDTO);
	}
	@Override
	public int Id_Check(CustomerDTO customerDTO){
		return LoginDAO.Id_Check(customerDTO);
	}
	@Override
	public int Login(CustomerDTO customerDTO, HttpSession Hsession){
		return LoginDAO.Login(customerDTO, Hsession);
	}
//	@Override
//	public List<CustomerDTO> Login(CustomerDTO customerDTO, HttpSession Hsession) {
//		// TODO Auto-generated method stub
//		return LoginDAO.Login(customerDTO, Hsession);
//	}
}
