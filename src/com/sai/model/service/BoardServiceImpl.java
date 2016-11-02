package com.sai.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sai.model.domain.Board;
import com.sai.model.spring.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	@Qualifier("boardDAOMybatis")
	private BoardDAO boardDAO;
	
	public List selectAll() {
		System.out.println("¼­ºñ½º");
		return boardDAO.selectAll();
	}

	public Board selectOne(int board_id) {
		return boardDAO.selectOne(board_id);
	}

	public int insert(Board board) {
		return boardDAO.insert(board);
	}

	public int delete(int board_id) {
		return boardDAO.delete(board_id);
	}

	public int update(Board board) {
		return 0;
	}

	@Override
	public int updateEmail(HashMap map) {
	
		return boardDAO.updateEmail(map);
	}
}
