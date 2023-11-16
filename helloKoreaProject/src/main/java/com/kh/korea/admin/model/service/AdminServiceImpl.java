package com.kh.korea.admin.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.korea.admin.model.dao.AdminDao;
import com.kh.korea.common.model.vo.PageInfo;
import com.kh.korea.member.model.vo.Member;

@Service
public class AdminServiceImpl implements  AdminService{

	@Autowired
	private AdminDao adminDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override

	public int selectMemberList() {
		return adminDao.selectMemberList(sqlSession);

	public int selectListCount() {
		return adminDao.selectListCount(sqlSession);

	public int selectListCount() {
		return adminDao.selectList(sqlSession);

	}
	
	@Override
	public ArrayList<Member> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return adminDao.selectList(sqlSession, rowBounds);
	}


	

}
