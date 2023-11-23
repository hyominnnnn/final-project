package com.kh.korea.chatting.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.korea.chatting.model.vo.Chatting;
import com.kh.korea.common.model.vo.PageInfo;

public interface ChattingService {
	//페이징처리
	int selectListCount();
	ArrayList<Chatting> selectList(PageInfo pi);
	
	
	int createChat(HashMap<String, Object> map);
}
