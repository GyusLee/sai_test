package com.sai.model.dao;

import java.util.List;

import com.sai.model.domain.Member;

public interface MemberDAO {
	public List selectAll();
	public Member select(int member_id);
	public int insert(Member member);
	public int update(Member member);
	public int delete(int member_id);
}
