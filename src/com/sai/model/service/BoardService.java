package com.sai.model.service;

import java.util.HashMap;
import java.util.List;

import com.sai.model.domain.Board;

public interface BoardService {
	public List selectAll();
	public Board selectOne(int board_id);
	public int insert(Board board);
	public int delete(int board_id);
	public int update(Board board);
	public int updateEmail(HashMap map);
}
