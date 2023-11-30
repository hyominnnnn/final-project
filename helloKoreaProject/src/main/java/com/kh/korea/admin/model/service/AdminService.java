package com.kh.korea.admin.model.service;

import java.util.ArrayList;

import com.kh.korea.board.model.vo.Board;
import com.kh.korea.board.model.vo.Reply;
import com.kh.korea.common.model.vo.PageInfo;
import com.kh.korea.game.model.vo.Score;
import com.kh.korea.member.model.vo.Member;

public interface AdminService {
	
	// 회원 정보 조회
	int selectListCount();
	
	ArrayList<Member> selectList(PageInfo pi);
	
	// 회원 정보 상세 조회
	Member memberDetail(Member m);
	
	// 회원 탈퇴시키기
	int memberTargetEmail(String targetEmail);
	int memberDelete(String email);
	
	//------------------------------------------
	// 정보게시글-------------------------------------
	
	int selectBoardListCount();
	
	ArrayList<Board> selectBoardList(PageInfo pi);
	
	Board boardPosting (Board b);
	
	// 정보게시글 삭제
	int deleteBoardFree (int boardNo);
	// 자유게시글--------------------------------------------
	int selectFreeBoardListCount();
	
	ArrayList<Board> selectFreeBoardList(PageInfo pi);
	
	Board freeBoardPosting (Board b);
	// 개인 게시글-------------------------------
	int selectPerPostingListCount();
	
	ArrayList<Board> selectPerPostingList(int bPage);
	
	// 댓글----------------------------------------
	int selectReplyCount();
	
	ArrayList<Reply> selectReplyList(PageInfo pi);

	ArrayList<Score> selectTopScoreList();
	


}
