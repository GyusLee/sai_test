package com.sai.controller.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sai.model.domain.Board;
import com.sai.model.domain.Member;
import com.sai.model.service.BoardService;
import com.sai.model.service.CoupleService;
import com.sai.model.service.MemberService;

@Controller
@RequestMapping("/main/")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CoupleService coupleService;

	
	@RequestMapping("write.do")
	public ModelAndView insert(Board board, HttpSession session, HttpServletRequest request){
		// 업로드한 파일 처리!!
		MultipartFile myFile=board.getMyFile();
		String fileName=myFile.getOriginalFilename();
		
		ServletContext application= request.getServletContext();
		String realPath=application.getRealPath("/data/")+fileName;
		
		try {
			myFile.transferTo(new File(realPath));
			board.setImg(fileName);

			if(board.getContent()!=null){
				

				// 글 처리!!
				int result=boardService.insert(board);

				Member member=(Member)session.getAttribute("member");
				System.out.println(member.getM_email());
				System.out.println(board.getBoard_id());
				HashMap<String, Object> map = new HashMap<String,Object>();
				map.put("board_id",board.getBoard_id());
				map.put("m_email",member.getM_email());
				boardService.updateEmail(map);
			}

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		
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

		ModelAndView mav= new ModelAndView();
		
/*		if(member!=null){
			request.setAttribute("member", member);
			mav.addObject("member", member);
		}
		if(couple!=null){
			request.setAttribute("couple", couple);
			mav.addObject("couple", couple);
		}*/
		
		request.setAttribute("list", list);
		mav.addObject("list", list);
		mav.setViewName("main/mainPage");
		
		return mav;
	}
	
}
