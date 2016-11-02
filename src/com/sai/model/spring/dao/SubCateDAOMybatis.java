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
		System.out.println("insert �� ��ȯ�ϴ� ����?" + result);
		return result;
	}
	
	//clientpage���� subCate ���� �о����
	public List<SubCate> selectAllSubCate(){
		List<SubCate> subCateList = sqlSessionTemplate.selectList("SubCate.selectAll");
		return subCateList;
	}
}
