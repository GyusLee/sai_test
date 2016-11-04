package com.sai.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sai.model.domain.Cart;
import com.sai.model.domain.Date_Course;
import com.sai.model.domain.Date_Detail;
import com.sai.model.domain.SubCate;
import com.sai.model.spring.dao.CartDAO;
import com.sai.model.spring.dao.DateCourseDAO;
import com.sai.model.spring.dao.DateDetailDAO;
import com.sai.model.spring.dao.SubCateDAO;

@Service
public class ClientMapServiceImpl implements ClientMapService{
	
	@Autowired
	@Qualifier("subCateDAOMybatis")
	private SubCateDAO subCateDAO;
	
	@Autowired
	@Qualifier("dateCourseDAOMybatis")
	private DateCourseDAO dateCourseDAO;
	
	@Autowired
	@Qualifier("dateDetailDAOMybatis")
	private DateDetailDAO dateDetailDAO;
	
	@Autowired
	@Qualifier("cartDAOMybatis")
	private CartDAO cartDAO;
	
	public List selectAllSubCate() {
		List<SubCate> subCateList = subCateDAO.selectAllSubCate();
		return subCateList;
	}

	
	public void insertDateCourse(Date_Course date_Course) {
		dateCourseDAO.insert(date_Course);
	}


	public void insertDateDetail(Date_Detail date_Detail) {
		dateDetailDAO.insert(date_Detail);
	}


	@Override
	public void insertCart(Cart cart) {
		cartDAO.insert(cart);
	}


	@Override
	public Cart selectLastCart(int cart_id) {
		
		return cartDAO.select(cart_id);
	}


	@Override
	public Date_Course selectOneDateCourse(int course_id) {
		
		return dateCourseDAO.select(course_id);
	}


	@Override
	public List<Date_Course> selectAllSpot(int course_id) {
		// TODO Auto-generated method stub
		return dateDetailDAO.selectAll(course_id);
	}


	@Override
	public SubCate selectOneSubCate(int s_id) {
		
		return subCateDAO.selectOneSubCate(s_id);
	}
}
