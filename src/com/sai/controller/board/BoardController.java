package com.sai.controller.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sai.common.page.PagingManager;
import com.sai.model.domain.Board;
import com.sai.model.domain.Comment_Board;
import com.sai.model.domain.Member;
import com.sai.model.service.BoardService;
import com.sai.model.service.Comment_BoardService;
import com.sai.model.service.CoupleService;
import com.sai.model.service.LikesService;
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
	@Autowired
	private LikesService likesService;
	@Autowired
	Comment_BoardService comment_BoardService;
	
	@RequestMapping("main/write.do")
	public String insert(Board board, HttpSession session, HttpServletRequest request) {
		// 업로드한 파일 처리!!
		MultipartFile myFile = board.getMyFile();
		String fileName = myFile.getOriginalFilename();

		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/data/") + fileName;
		
		if (board.getContent() != null) {
			try {
				myFile.transferTo(new File(realPath));
				board.setImg(fileName);
				
				System.out.println("사진 저장 경로"+realPath);

				// 글 처리!!
				int result = boardService.insert(board);

				Member member = (Member) session.getAttribute("member");
				System.out.println(member.getM_email());
				System.out.println(board.getBoard_id());
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("board_id", board.getBoard_id());
				map.put("m_email", member.getM_email());
				map.put("img", fileName);
				boardService.updateEmail(map);

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		// 저장
		List<Board> list = (List) boardService.selectAll();
		
		System.out.println("컨트롤러" + board.getMyFile().getOriginalFilename());
		
		return "redirect:/main/list.do";
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
		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/data/");
		request.setAttribute("list", list);
		mav.addObject("list", list);
		List memberList=new LinkedList<>();
		
		for(int i=0;i<list.size();i++){
			Board board=(Board)list.get(i);
			Member member=new Member();
			member.setM_email(board.getM_email());		
			member=memberService.selectPartner(member);
			if(member.getImg()==null){
				memberList.add(member.getImg());
			}else{
			memberList.add("/data/"+member.getImg());
			System.out.println(realPath+member.getImg());
			}
			
		}
		mav.addObject("memberList",memberList);
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
	public String delete(Board board) {
		boardService.delete(board);
		return "redirect:/admin/boardList.do";
	}

	@RequestMapping(value = "main/modal.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateModal(@RequestBody Map<String, Object> map) {

		Board board = boardService.selectOne((Integer) map.get("board_id"));
		int likesNumber=likesService.selectAll((Integer) map.get("board_id")).size();
		List rList=comment_BoardService.selectAll((Integer) map.get("board_id"));
		List listName=new LinkedList<>();
		Member searchMember=new Member();
		searchMember.setM_email(board.getM_email());
		searchMember=memberService.selectPartner(searchMember);
		for(int i=0;i<rList.size();i++){
			Comment_Board reBoard=(Comment_Board)rList.get(i);
			Member member=new Member();
			member.setM_email(reBoard.getM_email());
			member=memberService.selectPartner(member);
			listName.add(member);
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("img", board.getImg());
		result.put("name",searchMember.getM_name());
		result.put("myImg", searchMember.getImg());
		result.put("email", board.getM_email());
		result.put("content", board.getContent());
		result.put("likesNumber", likesNumber);
		result.put("rList", rList);
		result.put("listName", listName);
		return result;
	}

}
