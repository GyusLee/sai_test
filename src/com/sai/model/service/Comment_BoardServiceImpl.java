package com.sai.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sai.model.domain.Comment_Board;
import com.sai.model.spring.dao.BoardDAO;
import com.sai.model.spring.dao.Comment_BoardDAO;

@Service
public class Comment_BoardServiceImpl implements Comment_BoardService{
	@Autowired
	private Comment_BoardDAO comment_BoardDAO;

	public List selectAll(Comment_Board comment_Board) {
		return comment_BoardDAO.selectAll(comment_Board);
	}

	public int insert(Comment_Board comment_Board) {
		return 0;
	}

	public int delete(int comment_id) {
		return 0;
	}

	//@Transactional
	public int reply(Comment_Board comment_Board) {
		int result=comment_BoardDAO.insert(comment_Board);
		
		return result;
	}
}
