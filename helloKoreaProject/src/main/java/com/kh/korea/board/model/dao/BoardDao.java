package com.kh.korea.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.korea.board.model.vo.Board;

@Repository
public class BoardDao {
	
	// 정보게시판 글 개수
	public int countInfoList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.countInfoList");
	}
	
	// 정보게시판 글 리스트 조회
	public ArrayList<Board> selectInfoList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectInfoList", null, rowBounds);
	}

	// 게시글 조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.increaseCount", boardNo);
	}

	// 게시글 상세조회
	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}
	
	//  정보게시판 검색한 글 개수
	public int countSearchInfo(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.countSearchInfo", map);
	}

	// 정보게시판 검색 리스트
	public ArrayList<Board> selectSearchInfo(SqlSessionTemplate sqlSession, HashMap<String, String> map, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchInfo", map, rowBounds);
	}
	
	
	

	
}
