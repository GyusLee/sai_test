package com.sai.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sai.common.page.PagingManager;
import com.sai.model.domain.Board;
import com.sai.model.domain.Member;
import com.sai.model.service.BoardService;
import com.sai.model.service.CoupleService;
import com.sai.model.service.MemberService;
import com.sai.model.spring.dao.BoardDAOMybatis;

@Controller
@RequestMapping("/")
public class BoardController {

	@Autowired
	private BoardDAOMybatis boardDAOMybatis;

	private PagingManager pm = new PagingManager();

	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CoupleService coupleService;

	@RequestMapping("main/write.do")
	public ModelAndView insert(Board board, HttpSession session) {
		if (board.getContent() != null) {
			int result = boardService.insert(board);

			Member member = (Member) session.getAttribute("member");
			System.out.println(member.getM_email());
			System.out.println(board.getBoard_id());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("board_id", board.getBoard_id());
			map.put("m_email", member.getM_email());
			boardService.updateEmail(map);
		}
		List<Board> list = (List) boardService.selectAll();

		System.out.println("컨트롤러" + list.size());

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("redirect:/main/list.do");

		return mav;
	}

	@RequestMapping("main/list.do")
	public ModelAndView selectAll(HttpServletRequest request) {
		List list = boardService.selectAll();

		ModelAndView mav = new ModelAndView();

		/*
		 * if(member!=null){ request.setAttribute("member", member);
		 * mav.addObject("member", member); } if(couple!=null){
		 * request.setAttribute("couple", couple); mav.addObject("couple",
		 * couple); }
		 */

		request.setAttribute("list", list);
		mav.addObject("list", list);
		mav.setViewName("main/mainPage");

		return mav;
	}

	@RequestMapping("admin/boardList.do")
	public ModelAndView AselectAll(HttpServletRequest request) {
		List list = boardService.selectAll();
		request.setAttribute("list", list);
		pm.init(request);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pm", pm);
		mav.setViewName("admin/BoardList");

		return mav;
	}

	@RequestMapping("admin/boardDetail.do")
	public ModelAndView selectOne(int board_id) {
		Board board = boardService.selectOne(board_id);
		ModelAndView mav = new ModelAndView("admin/BoardDetail");
		mav.addObject("board", board);

		return mav;
	}

	@RequestMapping("admin/Bdelete.do")
	public String delete(int board_id) {
		boardDAOMybatis.delete(board_id);
		return "redirect:/admin/boardList.do";
	}

	@RequestMapping(value = "main/modal.do", method = RequestMethod.POST)	
	public @ResponseBody Map<String, Object> updateModal(@RequestBody Map<String,Object> map) {
    	
    	Board board=boardService.selectOne((Integer)map.get("board_id"));

    	Map<String, Object> result=new HashMap<String,Object>();

    	result.put("email",board.getM_email());
    	result.put("content",board.getContent());
    	

    	return result;
	}

}
