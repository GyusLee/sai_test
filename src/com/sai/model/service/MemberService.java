package com.sai.model.service;

import java.util.List;

import com.sai.model.domain.Member;

public interface MemberService {
	public List selectAll();
	public int select(Member member);
	public Member selectPartner(Member member);
	public int update_regist(Member member);
	public int insert_first(Member member);
	public int update(Member member);
	public int update_profile(Member member);
}
