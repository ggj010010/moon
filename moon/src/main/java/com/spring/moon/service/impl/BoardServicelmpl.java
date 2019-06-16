package com.spring.moon.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.moon.dao.BoardDAO;
import com.spring.moon.dto.BoardDTO;
import com.spring.moon.dto.Criteria;
import com.spring.moon.service.BoardService;

@Service
public class BoardServicelmpl implements BoardService{

	@Autowired
	BoardDAO BoardDAO;
	


	@Override
	public List<BoardDTO> listAll(int start, int end, String searchOption, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return BoardDAO.listAll(start, end, searchOption, keyword);
	}
	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		return BoardDAO.countArticle(searchOption, keyword);
	}
	
	
	@Override
	public List<BoardDTO> listCriteria(Criteria cri) throws Exception {
		return BoardDAO.listCriteria(cri);
	}
	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return BoardDAO.countPaging(cri);

	}
	@Transactional
	@Override
	public void create(BoardDTO vo) throws Exception {
		String title = vo.getB_title();
		String content = vo.getB_content();
		String writer = vo.getBc_id();

		title = title.replace("<", "&lt;");
		title = title.replace("<", "&gt;");
		writer = writer.replace("<", "&lt;");
		writer = writer.replace("<", "&gt;");
		title = title.replace("  ",	"&nbsp;&nbsp;");
		writer = writer.replace("  ",	"&nbsp;&nbsp;");
		content = content.replace("\n", "<br>");
		vo.setB_title(title);
		vo.setB_content(content);
		vo.setBc_id(writer);

		BoardDAO.create(vo);

		
	}

	@Override
	public BoardDTO read(int bno) throws Exception {
		return BoardDAO.read(bno);
	}

	@Transactional
	@Override
	public void update(BoardDTO vo) throws Exception {
		BoardDAO.update(vo);


	}

	@Override
	public void delete(BoardDTO vo) throws Exception {
		BoardDAO.delete(vo);
	}
	// 05.

	
	// 06.
	@Override
	public void increaseViewcnt(int bno, HttpSession session) throws Exception {
		long update_time = 0;

		if(session.getAttribute("update_time_"+bno) != null){
								
			 update_time = (Long) session.getAttribute("update_time_"+bno); 
		}
		long current_time = System.currentTimeMillis();

		
		if(current_time - update_time > 5*1000){
			BoardDAO.increaseViewcnt(bno);
			
			session.setAttribute("update_time_"+bno, current_time);
			
		}
	}

	@Override
	public List<String> getAttach(int bno) {
		return BoardDAO.getAttach(bno);
	}

	public void deleteFile(String fullname) {
		BoardDAO.deleteFile(fullname);
	}
	@Override
	public BoardDTO selectBoard(int boardNum) throws Exception {
		// TODO Auto-generated method stub
		BoardDTO BoardDTO = new BoardDTO();
		
		
		BoardDTO.setB_id(boardNum);
		
		return BoardDAO.selectBoard(BoardDTO);
	}
	
	@Override
	public int boardInsert(BoardDTO BoardDTO) throws Exception {
		// TODO Auto-generated method stub
		return BoardDAO.boardInsert(BoardDTO);
	}
}
