package com.kh.korea.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.kh.korea.board.model.dao.BoardDao;
import com.kh.korea.board.model.vo.Board;
import com.kh.korea.board.model.vo.File;
import com.kh.korea.common.model.vo.PageInfo;

@Service
@EnableTransactionManagement
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 정보 게시판 글 개수
	@Override
	public int countInfoList() {
		return boardDao.countInfoList(sqlSession);
	}

	// 정보 게시판 글 리스트 조회
	@Override
	public ArrayList<Board> selectInfoList(PageInfo infoPi) {
		int offset = (infoPi.getCurrentPage() - 1) * infoPi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, infoPi.getBoardLimit());
		return boardDao.selectInfoList(sqlSession, rowBounds);
	}

	// 게시글 조회수 증가
	@Override
	public int increaseCount(int boardNo) {
		return boardDao.increaseCount(sqlSession, boardNo);
	}

	// 게시글 상세조회
	@Override
	public Board selectBoard(int boardNo) {
		return boardDao.selectBoard(sqlSession, boardNo);
	}

	// 정보게시판 검색한 게시글 수
	@Override
	public int countSearchInfo(HashMap<String, String> map) {
		return boardDao.countSearchInfo(sqlSession, map);
	}

	// 정보게시판 검색 리스트
	@Override
	public ArrayList<Board> selectSearchInfo(HashMap<String, String> map, PageInfo infoPi) {
		int offset = (infoPi.getCurrentPage() - 1) * infoPi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, infoPi.getBoardLimit());
		return boardDao.selectSearchInfo(sqlSession, map, rowBounds);
	}

	// 정보게시판 글 작성
	@Override
	@Transactional("transactionManager")
	public int insertInfo(Board board, File file) {
		int result1 = boardDao.insertInfo(sqlSession, board);
		int result2 = boardDao.insertFile(sqlSession, file);
		return (result1 * result2);
	}
	
	
	

	


	// 자유 게시판 글 개수
	@Override
	public int countFreeList() {
		return boardDao.countFreeList(sqlSession);
	}

	// 자유 게시판 글 리스트 조회
	@Override
	public ArrayList<Board> selectFreeList(PageInfo infoPi) {
		int offset = (infoPi.getCurrentPage() - 1) * infoPi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, infoPi.getBoardLimit());
		return boardDao.selectFreeList(sqlSession, rowBounds);
	}
	
	// 자유게시판 검색한 게시글 수
	@Override
	public int countSearchFree(HashMap<String, String> map) {
		return boardDao.countSearchFree(sqlSession, map);
	}
	
	// 자유게시판 검색 리스트 
	@Override
	public ArrayList<Board> selectSearchFree(HashMap<String, String> map, PageInfo infoPi) {
		int offset = (infoPi.getCurrentPage() - 1) * infoPi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, infoPi.getBoardLimit());
		return boardDao.selectSearchFree(sqlSession, map, rowBounds);
	}
	
	// 자유게시판 글 작성
	@Override
	@Transactional("transactionManager")
	public int insertFree(Board board, File file) {
		int result1 = boardDao.insertFree(sqlSession, board);
		int result2 = 1;
		if(file.getOriginalName() != null) {
		result2 = boardDao.insertFile(sqlSession, file);
		}
		return (result1 * result2);
	}
	
	// 자유게시글 삭제하기(UPDATE)
	@Override
	public int deleteBoardFree(int boardNo) {
			
		return boardDao.deleteFree(sqlSession, boardNo);
	}
	
	// 자유게시글 수정하기(UPDATE)
	@Override
	public int updateBoard(Board b) {
		
		return boardDao.updateBoard(sqlSession, b);
	}
	
	// (공통)댓글 목록 조회
	// (공통)댓글 작성(INSERT)

	
	
	
	
	
	

}
