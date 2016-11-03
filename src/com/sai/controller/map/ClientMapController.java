package com.sai.controller.map;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sai.model.domain.Date_Course;
import com.sai.model.domain.Date_Detail;
import com.sai.model.domain.SubCate;
import com.sai.model.service.ClientMapService;

@Controller
@RequestMapping("/main/")
public class ClientMapController {
	
	@Autowired
	@Qualifier("clientMapServiceImpl")
	private ClientMapService clientMapService;
	
	@RequestMapping("index.do")
	public ModelAndView selectAllSubCate(HttpSession session){
		
		List<SubCate> subCateList =clientMapService.selectAllSubCate();  
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("subCateList",subCateList);
		session.setAttribute("subCateList",subCateList);
		session.setAttribute("courseCount",0);
		//mav.setViewName("main/index");
		mav.setViewName("redirect:/main/list.do");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="insertDateCourse.do", method = RequestMethod.GET)
	public void insertDateCourse(@RequestParam HashMap<String,Object> param,HttpServletResponse response, HttpSession session){
		System.out.println(Integer.parseInt((String)param.get("s_id"))+"  "+(String)param.get("name"));
		
		Date_Course date_Course=new Date_Course();
		date_Course.setName((String)param.get("name"));
		clientMapService.insertDateCourse(date_Course);
		System.out.println("dateCourse에 insert 완료!" +date_Course.getCourse_id());
		
		System.out.println("date_detail에 insert를 해보자.");
		Date_Detail date_Detail = new Date_Detail();
		date_Detail.setCourse_id(date_Course.getCourse_id());
		date_Detail.setS_id(Integer.parseInt((String)param.get("s_id")));
		date_Detail.setName((String)param.get("subCateName"));
		clientMapService.insertDateDetail(date_Detail);
		System.out.println("date_detail에 insert 완료!");
		
		int count=(int)session.getAttribute("courseCount");
		count++;
		session.setAttribute("courseCount", count);
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter printWriter = response.getWriter();
			StringBuffer sb = new StringBuffer();
			
			sb.append("<div class=\"panel-group\">");
			sb.append("<div class=\"panel panel-warning\">");
			sb.append("<div class=\"panel-heading\">"+"place"+count+"</div>");
			sb.append("<div class=\"panel-body\">"+(String)param.get("subCateName")+"</div>");
			sb.append("</div>");
			sb.append("</div>");
			
			if(param.get("makeDateCourseFirst")=="true"){
				sb.append("<input type='hidden' id='course_id' value="+date_Course.getCourse_id()+">");
			}
			
			printWriter.print(sb.toString());
			printWriter.flush();
			printWriter.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
