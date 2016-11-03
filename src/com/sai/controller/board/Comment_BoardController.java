package com.sai.controller.board;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sai.model.domain.Comment_Board;
import com.sai.model.service.Comment_BoardService;

@Controller
@RequestMapping("/")
public class Comment_BoardController {

	@Autowired
	private Comment_BoardService comment_BoardService;
	
	@RequestMapping(value = "main/reWrite.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> reply(@RequestBody Map<String, Object> map){
		System.out.println("커멘트 들어완?");
		
		Comment_Board comment_Board = new Comment_Board();
		int board_id=Integer.parseInt(map.get("board_id").toString());
		comment_Board.setBoard_id(board_id);
		comment_Board.setContent((String)map.get("content"));
		comment_Board.setM_email((String)map.get("m_email"));
		
		System.out.println(comment_Board.getBoard_id());
		System.out.println(comment_Board.getContent());
		System.out.println(comment_Board.getM_email());
		
		
		comment_BoardService.reply(comment_Board);
		
		Map<String, Object> result = new HashMap<String, Object>();
		

		return result;
	}
}
