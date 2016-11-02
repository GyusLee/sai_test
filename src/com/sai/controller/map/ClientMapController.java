package com.sai.controller.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sai.model.domain.SubCate;
import com.sai.model.service.ClientMapService;

@Controller
@RequestMapping("/main/")
public class ClientMapController {
	
	@Autowired
	@Qualifier("clientMapServiceImpl")
	private ClientMapService clientMapService;
	
	@RequestMapping("index.do")
	public ModelAndView selectAllSubCate(){
		
		List<SubCate> subCateList =clientMapService.selectAllSubCate();  
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("subCateList",subCateList);
		mav.setViewName("main/index");
		return mav;
	}
}
