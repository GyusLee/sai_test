package com.sai.model.service;

import java.util.List;

import com.sai.model.domain.Comment_Board;

public interface Comment_BoardService {
	public List selectAll(Comment_Board comment_Board);
	public int insert(Comment_Board comment_Board);
	public int delete(int comment_id);
	public int reply(Comment_Board comment_Board);
}
