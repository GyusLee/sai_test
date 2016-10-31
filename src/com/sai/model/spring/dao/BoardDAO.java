package com.sai.model.spring.dao;

import java.util.List;

import com.sai.model.domain.Board;

public interface BoardDAO {
	public List selectAll();
	public Board selectOne(int board_id);
	public int insert(Board board);
	public int delete(int board_id);
	public int update(int board_id);
}
