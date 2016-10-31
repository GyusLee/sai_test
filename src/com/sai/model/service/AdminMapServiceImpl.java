package com.sai.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sai.model.domain.MasterCate;
import com.sai.model.domain.SubCate;
import com.sai.model.domain.TopCate;
import com.sai.model.spring.dao.MasterCateDAO;
import com.sai.model.spring.dao.SubCateDAO;
import com.sai.model.spring.dao.TopCateDAO;

@Service
public class AdminMapServiceImpl implements AdminMapService{
	//트랜잭션 처리하려면 묶어야된다.
	
	@Autowired
	@Qualifier("masterCateDAOMybatis")
	private MasterCateDAO masterCateDAO;
	//@Autowired
	private TopCateDAO topCateDAO;
	//@Autowired
	private SubCateDAO subCateDAO;
	
	public int insert(SubCate subCate, TopCate topCate, MasterCate masterCate) {
		
		return 0;
	}
	
	public List<MasterCate> selectAll() {
		List<MasterCate> MasterCateList = masterCateDAO.selectAll();
		return MasterCateList;
	}
}
