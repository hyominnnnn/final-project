package com.kh.korea.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.korea.member.model.vo.Cert;
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

	public int socialCheck(SqlSessionTemplate sqlSession, String id) {
		System.out.println("dao id는" + id);
		return sqlSession.selectOne("memberMapper.socialCheck", id);
	}

	public Member socialLogin(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.socialLogin", id);
	}

	public int sendMail(SqlSessionTemplate sqlSession, Cert cert) {
		return sqlSession.insert("memberMapper.sendMail", cert);
	}
	
	public boolean validate(SqlSessionTemplate sqlSession, Cert cert) {
		Cert result = sqlSession.selectOne("memberMapper.validate", cert);
		return result != null;
	}
	public void deleteCert(SqlSessionTemplate sqlSession, Cert cert) {
		sqlSession.delete("memberMapper.deleteCert", cert);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.update("memberMapper.deleteMember", email);
	}

}
