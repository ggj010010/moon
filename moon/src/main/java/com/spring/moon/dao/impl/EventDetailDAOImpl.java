package com.spring.moon.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.moon.dao.EventDetailDAO;
import com.spring.moon.dto.EventDetailDTO;

@Repository
public class EventDetailDAOImpl implements EventDetailDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<EventDetailDTO> selectEventDetail(String e_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("eventDetail.selectEventDetail",e_id);
	}
	
	@Override
	public EventDetailDTO selectEventDetailOne(String ed_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("eventDetail.selectEventDetailOne", ed_id);
	}
	
	@Override
	public int insertEventDetail(EventDetailDTO eventDetailDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert("eventDetail.insertEventDetail",eventDetailDTO);
	}
	
	@Override
	public int sortChangeUP(EventDetailDTO eventDetailDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update("eventDetail.sortChangeUP",eventDetailDTO);
	}
	
	@Override
	public int sortChangeDOWN(EventDetailDTO eventDetailDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update("eventDetail.sortChangeDOWN",eventDetailDTO);
	}

}
