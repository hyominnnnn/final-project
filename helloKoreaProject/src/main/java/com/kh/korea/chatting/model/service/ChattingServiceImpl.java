package com.kh.korea.chatting.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.korea.chatting.model.dao.ChattingDao;

@Service
public class ChattingServiceImpl implements ChattingService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ChattingDao chattingDao;
	@Override
	public int createChat(HashMap<String, Object> map) {
		return chattingDao.createChat(sqlSession, map);
	}

}
