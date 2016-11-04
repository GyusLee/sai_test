package com.sai.model.spring.dao;

import java.util.HashMap;
import java.util.List;

import com.sai.model.domain.Board;

public interface BoardDAO {
	public List selectAll();
	public Board selectOne(int board_id);
	public int insert(Board board);
	public int delete(Board board);
	public int update(Board board);
	public int updateEmail(HashMap map);
	

}
