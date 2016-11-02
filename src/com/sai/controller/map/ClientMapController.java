package com.sai.controller.map;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public ModelAndView selectAllSubCate(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<SubCate> subCateList =clientMapService.selectAllSubCate();  
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		ModelAndView mav = new ModelAndView();
		mav.addObject("subCateList",subCateList);
		session.setAttribute("subCateList",subCateList);
		mav.setViewName("redirect:/main/list.do");
		return mav;
	}
}
