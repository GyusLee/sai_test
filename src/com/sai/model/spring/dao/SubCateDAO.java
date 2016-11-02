package com.sai.model.spring.dao;

import java.util.List;

import com.sai.model.domain.SubCate;

public interface SubCateDAO {
	public int insert(SubCate subCate);
	public List<SubCate> selectAllSubCate();
}
