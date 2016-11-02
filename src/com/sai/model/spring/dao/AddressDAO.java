package com.sai.model.spring.dao;

import java.util.List;

import com.sai.model.domain.Address;

public interface AddressDAO {
	public List<Address> selectAllSido();
	public List<Address> selectAllGugun(String sido);
	public List<Address> selectAllDong(String dong);
}
