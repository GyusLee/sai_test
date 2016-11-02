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
	//트랜잭션 처리하려면 묶어야된다.
	
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
	
	
	//subCate DB에 등록시키자!!
	public int insert(SubCate subCate) {
		int result = subCateDAO.insert(subCate);
		return result;
	}
	
	//초기 마스터 카테를 채워주기 위함
	public List<MasterCate> selectAll() {
		//System.out.println("서비스 영역 진입");
		List<MasterCate> MasterCateList = masterCateDAO.selectAll();
		return MasterCateList;
	}

	//마스터 카테를 채운 후 그에 따른 탑 카테를 채워주기 위함
	public List<TopCate> selectAll(int Tid) {
		
		List<TopCate> topCateList=topCateDAO.selectAll(Tid);
		return topCateList;
	}

	//초기 sido 값을 채우기 위함.
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
