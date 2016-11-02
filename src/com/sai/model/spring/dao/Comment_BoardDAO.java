package com.sai.model.spring.dao;

import java.util.List;

import com.sai.model.domain.Comment_Board;

public interface Comment_BoardDAO {
	public List selectAll(Comment_Board comment_Board);
	public int insert(Comment_Board comment_Board);
	public int delete(int comment_id);
	public int update(int comment_id);
	public int updateRank(Comment_Board comment_Board);
}
