package com.sai.model.spring.dao;

import java.util.List;

import com.sai.model.domain.Member;

public interface MemberDAO {
	public List selectAll();
	public List selectOne();
	public Member select(int member_id);
	public int delete(int member_id);
	
	public Member select(Member member);
	public int update_regist(Member member);
	public int insert_first(Member member);
	public int update(Member member);
}
