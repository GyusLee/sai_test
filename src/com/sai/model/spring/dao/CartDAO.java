package com.sai.model.spring.dao;

import com.sai.model.domain.Cart;

public interface CartDAO {
	public void insert(Cart cart);
	public Cart select(int cart_id);
}
