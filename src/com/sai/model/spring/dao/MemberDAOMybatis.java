package com.sai.model.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sai.model.domain.Member;

@Repository
public class MemberDAOMybatis implements MemberDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List selectAll() {
		List list = sqlSessionTemplate.selectList("Member.selectAll");
		return list;
	}

	
	public Member select(int member_id) {
		Member member=sqlSessionTemplate.selectOne("Member.selectOne", member_id);
		return member;
	}

	
	public int insert(Member member) {
		sqlSessionTemplate.insert("Member.insert", member);
		return member.getMember_id();
	}

	
	public int update(Member member) {
		sqlSessionTemplate.update("Member.update", member);
		return member.getMember_id();
	}

	
	public int delete(int member_id) {
		sqlSessionTemplate.delete("Member.delete", member_id);
		return member_id;
	}


	public List selectOne() {
		List list = sqlSessionTemplate.selectList("Member.selectOne");
		return list;
	}

}
