package com.spring.moon.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.moon.dao.CustomerDAO;
import com.spring.moon.dto.CustomerDTO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CustomerDTO> selectCustomer() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("customer.selectCustomer");
	}

	@Override
	public int deleteCustomer(CustomerDTO customerDTO) {
		// TODO Auto-generated method stub
		return sqlSession.delete("customer.deleteCustomer", customerDTO);
	}
	

}
