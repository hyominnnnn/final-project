package com.kh.korea.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.korea.member.model.vo.Member;

@Repository
public class MemberDao {

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}

	public int nickCheck(SqlSessionTemplate sqlSession, String checkNick) {
		return sqlSession.selectOne("memberMapper.nickCheck", checkNick);
	}

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int kakaoCheck(SqlSessionTemplate sqlSession, String id) {
		System.out.println("dao id는" + id);
		return sqlSession.selectOne("memberMapper.kakaoCheck", id);
	}

	public Member kakaoLogin(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.kakaoLogin", id);
	}

}
