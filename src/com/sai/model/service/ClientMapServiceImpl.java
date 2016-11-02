package com.sai.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sai.model.domain.SubCate;
import com.sai.model.spring.dao.SubCateDAO;

@Service
public class ClientMapServiceImpl implements ClientMapService{
	
	@Autowired
	@Qualifier("subCateDAOMybatis")
	private SubCateDAO subCateDAO;
	
	public List selectAllSubCate() {
		List<SubCate> subCateList = subCateDAO.selectAllSubCate();
		return subCateList;
	}
}
