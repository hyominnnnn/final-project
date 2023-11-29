package com.kh.korea.reservation.model.service;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.korea.reservation.model.vo.Reservation;

public interface ReservService {

	// 날짜로 시간 조회
	ArrayList<Reservation> selectTime(Date reDate); // sql에서 조회해온 결과값을 뭘 넣어서() 조회할건지, 이름지은거:selectTime 
}
