package com.kh.korea.chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChattingForwardController {
	@GetMapping("groupChatList")
	public String groupChatList() {
		return "chatting/groupChatListPage";
	}
	
	
}
