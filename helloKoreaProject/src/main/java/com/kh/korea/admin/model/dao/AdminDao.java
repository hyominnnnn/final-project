package com.kh.korea.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.korea.board.model.vo.Board;
import com.kh.korea.member.model.vo.Member;

@Repository
public class AdminDao {
	

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectListCount");
	}
	
	public ArrayList<Member> selectList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectList", null, rowBounds);
	}
	
	public Member memberDetail(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("adminMapper.memberDetail", m);
	}
	
	// --------------------------------------------------------------------

	public int selectBoardListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectBoardListCount");
	}

	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectBoardList", null, rowBounds);
	}




}
