package com.sai.model.spring.dao;

import java.util.List;

import com.sai.model.domain.Date_Course;

public interface DateCourseDAO {
	public void insert(Date_Course date_Course);
	public Date_Course select(int course_id);
}
