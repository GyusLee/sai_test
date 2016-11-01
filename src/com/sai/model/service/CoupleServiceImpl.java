package com.sai.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sai.model.domain.Couple;
import com.sai.model.spring.dao.CoupleDAO;

@Service
public class CoupleServiceImpl implements CoupleService{
	
	@Autowired
	private CoupleDAO coupleDAO;


	public int insert(Couple couple) {
		System.out.println("서비스 커플");
		System.out.println(couple.getF_email());
		System.out.println(couple.getM_email());
		int result=coupleDAO.insert(couple.getF_email(), couple.getM_email());
		return 0;
	}

	public int selectSeq() {
		int result=coupleDAO.selectSeq();
		return result;
	}


	public Couple select(int couple_id) {
		Couple couple=coupleDAO.select(couple_id);
		return couple;
	}

}
