package com.kh.korea.admin.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.korea.admin.model.dao.AdminDao;
import com.kh.korea.board.model.vo.Board;
import com.kh.korea.board.model.vo.Reply;
import com.kh.korea.common.model.vo.PageInfo;
import com.kh.korea.member.model.vo.Member;

@Service
public class AdminServiceImpl implements  AdminService{

	@Autowired
	private AdminDao adminDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public int selectListCount() {
		return adminDao.selectListCount(sqlSession);

	}
	
	@Override
	public ArrayList<Member> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return adminDao.selectList(sqlSession, rowBounds);
	}

	@Override
	public Member memberDetail(Member m) {
		return adminDao.memberDetail(sqlSession, m);
	}
	

	@Override
	public int memberTargetEmail(String targetEmail) {
		return adminDao.memberTargetEmail(sqlSession, targetEmail);
	}

	
	@Override
	public int memberDelete(String email) {
		return adminDao.memberDelete(sqlSession, email);
	}
	
	//----------------------------------------------
	// 정보게시글-------------------------------------
	
	@Override
	public int selectBoardListCount() {
		return adminDao.selectBoardListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return adminDao.selectBoardList(sqlSession, rowBounds);
	}

	@Override
	public Board boardPosting(Board b) {
		return adminDao.boardPosting(sqlSession, b);
	}
	//삭제
	@Override
	public int deleteBoardFree(int boardNo) {
		return adminDao.deleteBoardFree(sqlSession, boardNo);
	}
	
	// 자유게시글
	@Override
	public int selectFreeBoardListCount() {
		return adminDao.selectFreeBoardListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Board> selectFreeBoardList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return adminDao.selectFreeBoardList(sqlSession, rowBounds);
	}
	
	@Override
	public Board freeBoardPosting(Board b) {
		return adminDao.freeBoardPosting(sqlSession, b);
	}
	
	// 개인게시글------------------------------------
	@Override
	public int selectPerPostingListCount() {
		return adminDao.selectPerPostingListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectPerPostingList(int bPage) {
		
		return adminDao.selectPerPostingList(sqlSession, bPage);
	}
	
	
	// 댓글----------------------------------------
	
	@Override
	public int selectReplyCount() {
		return adminDao.selectReplyCount(sqlSession);
	}

	@Override
	public ArrayList<Reply> selectReplyList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return adminDao.selectReplyList(sqlSession, rowBounds);
	}







	

}
