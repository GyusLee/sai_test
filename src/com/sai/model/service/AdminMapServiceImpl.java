package com.sai.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sai.model.domain.Address;
import com.sai.model.domain.MasterCate;
import com.sai.model.domain.SubCate;
import com.sai.model.domain.TopCate;
import com.sai.model.spring.dao.AddressDAO;
import com.sai.model.spring.dao.MasterCateDAO;
import com.sai.model.spring.dao.SubCateDAO;
import com.sai.model.spring.dao.TopCateDAO;

@Service
public class AdminMapServiceImpl implements AdminMapService{
	//Ʈ����� ó���Ϸ��� ����ߵȴ�.
	
	@Autowired
	@Qualifier("masterCateDAOMybatis")
	private MasterCateDAO masterCateDAO;
	
	@Autowired
	@Qualifier("topCateDAOMybatis")
	private TopCateDAO topCateDAO;
	
	@Autowired
	@Qualifier("subCateDAOMybatis")
	private SubCateDAO subCateDAO;
	
	@Autowired
	@Qualifier("addressDAOMybatis")
	private AddressDAO addressDAO;
	
	
	//subCate DB�� ��Ͻ�Ű��!!
	public int insert(SubCate subCate) {
		int result = subCateDAO.insert(subCate);
		return result;
	}
	
	//�ʱ� ������ ī�׸� ä���ֱ� ����
	public List<MasterCate> selectAll() {
		//System.out.println("���� ���� ����");
		List<MasterCate> MasterCateList = masterCateDAO.selectAll();
		return MasterCateList;
	}

	//������ ī�׸� ä�� �� �׿� ���� ž ī�׸� ä���ֱ� ����
	public List<TopCate> selectAll(int Tid) {
		
		List<TopCate> topCateList=topCateDAO.selectAll(Tid);
		return topCateList;
	}

	//�ʱ� sido ���� ä��� ����.
	public List<Address> selectAllSido() {
		List<Address> sidoList = addressDAO.selectAllSido();
		return sidoList;
	}

	
	public List<Address> selectAllGugun(String sido) {
		List<Address> gugunList=addressDAO.selectAllGugun(sido);
		return gugunList;
	}


	public List<Address> selectAllDong(String gugun) {
		List<Address> dongList=addressDAO.selectAllDong(gugun);
		return dongList;
	}
}
