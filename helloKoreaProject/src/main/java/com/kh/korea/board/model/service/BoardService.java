package com.kh.korea.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.korea.board.model.vo.Board;
import com.kh.korea.board.model.vo.File;
import com.kh.korea.common.model.vo.PageInfo;

public interface BoardService {
	
	// 자유게시판 글 총 개수
	
	
	// 정보게시판 글 총 개수
	int countInfoList();
		
	// 자유게시판 리스트 조회
	
	
	// 정보게시판 리스트 조회
	ArrayList<Board> selectInfoList(PageInfo infoPi);
	
	// 자유게시글 작성하기(INSERT)
	
	// 정보게시글 작성하기(INSERT)
	int insertInfo(Board board, File file);
	
	// 게시글 조회수 증가(UPDATE)
	int increaseCount(int boardNo);
	
	// 게시글 상세조회(SELECT)
	Board selectBoard(int boardNo);
	
	// 게시글 수정하기(UPDATE)
	
	// 게시글 삭제하기(UPDATE)
	
	// 댓글 목록 조회
	//ArrayList
	
	// 댓글 작성(INSERT)
	
	// 자유게시판 검색한 게시글 수
	
	
	// 자유게시판 검색 리스트
	
	
	// 정보게시판 검색한 게시글 수
	int countSearchInfo(HashMap<String, String> map);
	
	// 정보게시판 검색 리스트
	ArrayList<Board> selectSearchInfo(HashMap<String, String> map, PageInfo infoPi);
	


}
