package com.sai.model.service;

import com.sai.model.domain.Couple;

public interface CoupleService {

	public int insert(Couple couple);
	public int selectSeq();
	public Couple select(int couple_id);
}
