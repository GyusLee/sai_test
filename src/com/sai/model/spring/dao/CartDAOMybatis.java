package com.sai.model.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sai.model.domain.Cart;

@Repository
public class CartDAOMybatis implements CartDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insert(Cart cart) {
		int result=sqlSessionTemplate.insert("Cart.insert", cart);
		System.out.println("카트에 데이터 한건 등록 성공하셨습니다.");
	}

	
	public Cart select(int cart_id) {	
		return sqlSessionTemplate.selectOne("Cart.selectOne", cart_id);
	}

}
