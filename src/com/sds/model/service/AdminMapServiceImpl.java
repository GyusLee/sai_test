package com.sds.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sai.model.dao.MasterCateDAO;
import com.sai.model.dao.SubCateDAO;
import com.sai.model.dao.TopCateDAO;

@Service
public class AdminMapServiceImpl implements AdminMapService{
	//Ʈ����� ó���Ϸ��� ����ߵȴ�.
	
	@Autowired
	MasterCateDAO masterCateDAO;
	TopCateDAO topCateDAO;
	SubCateDAO subCateDAO;
	
	public int insert() {
		return 0;
	}

}
