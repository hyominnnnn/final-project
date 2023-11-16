package com.kh.korea.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.korea.member.model.dao.MemberDao;
import com.kh.korea.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao md;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertMember(Member m) {
		return md.insertMember(sqlSession, m);
	}
/*
	@Override
	public void sendMail(CertVo certVo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean validate(CertVO certVo) {
		// TODO Auto-generated method stub
		return false;
	}
*/
	@Override
	public int idCheck(String checkId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member loginMember(Member m) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

}
