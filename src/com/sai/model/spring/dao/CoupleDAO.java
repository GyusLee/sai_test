package com.sai.model.spring.dao;

import java.util.List;

import com.sai.model.domain.Couple;

public interface CoupleDAO {
	
	public List selectAll();
	public Couple select(int couple_id);
	public int insert(String f_email,String m_email);
	public int selectSeq();

}
