package com.sai.model.service;

import java.util.List;

import com.sai.model.domain.Likes;

public interface LikesService {
	public List selectAll(int l_num);
	public Likes select(Likes likes);
	public int insert(Likes likes);
	public int delete(Likes likes);
}
