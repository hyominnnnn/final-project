package com.kh.korea.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.korea.member.model.dao.MemberDao;
import com.kh.korea.member.model.vo.Cert;
import com.kh.korea.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertMember(Member m) {
		//System.out.println("서비스 m " + m);
		return memberDao.insertMember(sqlSession, m);
	}

	@Override
	public int sendMail(Cert cert) {
		return memberDao.sendMail(sqlSession, cert);
	}

	@Override
	public boolean validate(Cert cert) {
		boolean result = memberDao.validate(sqlSession, cert);
		if(result != false) {
			memberDao.deleteCert(sqlSession,cert);
		}
		return result;
	}

	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}
	
	@Override
	public int nickCheck(String checkNick) {
		return memberDao.nickCheck(sqlSession, checkNick);
	}

	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int socialCheck(String id) {
		
		return memberDao.socialCheck(sqlSession, id);
	}

	@Override
	public Member socialLogin(String id) {
		return memberDao.socialLogin(sqlSession, id);
	}

}
