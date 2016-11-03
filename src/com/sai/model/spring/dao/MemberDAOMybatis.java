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

	
	public Member selectOne(Member member) {
		Member selectedmember=sqlSessionTemplate.selectOne("Member.selectOne", member.getM_email());
		return selectedmember;
	}
	
	public int delete(Member member) {
		int result=sqlSessionTemplate.delete("Member.delete", member.getM_email());
		return result;
	}

	public Member select(Member member) {
		//System.out.println(member.getM_email());
		Member selectedMember=sqlSessionTemplate.selectOne("Member.select", member.getM_email());
		//System.out.println("DAO지나고");
		return selectedMember;
	}


	public int update_regist(Member member) {
		int result=sqlSessionTemplate.update("Member.update_regist", member);
		return result;
	}


	public int insert_first(Member member) {
		int result=sqlSessionTemplate.insert("Member.insert_first", member);
		return result;
	}

	@Override
	public int update(Member member) {
		int result=sqlSessionTemplate.update("Member.update", member);
		return result;
	}


	@Override
	public int update_profile(Member member) {
		System.out.println("Mybatis");
		System.out.println("성수"+member.getM_email());
		int result = sqlSessionTemplate.update("Member.update_profile", member);
		return result;
	}

}
