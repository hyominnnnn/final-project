package com.kh.korea.admin.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.korea.admin.model.dao.AdminDao;

@Service
public class AdminServiceImpl implements  AdminService{

	@Autowired
	private AdminDao adminDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectMemberList() {
		return adminDao.selectMemberList(sqlSession);
	}

}
