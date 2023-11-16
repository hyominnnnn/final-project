package com.kh.korea.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {

<<<<<<< Updated upstream
	public int selectMemberList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return 0;
=======
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectListCount");
>>>>>>> Stashed changes
	}

}
