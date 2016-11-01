package com.sai.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sai.model.domain.Board;
import com.sai.model.service.BoardService;

@Controller
@RequestMapping("/main/")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@RequestMapping("write.do")
	public ModelAndView insert(Board board){
		if(board.getContent()!=null)
			boardService.insert(board);
		List<Board> list=(List)boardService.selectAll();
		
		System.out.println("컨트롤러"+list.size());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("redirect:/main/list.do");
		
		return mav;
	}
	
	@RequestMapping("list.do")
	public ModelAndView selectAll(HttpServletRequest request){
		List list=boardService.selectAll();
		request.setAttribute("list", list);
		
		ModelAndView mav= new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("main/mainPage");
		
		return mav;
	}
}
