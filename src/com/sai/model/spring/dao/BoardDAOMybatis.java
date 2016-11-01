package com.sai.model.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sai.model.domain.Board;
@Repository
public class BoardDAOMybatis implements BoardDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List selectAll() {
		System.out.println("마이바티스");
		List list = sqlSessionTemplate.selectList("Board.selectAll");
		System.out.println("dao"+list.size());
		return list;
	}

	public Board selectOne(int board_id) {
		Board board = sqlSessionTemplate.selectOne("Board.selectOne", board_id);
		return board;
	}

	public int insert(Board board) {
		sqlSessionTemplate.insert("Board.insert", board);
		return board.getBoard_id();
	}

	public int delete(int board_id) {
		sqlSessionTemplate.delete("Board.delete", board_id);
		return board_id;
	}

	public int update(Board board) {
		sqlSessionTemplate.update("Board.update", board);
		return board.getBoard_id();
	}

	@Override
	public int updateEmail(HashMap map) {
		int result=sqlSessionTemplate.update("Board.updateEmail",map);
		return result;
	}	
}
