package com.sai.model.spring.dao;

import java.util.List;

import com.sai.model.domain.Likes;

public interface LikesDAO {
	
	
	public List selectAll(int l_num);
	//메일로 있는지 없는지 조사
	public Likes select(Likes likes);
	
	
	public int insert(Likes likes);
	public int delete(Likes likes);
	
}
