package com.sai.model.spring.dao;

import java.util.List;

import com.sai.model.domain.Comment_Board;

public interface Comment_BoardDAO {
	public List selectAll(int board_id);
	public int insert(Comment_Board comment_Board);
	public int delete(int comment_id);
	public int update(int comment_id);

}
