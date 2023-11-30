package com.kh.korea.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.korea.board.model.vo.Board;
import com.kh.korea.board.model.vo.File;
import com.kh.korea.board.model.vo.Reply;

@Repository
public class BoardDao {
	
	// 정보게시판 글 총 개수
	public int countInfoList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.countInfoList");
	}
	// 정보게시판 리스트 조회
	public ArrayList<Board> selectInfoList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectInfoList", null, rowBounds);
	}
	// 정보게시글 작성하기(INSERT)
	public int insertInfo(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.insert("boardMapper.insertInfo", board);
	}
	//  정보게시판 검색한 글 개수
	public int countSearchInfo(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.countSearchInfo", map);
	}
	// 정보게시판 검색 리스트
	public ArrayList<Board> selectSearchInfo(SqlSessionTemplate sqlSession, HashMap<String, String> map, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchInfo", map, rowBounds);
	}
	
	
	
	
	
	// 자유게시판 글 총 개수
	public int countFreeList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.countFreeList");
	}
	// 자유게시판 리스트 조회
	public ArrayList<Board> selectFreeList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectFreeList", null, rowBounds);
	}
	
	// 정보게시글 작성하기(INSERT)
	public int insertFree(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.insert("boardMapper.insertFree", board);
	}
	
	// 자유게시판 검색한 게시글 수
	public int countSearchFree(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.countSearchFree", map);
	}
	// 자유게시판 검색 리스트
	public ArrayList<Board> selectSearchFree(SqlSessionTemplate sqlSession, HashMap<String, String> map, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchFree", map, rowBounds);
	}
	// 자유게시글 삭제하기(UPDATE)
	public int deleteFree(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.deleteBoardFree", boardNo);
	}
	// 자유게시글 수정하기(UPDATE)
	public int updateFree(SqlSessionTemplate sqlSession, Board b) {
		//System.out.println(b);
		return sqlSession.update("boardMapper.updateBoardFree", b);
	}
	
	public int updateFileFree(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.update("boardMapper.updateFileFree" , board);
	}
	
	
	
	
	
	// (공통)게시글 조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.increaseCount", boardNo);
	}

	// (공통)게시글 상세조회
	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}
	// (공통)파일 업로드
	public int insertFile(SqlSessionTemplate sqlSession, File file) {
		return sqlSession.insert("boardMapper.insertFile", file);
	}
	public int updateFileFree(SqlSessionTemplate sqlSession, MultipartFile reUpfile) {
		return sqlSession.insert("boardMapper.insertFile", reUpfile);
	}
	
	
	
	// (공통)댓글 목록 조회
	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReply", boardNo);
	}
	// (공통)댓글 작성(INSERT)
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}
	
	
	
}
