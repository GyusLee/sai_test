package com.sai.model.spring.dao;

import java.util.List;

import com.sai.model.domain.Likes;

public interface LikesDAO {
	
	
	public List selectAll(int l_num);
	//���Ϸ� �ִ��� ������ ����
	public Likes select(Likes likes);
	
	
	public int insert(Likes likes);
	public int delete(Likes likes);
	
}
