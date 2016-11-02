package com.sai.controller.likes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sai.model.domain.Likes;
import com.sai.model.service.LikesService;
import com.sai.model.spring.dao.LikesDAOMybatis;

@Controller
@RequestMapping("/main/")
public class LikesController {
	
	@Autowired
	private LikesDAOMybatis likesDAOMybatis;

	@Autowired
	private LikesService likesService;
	

	@RequestMapping(value = "isLikes.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> isLikes(@RequestBody Map<String, Object> map){
		System.out.println("���ƿ�");
		int l_num=(Integer)map.get("board_id");
		String m_email=(String)map.get("m_email");
		System.out.println(l_num);
		System.out.println(m_email);
		Likes likes=new Likes();
		likes.setL_num(l_num);
		likes.setM_email(m_email);
		List list1=likesService.selectAll(l_num);
		System.out.println(list1.size());
		int result=0;
		System.out.println(likesService.select(likes));
		if(likesService.select(likes)==null)
		{
			//���ƿ䰡 ����
			System.out.println("���ƿ䰡 ����");
			likesService.insert(likes);
			result=1;
			//���ƿ� �߰��ϰ� ��ü ���� ��ȯ
		}else{
			System.out.println("���ƿ䰡 �ֵ�");
			//���ƿ䰡 �ִ�
			//����� ��ü ���� ��ȯ
			likesService.delete(likes);
			result=0;
		};
		List list=likesService.selectAll(l_num);
		int maxNum=list.size();
		Map<String, Object> resultMap=new HashMap<String,Object>();
		resultMap.put("maxNum", maxNum);
		resultMap.put("result", result);
		
		return resultMap;
	}
}
