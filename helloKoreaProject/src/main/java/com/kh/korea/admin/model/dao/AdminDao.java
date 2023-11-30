package com.kh.korea.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.korea.board.model.vo.Board;
import com.kh.korea.board.model.vo.Reply;
import com.kh.korea.game.model.vo.Score;
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
	
	public int memberDelete(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.update("adminMapper.memberDelete", email);
	}
	// 정보게시판--------------------------------------------------------------------

	public int selectBoardListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectBoardListCount");
	}

	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectBoardList", null, rowBounds);
	}

	public Board boardPosting(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.selectOne("adminMapper.boardPosting", b);
	}
	//삭제
	public int deleteBoardFree(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("adminMapper.deleteBoardFree", boardNo);
	}
	// 자유게시판-----------
	public int selectFreeBoardListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectFreeBoardListCount");
	}
	
	public ArrayList<Board> selectFreeBoardList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectFreeBoardList", null, rowBounds);
	}
	
	public Board freeBoardPosting(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.selectOne("adminMapper.freeBoardPosting", b);
	}
	// 댓글----------
	public int selectReplyCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectReplyCount");
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectReplyList", null, rowBounds);
	}

	public int memberTargetEmail(SqlSessionTemplate sqlSession, String targetEmail) {
		return sqlSession.selectOne("adminMapper.memberTargetEmail", targetEmail);
	}
	// 개인-----------------
	public int selectPerPostingListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectPerPostingListCount");
	}

	public ArrayList<Board> selectPerPostingList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectPerPostingList", memberNo);
	}

	public ArrayList<Score> selectTopScoreList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectTopScoreList");
	}

	





}
