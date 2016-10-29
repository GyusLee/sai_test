package com.sai.controller.map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sai.model.domain.MasterCate;
import com.sai.model.domain.SubCate;
import com.sai.model.domain.TopCate;
import com.sds.model.service.AdminMapService;


@Controller//Dispatcher-Servlet���� MapController�� ��ġ�� �˸���.
public class AdminMapController {
	
	@Autowired
	AdminMapService adminMapService;
	
	@RequestMapping("/admin/regist.do")
	public ModelAndView insert(SubCate subCate,TopCate topCate,MasterCate masterCate){ //form�±��� name�� dto�� �̸��� ���� ��� �ش� ������ �ڵ����� �Ѿ�´�.
		
		adminMapService.insert();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("subcategory", subCate);
		mav.setViewName("admin/index");
		return mav;
	}
}
