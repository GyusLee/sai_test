package com.sds.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sai.model.dao.MasterCateDAO;
import com.sai.model.dao.SubCateDAO;
import com.sai.model.dao.TopCateDAO;
import com.sai.model.domain.MasterCate;
import com.sai.model.domain.SubCate;
import com.sai.model.domain.TopCate;

@Service
public class AdminMapServiceImpl implements AdminMapService{
	//트랜잭션 처리하려면 묶어야된다.
	
	//@Autowired
	MasterCateDAO masterCateDAO;
	//@Autowired
	TopCateDAO topCateDAO;
	//@Autowired
	SubCateDAO subCateDAO;
	
	@Override
	public int insert(SubCate subCate, TopCate topCate, MasterCate masterCate) {
		
		return 0;
	}
}
