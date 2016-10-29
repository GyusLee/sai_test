package com.sai.controller.map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sai.model.domain.MasterCate;
import com.sai.model.domain.SubCate;
import com.sai.model.domain.TopCate;
import com.sds.model.service.AdminMapService;


@Controller//Dispatcher-Servlet에게 MapController의 위치를 알린다.
public class AdminMapController {
	
	@Autowired
	AdminMapService adminMapService;
	
	@RequestMapping("/admin/regist.do")
	public ModelAndView insert(SubCate subCate,TopCate topCate,MasterCate masterCate){ //form태그의 name과 dto의 이름이 같을 경우 해당 값들이 자동으로 넘어온다.
		
		adminMapService.insert();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("subcategory", subCate);
		mav.setViewName("admin/index");
		return mav;
	}
}
