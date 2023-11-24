package com.kh.korea.game.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.korea.game.model.vo.Answer;
import com.kh.korea.game.model.vo.LowerGame;

@Repository
public class GameDao {

	public LowerGame firstQuiz(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("gameMapper.firstQuiz");
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

	

}
