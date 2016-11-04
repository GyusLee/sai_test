package com.sai.model.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sai.model.domain.Date_Detail;

@Repository
public class DateDetailDAOMybatis implements DateDetailDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insert(Date_Detail date_Detail) {
		int result=sqlSessionTemplate.insert("Date_Detail.insert",date_Detail);
		if(result==1){
			System.out.println("등록 성공");
		}else{
			System.out.println("등록 실패");
		}
	}

	@Override
	public List selectAll(int course_id) {
		
		return sqlSessionTemplate.selectList("Date_Detail.selectAll", course_id);
	}

}
