package com.sai.model.service;

import java.util.List;

import com.sai.model.domain.Address;
import com.sai.model.domain.MasterCate;
import com.sai.model.domain.SubCate;
import com.sai.model.domain.TopCate;

public interface AdminMapService {
	public int insert(SubCate subCate);
	public List<MasterCate> selectAll(); //�ʱ� ������ ī�װ� ���� ä���ֱ� ���� �Լ�.
	public List<TopCate> selectAll(int Tid); // ������ ī�װ� ���ú� ž ī�װ� ä���ֱ� ���� �Լ�
	public List<Address> selectAllSido();//Address�� sido�� �������� ����.
	public List<Address> selectAllGugun(String sido);
	public List<Address> selectAllDong(String gugun);
}
