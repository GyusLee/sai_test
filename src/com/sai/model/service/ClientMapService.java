package com.sai.model.service;

import java.util.List;

import com.sai.model.domain.Cart;
import com.sai.model.domain.Date_Course;
import com.sai.model.domain.Date_Detail;
import com.sai.model.domain.SubCate;

public interface ClientMapService {
	public List selectAllSubCate();
	public SubCate selectOneSubCate(int s_id);
	public void insertDateCourse(Date_Course date_Course);
	public void insertDateDetail(Date_Detail date_Detail);
	public void insertCart(Cart cart);
	public Cart selectLastCart(int cart_id);
	public Date_Course selectOneDateCourse(int course_id);
	public List selectAllSpot(int course_id);
}
