package com.sai.controller.map;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sai.model.domain.Cart;
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
		
		if(param.get("makeDateCourseFirst").equals("true")){
			date_Course.setName((String)param.get("name"));
			clientMapService.insertDateCourse(date_Course);
			System.out.println("dateCourse에 insert 완료!" +date_Course.getCourse_id());
			//이러면 안되지만 course_id를 session에 저장하자.
			session.setAttribute("course_id", date_Course.getCourse_id());
		}
		System.out.println("date_detail에 insert를 해보자.");
		Date_Detail date_Detail = new Date_Detail();
		date_Detail.setCourse_id((Integer)session.getAttribute("course_id"));
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
			
			if(param.get("makeDateCourseFirst").equals("true")){
				
				sb.append("<input type='hidden' id='course_id' value="+(Integer)session.getAttribute("course_id")+">");
			}
			
			printWriter.print(sb.toString());
			printWriter.flush();
			printWriter.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	@RequestMapping(value="insertCart.do", method = RequestMethod.GET)
	@ResponseBody
	public void insertCartAndReturnCart(Cart cart,HttpServletResponse response){
		System.out.println("Controller에 진입하셨습니다"+cart.getCouple_id());
	
		
		System.out.println(cart.getCouple_id()+"   "+cart.getCourse_id()+"아 무난하게 cart DTO에 들어갔군요.");
		
		clientMapService.insertCart(cart);
		
		System.out.println("이제 방금 집어 넣었던 cart정보를 select 해서 뺴오자.");
		System.out.println("그나저나 cart_id는 잘 들어왔나?   "+cart.getCart_id());
		Cart FullCart=clientMapService.selectLastCart(cart.getCart_id());
		System.out.println("cart dto하나 가져왔는데 그것의 course_id값은? "+FullCart.getCourse_id());
		
		
		System.out.println("추가적으로 Date_Course 테이블의 네임 값을 가져와보자.");
		Date_Course date_Course =clientMapService.selectOneDateCourse(FullCart.getCourse_id());
		System.out.println("성공적으로 Date_Course 값 불러옴 그럼 그 데이트 코스의 이름응ㄴ ?    : " + date_Course.getName());
		
		
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter printWriter = response.getWriter();
			StringBuffer sb = new StringBuffer();
			
			sb.append("<li  style=\"background-color:#BDF5EB; border:none;\" class=\"btn btn-info btn-lg\" data-toggle=\"modal\" data-target=\"#myModalDate\""+" onClick=\"showCourse("+FullCart.getCourse_id()+")\"><a href=\"#\" ><font style=\"width:100%;font-size:13pt;color:#FFFFFF; height:auto;\">"+date_Course.getName()+"<br>"+"등록일 : "+FullCart.getRegdate()+"</font></a></li>");
			
			printWriter.print(sb.toString());
			printWriter.flush();
			printWriter.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@RequestMapping(value="selectCourseAndSid.do", method = RequestMethod.GET)
	public void selectCourseAndSId(@RequestParam HashMap<String, Object> map,HttpServletResponse response){
		System.out.println("데이트 디테일들을 읽어들여볼까?");
		
		List<Date_Detail> dateDetailList =clientMapService.selectAllSpot(Integer.parseInt((String)map.get("course_id")));
		System.out.println("디테일 리스트 들을 받아왔으니 해당 detailList 에 맞는 subCateList 를 만들어야 한다.");
		
		ArrayList<SubCate> subCateList = new ArrayList<SubCate>();
		for(int i=0;i<dateDetailList.size();i++){
			SubCate subCate = clientMapService.selectOneSubCate(dateDetailList.get(i).getS_id());
			subCateList.add(subCate);
		}
		for(int i=0;i<dateDetailList.size();i++){
			System.out.println(subCateList.get(i).getName()+"오호라 상호명이 넘어 오는군.");
		}
		
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter printWriter = response.getWriter();
			StringBuffer sb = new StringBuffer();
			
			
			
			for(int i=0;i<subCateList.size();i++){
				sb.append("<div class=\"modal-header\">");
				sb.append("<button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>");
				sb.append("<h4 class=\"modal-title\">"+(i+1)+"번째 HOT PLACE"+"</h4>");
				sb.append("</div>");
				sb.append("<div class=\"modal-body\" style=\"height:400px\">");
				sb.append("<p> 상호명: "+subCateList.get(i).getName()+"</p>");
				sb.append("<p> 주소 : "+subCateList.get(i).getSido()+" "+subCateList.get(i).getGugun()+" "+subCateList.get(i).getDong()+" "+subCateList.get(i).getAddress_detail()+"</p>");
				sb.append("<p> 업체 정보 :"+subCateList.get(i).getContent()+"</p>");
				sb.append("<p> 전화 번호 :"+subCateList.get(i).getTel()+"</p>");
				sb.append("<img src=\"/data/"+subCateList.get(i).getPic()+"\">");
				sb.append("</div>");
			}
			/*sb.append("<div class=\"modal-footer\">");
			sb.append("<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button>");
			sb.append("</div>");*/
			printWriter.print(sb.toString());
			printWriter.flush();
			printWriter.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
