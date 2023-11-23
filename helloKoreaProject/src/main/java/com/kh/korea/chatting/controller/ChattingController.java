package com.kh.korea.chatting.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.korea.chatting.model.service.ChattingService;

@Controller
public class ChattingController {
	
	@Autowired
	private ChattingService chattingService;
	
	@GetMapping("groupChatList")
	public String groupChatList() {
		return "chatting/groupChatListPage";
	}
	
	
	@RequestMapping("createChat")
	public void createChat(String chatTitle, int memberNo) {
		System.out.println(chatTitle);
		System.out.println(memberNo);
		
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
	
}
