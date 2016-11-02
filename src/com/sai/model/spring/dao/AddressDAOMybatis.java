package com.sai.model.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sai.model.domain.Address;

@Repository
public class AddressDAOMybatis implements AddressDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Address> selectAllSido() {
		List<Address> sidoList = sqlSessionTemplate.selectList("Address.selectAllSido");
		return sidoList;
	}
	
	public List<Address> selectAllGugun(String sido) {
		List<Address> gugunList=sqlSessionTemplate.selectList("Address.selectAllGugun", sido);
		return gugunList;
	}

	public List<Address> selectAllDong(String dong) {
		List<Address> dongList=sqlSessionTemplate.selectList("Address.selectAllDong", dong);
		return dongList;
	}

}
