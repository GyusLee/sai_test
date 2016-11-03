package com.sai.model.spring.dao;

import java.util.List;

import com.sai.model.domain.Member;

public interface MemberDAO {
	public List selectAll();
	public Member selectOne(Member member);
	public int delete(Member member);
	public int update_profile(Member member);
	
	public Member select(Member member);
	public int update_regist(Member member);
	public int insert_first(Member member);
	public int update(Member member);
}
