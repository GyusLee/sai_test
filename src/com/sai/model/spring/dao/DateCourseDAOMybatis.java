package com.sai.model.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sai.model.domain.Date_Course;

@Repository
public class DateCourseDAOMybatis implements DateCourseDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insert(Date_Course date_Course) {
		
	    int result=sqlSessionTemplate.insert("Date_Course.insert",date_Course);
		if(result==0){
			System.out.println("����Ʈ �ڽ��� ��ϵ��� �ʾҽ��ϴ�.");
		}else{
			System.out.println("�ʱ� ������ �ڽ� ��� �Ϸ�");
		}
	}
	
}
