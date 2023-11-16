package com.kh.korea.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.korea.member.model.vo.Member;

@Repository
public class AdminDao {
	


	public int selectMemberList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return 0;

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectListCount");

	public int selectList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.seletList");

	}
	
	public ArrayList<Member> selectList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectList", null, rowBounds);
	}


}
