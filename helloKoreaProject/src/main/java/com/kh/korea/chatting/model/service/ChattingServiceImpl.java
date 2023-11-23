package com.kh.korea.chatting.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.korea.chatting.model.dao.ChattingDao;
import com.kh.korea.chatting.model.vo.Chatting;
import com.kh.korea.common.model.vo.PageInfo;

@Service
public class ChattingServiceImpl implements ChattingService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ChattingDao chattingDao;
	
	@Override
	public int selectListCount() {
		return chattingDao.selectListCount(sqlSession);
	}
	@Override
	public ArrayList<Chatting> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return chattingDao.selectList(sqlSession, rowBounds);
	}
	
	@Override
	public int createChat(HashMap<String, Object> map) {
		return chattingDao.createChat(sqlSession, map);
	}

}
