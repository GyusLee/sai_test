package com.sai.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sai.model.domain.Member;
import com.sai.model.spring.dao.MemberDAO;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO; 

	
	public List selectAll() {
		return null;
	}

	public int select(Member member) {
			//System.out.println("서비스 처음");
			Member selectedMember=memberDAO.select(member);
			//System.out.println("서비스 후");
			if(selectedMember==null){
				//System.out.println("서비스 회원 없음");
				return 0;
			}
			else{
				if(selectedMember.getCouple_id()==0){
					//System.out.println("서비스 회원있는데 안맺어짐");
					//회원은 있는데, 커플이 안맺어짐
					return 1;
				}
				
			}
			return 2;
	}

	public int update_regist(Member member) {
		int result=memberDAO.update_regist(member);
		return result;
	}

	public int insert_first(Member member) {
		
		int result=memberDAO.insert_first(member);
		return result;
	}

	@Override
	public Member selectPartner(Member member) {
		Member pMember=memberDAO.select(member);
		return pMember;
	}

	@Override
	public int update(Member member) {
		int result=memberDAO.update(member);
		return result;
	}
}
