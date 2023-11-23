package com.kh.korea.chatting.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ChattingDao {

	public int createChat(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("chattingMapper.createChat", map);
	}
	
}
