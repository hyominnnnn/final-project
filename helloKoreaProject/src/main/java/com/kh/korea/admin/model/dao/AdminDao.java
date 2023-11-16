package com.kh.korea.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.korea.member.model.vo.Member;

@Repository
public class AdminDao {
	

	public int selectList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.seletList");
	}
	
	public ArrayList<Member> selectList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectList", null, rowBounds);
	}


}
