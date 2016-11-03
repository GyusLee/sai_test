package com.sai.model.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sai.model.domain.Comment_Board;
@Repository
public class Comment_BoardDAOMybatis implements Comment_BoardDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	

	public List selectAll(Comment_Board comment_Board) {
		List list=sqlSessionTemplate.selectList("Comment_Board.selectAll");
		
		return list;
	}

	public int insert(Comment_Board comment_Board) {
		return sqlSessionTemplate.insert("Comment_Board.insert", comment_Board);
	}

	public int delete(int comment_id) {
		return 0;
	}

	public int update(int comment_id) {
		return 0;
	}
}
