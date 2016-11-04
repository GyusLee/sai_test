package com.sai.model.spring.dao;

import java.util.List;

import com.sai.model.domain.Date_Detail;

public interface DateDetailDAO {
	public void insert(Date_Detail date_Detail);
	public List selectAll(int course_id);
}
