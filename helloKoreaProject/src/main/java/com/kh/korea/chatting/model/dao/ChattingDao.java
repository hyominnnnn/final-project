package com.kh.korea.chatting.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.korea.chatting.model.vo.Chatting;

@Repository
public class ChattingDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("chattingMapper.selectListCount");
	}
	public ArrayList<Chatting> selectList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("chattingMapper.selectList", null, rowBounds);
	}
	
	public int createChat(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("chattingMapper.createChat", map);
	}

}
