package com.sai.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sai.common.page.PagingManager;
import com.sai.model.domain.Couple;
import com.sai.model.domain.Member;
import com.sai.model.service.CoupleService;
import com.sai.model.service.MemberService;
import com.sai.model.spring.dao.MemberDAOMybatis;

@Controller
@RequestMapping("/")
public class MemberController {
	@Autowired
	private MemberDAOMybatis memberDAOMybatis;
	
	private PagingManager pm = new PagingManager();
	
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CoupleService coupleService;
	
	@RequestMapping("admin/member.do")
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
			
	@RequestMapping("admin/memberDetail.do")
	public ModelAndView selectOne(Member member){
		Member selectedmember = memberDAOMybatis.selectOne(member);
		ModelAndView mav = new ModelAndView("admin/memberDetail");
		mav.addObject("member", selectedmember);
		
		return mav;
	}
	
	@RequestMapping("admin/delete.do")
	public String delete(Member member){
		memberDAOMybatis.delete(member);
		return "redirect:/admin/member.do";
	}
	
	@RequestMapping("main/temp.do")
	public ModelAndView insert_first(Member member){
		int result=memberService.select(member);
		ModelAndView mav=new ModelAndView();
		if(result==0){
			//회원이 없다면 등록하고 커플 연결 페이지로
			memberService.insert_first(member);
			mav.addObject("member",member);
			mav.setViewName("main/regist_temp");
			System.out.println("회원이없음");
		}else if(result==1){
			//회원이 있는데 커플이 연결 안되어있으면 연결 페이지로
			System.out.println("회원이있는데 연결이 안되어있음");
			mav.addObject("member",member);
			mav.setViewName("main/regist_temp");
			
		}else if(result==2){
			System.out.println("회원가입완료됨");
			//회원이 있고 연결도 되어있다면 시작페이지로
			Member searchMember=new Member();
			searchMember=memberService.selectPartner(member);
			System.out.println(searchMember.getCouple_id());
			Couple couple=new Couple();
			couple=coupleService.select(searchMember.getCouple_id());
			//System.out.println(couple.getF_email());
			//System.out.println(couple.getM_email());
			
			mav.addObject("couple",couple);
			mav.addObject("member",searchMember);
			mav.setViewName("redirect:/main/list.do");
		}

		return mav;
	}
	@RequestMapping("main/update_regist.do")
	public ModelAndView update_regist(Member member){
		System.out.println("파트너 등록창");
		String m_email=member.getM_email();
		String p_email=member.getP_email();
		//파트너에 값 가져온다.
		System.out.println("상대방"+member.getP_email());
		System.out.println("나"+member.getM_email());
		Member you=new Member();
		you=member;

		Member me=new Member();
		me=member;
		
		System.out.println("test0");
		System.out.println("나 : "+me.getM_email());
		System.out.println("내 파트너 : "+me.getP_email());
		int result=memberService.update_regist(me);
		
		//you.setM_email(me.getP_email());
		//you.setP_email(me.getM_email());

		me.setM_email(m_email);
		me=memberService.selectPartner(me);
		you.setM_email(p_email);
		you.setP_email(m_email);
		
		System.out.println("여기까지");
		System.out.println(you);
		System.out.println(you.getM_email());
		System.out.println(you.getP_email());
		result=memberService.select(you);
		ModelAndView mav=new ModelAndView();
		if(result==0){
			//상대방이 회원이 등록되어 있지 않음
			System.out.println("상대방회원이 등록되어있지않음");
	
			mav.setViewName("main/regist_temp");
			System.out.println(me);
			System.out.println(me.getP_email());
			mav.addObject("member",me);
			return mav;
		}
		you=memberService.selectPartner(you);
		System.out.println("test2");
		System.out.println("나 : "+me.getM_email());
		System.out.println("내 파트너 : "+me.getP_email());
		System.out.println("상대 : "+you.getM_email());
		System.out.println("상대 파트너 :"+you.getP_email());
		
		if(me.getP_email().equals(you.getM_email())&&you.getP_email().equals(me.getM_email())){
			//상대와 나와 같은 상황이면!!!
			System.out.println("나와같은상황");
			Couple couple=new Couple();
			System.out.println(couple);
			if(me.getM_gender().equals("M")){
				couple.setM_email(me.getM_email());
				couple.setF_email(you.getM_email());
				
			}else if(me.getM_gender().equals("F")){
				couple.setF_email(me.getM_email());
				
				couple.setM_email(you.getM_email());
				System.out.println(couple.getF_email());
				System.out.println(couple.getM_email());
			}

			System.out.println("두번쨰");
			result=coupleService.insert(couple);
			System.out.println("세번째");
			result=coupleService.selectSeq();
			you.setCouple_id(result);
			me.setCouple_id(result);
			memberService.update(you);
			memberService.update(me);
			
			//등록하고 상대방도 등록한다.
			if(result!=0){
				Couple couple1=new Couple();
				couple1=coupleService.select(me.getCouple_id());
				mav.addObject("couple",couple1);
				mav.addObject("member",me);
				mav.setViewName("redirect:/main/list.do");
				return mav;
			}
		}
		
		mav.setViewName("main/regist_temp");
		System.out.println(me);
		mav.addObject("member",me);
		return mav;
	}
	@RequestMapping("main/refresh.do")
	public ModelAndView refresh(Member member){

		Member me=new Member();
		Member you=new Member();
		me.setM_email(member.getM_email());
		me.setP_email(member.getP_email());
		you.setM_email(member.getP_email());
		you.setP_email(member.getM_email());

		me=memberService.selectPartner(me);

		you=memberService.selectPartner(you);
		

		ModelAndView mav=new ModelAndView();
		if(you!=null&&me.getP_email().equals(you.getM_email())&&you.getP_email().equals(me.getM_email())){	
			
			Couple couple=new Couple();
			couple=coupleService.select(member.getCouple_id());
			System.out.println(couple.getF_email());
			System.out.println(couple.getM_email());
			mav.addObject("couple",couple);
			mav.addObject("member",member);
			mav.setViewName("redirect:/main/list.do");
			
			return mav;
		}
		
		
		mav.setViewName("main/regist_temp");
		mav.addObject("member",me);
		return mav;
	}	
}
