package com.sai.model.service;

import java.util.List;

import com.sai.model.domain.Date_Course;
import com.sai.model.domain.Date_Detail;

public interface ClientMapService {
	public List selectAllSubCate();
	public void insertDateCourse(Date_Course date_Course);
	public void insertDateDetail(Date_Detail date_Detail);
}
