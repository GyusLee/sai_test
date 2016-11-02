package com.sai.model.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sai.model.domain.SubCate;

@Repository
public class SubCateDAOMybatis implements SubCateDAO{
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int insert(SubCate subCate) {
		int result = sqlSessionTemplate.insert("SubCate.insert",subCate);
		System.out.println("insert 가 반환하는 값은?" + result);
		return result;
	}
	
	//clientpage에서 subCate 전부 읽어오기
	public List<SubCate> selectAllSubCate(){
		List<SubCate> subCateList = sqlSessionTemplate.selectList("SubCate.selectAll");
		return subCateList;
	}
}
