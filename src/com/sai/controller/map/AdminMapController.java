package com.sai.controller.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sai.model.domain.MasterCate;
import com.sai.model.domain.SubCate;
import com.sai.model.domain.TopCate;
import com.sai.model.service.AdminMapService;

@Controller//Dispatcher-Servlet���� MapController�� ��ġ�� �˸���.
@RequestMapping("/admin/")
public class AdminMapController {
	
	@Autowired
	@Qualifier("adminMapServiceImpl")
	private AdminMapService adminMapService;
	
	@RequestMapping("index.do")
	public ModelAndView insert(){
		
		List<MasterCate> masterCateList = adminMapService.selectAll();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("materCateList",masterCateList);
		mav.setViewName("admin/index");
		
		return mav;
	}
	
	@RequestMapping("regist.do")
	public ModelAndView insert(SubCate subCate,TopCate topCate,MasterCate masterCate){ //form�±��� name�� dto�� �̸��� ���� ��� �ش� ������ �ڵ����� �Ѿ�´�.
		
		adminMapService.insert(subCate,topCate,masterCate);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("subcategory", subCate);
		mav.setViewName("admin/index");
		return mav;
	}
}
