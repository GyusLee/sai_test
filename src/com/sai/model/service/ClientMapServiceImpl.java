package com.sai.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sai.model.domain.Date_Course;
import com.sai.model.domain.Date_Detail;
import com.sai.model.domain.SubCate;
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
}
