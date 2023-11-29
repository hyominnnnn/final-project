package com.kh.korea.reservation.model.dao;

import java.sql.Date;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.korea.reservation.model.vo.Reservation;

@Repository
public class ReservDao {

	public ArrayList<Reservation> selectTime(SqlSessionTemplate sqlSession, Date reDate) {
		return (ArrayList)sqlSession.selectList("reservMapper.selectTime", reDate); //mapper namespace.인터페이스에서 지은 이름, 화면에서 조회한 값
		// (다녀온걸 어디에 담겠다)
	}

}
