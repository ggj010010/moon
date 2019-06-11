package com.spring.moon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.moon.dao.TestDAO;
import com.spring.moon.dto.TestDTO;
import com.spring.moon.service.TestService;

@Service
public class TestServiceImpl implements TestService{
	
	@Autowired
	TestDAO testDAO;
	
	@Override
	public List<TestDTO> searchList() {
		// TODO Auto-generated method stub
		return testDAO.searchList();
	}

}
