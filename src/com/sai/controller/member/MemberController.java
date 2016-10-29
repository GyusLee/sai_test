package com.sai.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sai.common.page.PagingManager;
import com.sai.model.domain.Member;
import com.sai.model.spring.dao.MemberDAOMybatis;

@Controller
@RequestMapping("/sai/admin")
public class MemberController {
	@Autowired
	private MemberDAOMybatis memberDAOMybatis;
	
	private PagingManager pm = new PagingManager();
	
	@RequestMapping("member.do")
	public ModelAndView selectAll(HttpServletRequest request){
		List list = memberDAOMybatis.selectAll();
		request.setAttribute("list", list);
		pm.init(request);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pm", pm);
		mav.setViewName("admin/member");
		return mav;
	}
	
	@RequestMapping("memberDetail.do")
	public ModelAndView select(int member_id){
		Member member = memberDAOMybatis.select(member_id);
		ModelAndView mav = new ModelAndView("admin/memberDetail");
		mav.addObject("member", member);
		
		return mav;
	}
	
	@RequestMapping("delete.do")
	public String delete(int member_id){
		memberDAOMybatis.delete(member_id);
		return "redirect:/admin/member.do";
	}
}
