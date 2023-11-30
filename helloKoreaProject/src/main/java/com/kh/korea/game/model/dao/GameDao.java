package com.kh.korea.game.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.korea.game.model.vo.Answer;
import com.kh.korea.game.model.vo.LowerGame;
import com.kh.korea.game.model.vo.MiddleGame;
import com.kh.korea.game.model.vo.Score;
import com.kh.korea.game.model.vo.UpperGame;
import com.kh.korea.game.model.vo.UserBadge;

@Repository
public class GameDao {
	
	// ----- 초급 -----

	public LowerGame lowQuiz(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("gameMapper.lowQuiz");
	}
	
	public int lastNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("gameMapper.lastNo");
	}
	
	public LowerGame nextQuiz(SqlSessionTemplate sqlSession, int quizNo) {
		return sqlSession.selectOne("gameMapper.nextQuiz", quizNo);
	}
	
	public LowerGame prevQuiz(SqlSessionTemplate sqlSession, int quizNo) {
		return sqlSession.selectOne("gameMapper.prevQuiz", quizNo);
	}
	
	public int checkAnswer(SqlSessionTemplate sqlSession, ArrayList<Answer> list) {
		return sqlSession.selectOne("gameMapper.checkAnswer", list);
	}
	
	// ----- 중급 -----
	
	public MiddleGame middleQuiz(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("gameMapper.middleQuiz");
	}
	
	public int lastMiddleNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("gameMapper.lastMiddleNo");
	}
	
	public MiddleGame nextMiddleQuiz(SqlSessionTemplate sqlSession, int quizNo) {
		return sqlSession.selectOne("gameMapper.nextMiddleQuiz", quizNo);
	}
	
	public MiddleGame prevMiddleQuiz(SqlSessionTemplate sqlSession, int quizNo) {
		return sqlSession.selectOne("gameMapper.prevMiddleQuiz", quizNo);
	}
	
	public int checkMiddleAnswer(SqlSessionTemplate sqlSession, ArrayList<Answer> list) {
		return sqlSession.selectOne("gameMapper.checkMiddleAnswer", list);
	}
	
	// ----- 고급 -----
	
	public UpperGame upperQuiz(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("gameMapper.upperQuiz");
	}
	
	public int lastUpperNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("gameMapper.lastUpperNo");
	}

	public UpperGame nextUpperQuiz(SqlSessionTemplate sqlSession, int quizNo) {
		return sqlSession.selectOne("gameMapper.nextUpperQuiz", quizNo);
	}

	public UpperGame prevUpperQuiz(SqlSessionTemplate sqlSession, int quizNo) {
		return sqlSession.selectOne("gameMapper.prevUpperQuiz", quizNo);
	}

	public int checkUpperAnswer(SqlSessionTemplate sqlSession, ArrayList<Answer> list) {
		return sqlSession.selectOne("gameMapper.checkUpperAnswer", list);
	}

	// 난이도별 점수 insert
	public int insertScore(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.insert("gameMapper.insertScore", map);
	}

	// 난이도별 점수 select
	public ArrayList<Score> selectScore(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("gameMapper.selectScore", memberNo);
	}

	// 난이도별 뱃지 insert
	public int insertBadge(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.insert("gameMapper.insertBadge", map);
	}

	// 뱃지 select
	public ArrayList<UserBadge> selectBadge(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("gameMapper.selectBadge", memberNo);
	}

	

}
