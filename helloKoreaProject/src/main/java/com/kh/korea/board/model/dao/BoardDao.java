package com.kh.korea.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.korea.board.model.vo.Board;

@Repository
public class BoardDao {
	
	public int countInfoList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.countInfoList");
	}
	
	public ArrayList<Board> selectInfoList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectInfoList", null, rowBounds);
	}

}
