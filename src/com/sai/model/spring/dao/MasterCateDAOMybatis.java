package com.sai.model.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sai.model.domain.MasterCate;

@Repository
public class MasterCateDAOMybatis implements MasterCateDAO{
	
	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;
	
	public List selectAll() {
		List<MasterCate> MasterCateList = SqlSessionTemplate.selectList("MasterCate.selectAll");
		return MasterCateList;
	}

}
