package com.sai.model.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sai.model.domain.Couple;


@Repository
public class CoupleDAOSpringMybatis implements CoupleDAO{


	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List selectAll() {
		return null;
	}


	public Couple select(int couple_id) {
		Couple couple=sqlSessionTemplate.selectOne("Couple.selectOne", couple_id);
		System.out.println("마이바티스");
		return couple;
	}


	public int insert(String f_email,String m_email) {
		Couple couple=new Couple();
		couple.setF_email(f_email);
		couple.setM_email(m_email);
		int result=sqlSessionTemplate.insert("Couple.insert", couple);
		return result;
	}


	@Override
	public int selectSeq() {
		int result=sqlSessionTemplate.selectOne("Couple.selectSeq");
		return result;
	}

}
