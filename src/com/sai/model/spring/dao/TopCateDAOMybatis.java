package com.sai.model.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sai.model.domain.TopCate;

@Repository
public class TopCateDAOMybatis implements TopCateDAO{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll(int Mid) {
		List<TopCate> topCateList = sqlSessionTemplate.selectList("TopCate.selectAll",Mid);
		return topCateList;
	}

}
