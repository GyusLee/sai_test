package com.sai.model.service;

import java.util.List;

import com.sai.model.domain.MasterCate;
import com.sai.model.domain.SubCate;
import com.sai.model.domain.TopCate;

public interface AdminMapService {
	public int insert(SubCate subCate,TopCate topCate,MasterCate masterCate);
	public List<MasterCate> selectAll(); //초기 마스터 카테고리 값을 채워주기 위한 함수.
}
