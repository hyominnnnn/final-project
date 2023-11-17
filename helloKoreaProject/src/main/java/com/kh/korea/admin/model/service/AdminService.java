package com.kh.korea.admin.model.service;

import java.util.ArrayList;

import com.kh.korea.board.model.vo.Board;
import com.kh.korea.common.model.vo.PageInfo;
import com.kh.korea.member.model.vo.Member;

public interface AdminService {
	
	//int selectMemberList();
	
	int selectListCount();
	
	ArrayList<Member> selectList(PageInfo pi);
	
	Member memberDetail(Member m);
	
	//------------------------------------------
	
	int selectBoardListCount();
	
	ArrayList<Board> selectBoardList(PageInfo pi);


}
