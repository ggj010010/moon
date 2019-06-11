package com.spring.moon.dao.impl;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.moon.dao.LoginDAO;
import com.spring.moon.dto.CustomerDTO;

@Repository
public class LoginDAOlmpl implements LoginDAO{
	@Autowired
	private SqlSession sqlSession;
	public int Id_Check(CustomerDTO customerDTO) {
		try {
			return sqlSession.selectOne("login.Id_Check", customerDTO);
		}
		catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	@Override
	public int insertCustomer(CustomerDTO customerDTO){
		System.out.println("insert");
		int Id_Check_Result = Id_Check(customerDTO);
		if(Id_Check_Result != 0) { 
			System.out.println("Re"+Id_Check_Result);
			return Id_Check_Result;}

		try {
			sqlSession.insert("login.insertCustomer", customerDTO);
			return 0;
		}
		catch (Exception e) {
			e.printStackTrace();
			return -2;
		}
	}
	public int Login(CustomerDTO customerDTO, HttpSession Hsession) {
		int Id_Search_Result = -1;
		try {
			Id_Search_Result = sqlSession.selectOne("login.Login", customerDTO);
		}
		catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
		if(Id_Search_Result != 1) return Id_Search_Result;
		
		try {
			CustomerDTO c_info = sqlSession.selectOne("login.Login_Info", customerDTO);
			Hsession.setAttribute("c", c_info);
			return 1;
		}
		catch (Exception e) {
			e.printStackTrace();
			return -2;
		}
	}
}
