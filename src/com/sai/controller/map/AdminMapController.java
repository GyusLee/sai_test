package com.sai.controller.map;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sai.model.domain.Address;
import com.sai.model.domain.MasterCate;
import com.sai.model.domain.SubCate;
import com.sai.model.domain.TopCate;
import com.sai.model.service.AdminMapService;

@Controller//Dispatcher-Servlet에게 MapController의 위치를 알린다.
@RequestMapping("/admin/")
public class AdminMapController {
	
	@Autowired
	@Qualifier("adminMapServiceImpl")
	private AdminMapService adminMapService;
	
	//처음 요청이 들어오면 MasterCateList를 가져온다.
	@RequestMapping("index.do")
	public ModelAndView select(){
		//System.out.println("Controller 진입");
		List<MasterCate> masterCateList = adminMapService.selectAll();
		List<Address> sidoList=adminMapService.selectAllSido();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("masterCateList",masterCateList);
		mav.addObject("sidoList", sidoList);
		mav.setViewName("admin/index");
		
		return mav;
	}
	
	//MasterCate를 선택한 후 그 값에 대한 TopCate를 바환하기 위함.
	@ResponseBody
	@RequestMapping(value="selectTopCate.do", method = RequestMethod.POST)
	public void select(@RequestParam HashMap<String,Object> param,HttpServletResponse response){
		//System.out.println("여긴 오나? " + Integer.parseInt((String)param.get("Tid")));
		List<TopCate> topCateList=adminMapService.selectAll(Integer.parseInt((String)param.get("Mid")));
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter printWriter = response.getWriter();
			StringBuffer sb = new StringBuffer();
			sb.append("<option>");
			sb.append("선 택 ▼");
			sb.append("</option>");
			for(int i=0;i<topCateList.size();i++){
				sb.append("<option value="+topCateList.get(i).getT_id()+">");
				sb.append(topCateList.get(i).getT_type());
				sb.append("</option>");
			}
			System.out.println(sb.toString());
			
			printWriter.print(sb.toString());
			
			printWriter.flush();
			printWriter.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//Sido를 선택한 후 그 값에 대한 Gugun을 반환하기 위함.
	@ResponseBody
	@RequestMapping(value="selectGugun.do", method = RequestMethod.POST)
	public void selectGugun(@RequestParam HashMap<String,Object> param,HttpServletResponse response){
		//System.out.println("여긴 오나? " + Integer.parseInt((String)param.get("Tid")));
		List<Address> gugunList=adminMapService.selectAllGugun((String)param.get("sido"));
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter printWriter = response.getWriter();
			StringBuffer sb = new StringBuffer();
			sb.append("<option>");
			sb.append("선 택 ▼");
			sb.append("</option>");
			for(int i=0;i<gugunList.size();i++){
				sb.append("<option>");
				sb.append(gugunList.get(i).getGugun());
				sb.append("</option>");
			}
			
			printWriter.print(sb.toString());
			printWriter.flush();
			printWriter.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//Sido를 선택한 후 그 값에 대한 Gugun을 반환하기 위함.
	@ResponseBody
	@RequestMapping(value="selectDong.do", method = RequestMethod.POST)
	public void selectDong(@RequestParam HashMap<String,Object> param,HttpServletResponse response){
		//System.out.println("여긴 오나? " + Integer.parseInt((String)param.get("Tid")));
		List<Address> dongList=adminMapService.selectAllDong((String)param.get("gugun"));
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter printWriter = response.getWriter();
			StringBuffer sb = new StringBuffer();
			sb.append("<option>");
			sb.append("선 택 ▼");
			sb.append("</option>");
			for(int i=0;i<dongList.size();i++){
				sb.append("<option>");
				sb.append(dongList.get(i).getDong());
				sb.append("</option>");
			}
			
			printWriter.print(sb.toString());
			printWriter.flush();
			printWriter.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	//subCate로 등록처리
	@RequestMapping("regist.do")
	public String insert(SubCate subCate,HttpServletRequest request){ //form태그의 name과 dto의 이름이 같을 경우 해당 값들이 자동으로 넘어온다.

		MultipartFile myFile = subCate.getMyFile();
		String fileName=myFile.getOriginalFilename();
		
		System.out.println(fileName);
		ServletContext application = request.getServletContext();
		String realPath=application.getRealPath("/data/")+fileName;
		System.out.println(realPath);
		try {
			
			myFile.transferTo(new File(realPath));
			//pic은 여기서 따로 저장해둔다.
			subCate.setPic(fileName);
			adminMapService.insert(subCate);
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("등록 성공");
		return "redirect:/admin/index.do";
	}
}
