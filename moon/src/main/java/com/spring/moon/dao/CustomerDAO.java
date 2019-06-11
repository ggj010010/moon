package com.spring.moon.dao;

import java.util.List;

import com.spring.moon.dto.CustomerDTO;


public interface CustomerDAO {
	public List<CustomerDTO> selectCustomer();

	public int deleteCustomer(CustomerDTO customerDTO);
	

}
