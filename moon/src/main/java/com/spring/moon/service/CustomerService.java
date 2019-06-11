package com.spring.moon.service;

import java.util.HashMap;
import java.util.List;

import com.spring.moon.common.CommonUtil;
import com.spring.moon.dto.CustomerDTO;

public interface CustomerService {
	public List<CustomerDTO> selectCustomer();

	public int deleteCustomer(CustomerDTO customerDTO);

}
