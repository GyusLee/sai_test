package com.sai.model.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sai.model.domain.Likes;

@Repository
public class LikesDAOMybatis implements LikesDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	
	public List selectAll(int l_num) {
		List list=sqlSessionTemplate.selectList("Likes.selectAll", l_num);
		return list;
	}

	public Likes select(Likes likes) {
		System.out.println("마이바티스");
		System.out.println(likes.getL_num());
		System.out.println(likes.getM_email());
		Likes likesTemp=new Likes();
		likesTemp=sqlSessionTemplate.selectOne("Likes.selectOne", likes);
		System.out.println(likesTemp);
		return likesTemp;
	}

	public int insert(Likes likes) {
		int result=sqlSessionTemplate.insert("Likes.insert", likes);
		return result;
	}

	public int delete(Likes likes) {
		int result=sqlSessionTemplate.delete("Likes.delete", likes);
		return result;
	}

}
