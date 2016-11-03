package com.sai.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sai.model.domain.Likes;
import com.sai.model.spring.dao.LikesDAO;


@Service
public class LikesServiceImpl implements LikesService{

	@Autowired
	private LikesDAO likesDAO;
	
	
	public List selectAll(int l_num) {
		return likesDAO.selectAll(l_num);
	}

	public Likes select(Likes likes) {
		System.out.println("서비스 좋아요");
		return likesDAO.select(likes);
	}

	public int insert(Likes likes) {
		return likesDAO.insert(likes);
	}


	public int delete(Likes likes) {
		return likesDAO.delete(likes);
	}

}
