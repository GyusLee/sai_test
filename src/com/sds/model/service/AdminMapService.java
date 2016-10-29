package com.sds.model.service;

import com.sai.model.domain.MasterCate;
import com.sai.model.domain.SubCate;
import com.sai.model.domain.TopCate;

public interface AdminMapService {
	public int insert(SubCate subCate,TopCate topCate,MasterCate masterCate);
}
