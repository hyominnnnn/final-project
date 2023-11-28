package com.kh.korea.chatting.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.korea.chatting.model.service.ChattingService;
import com.kh.korea.chatting.model.vo.Chatting;
import com.kh.korea.common.model.vo.PageInfo;
import com.kh.korea.common.template.Pagination;

@Controller
public class ChattingController {
	
	@Autowired
	private ChattingService chattingService;
	
	@RequestMapping("groupChatList")
	public String groupChatList(@RequestParam(value="cPage", defaultValue="1") int currentPage, Model model) {
		PageInfo pi = Pagination.getPageInfo(chattingService.selectListCount(), currentPage, 10,5);
		ArrayList<Chatting> list =chattingService.selectList(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi",pi);
		//System.out.println(list);
		
		return "chatting/groupChatListPage";
	}
	
	
	@RequestMapping("createChat")
	public void createChat(String chatTitle, int memberNo) {
		
		HashMap<String, Object> map =new HashMap();
		map.put("chatTitle", chatTitle);
		map.put("memberNo", memberNo);
		
		int result = chattingService.createChat(map);
		
		if(result > 0) {
			System.out.println("잘됨?");
		}else {
			System.out.println("안됨");
			
		}
	}
	
	@RequestMapping("getMemberInfo")
	public void getMemberInfo() {
		System.out.println("왔니?");
	}
	
}
