package com.sai.model.service;

import java.util.List;

import com.sai.model.domain.Address;
import com.sai.model.domain.MasterCate;
import com.sai.model.domain.SubCate;
import com.sai.model.domain.TopCate;

public interface AdminMapService {
	public int insert(SubCate subCate);
	public List<MasterCate> selectAll(); //초기 마스터 카테고리 값을 채워주기 위한 함수.
	public List<TopCate> selectAll(int Tid); // 마스터 카테고리 선택별 탑 카테고리 채워주기 위한 함수
	public List<Address> selectAllSido();//Address의 sido를 가져오기 위함.
	public List<Address> selectAllGugun(String sido);
	public List<Address> selectAllDong(String gugun);
}
