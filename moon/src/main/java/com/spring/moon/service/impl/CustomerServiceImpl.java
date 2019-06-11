package com.spring.moon.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.moon.dao.CustomerDAO;
import com.spring.moon.dto.CustomerDTO;
import com.spring.moon.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerDAO customerDAO;

	@Override
	public List<CustomerDTO> selectCustomer() {
		// TODO Auto-generated method stub
		return customerDAO.selectCustomer();
	}

	@Override
	public int deleteCustomer(CustomerDTO customerDTO) {
		// TODO Auto-generated method stub
		return customerDAO.deleteCustomer(customerDTO);
	}

	
	
}
