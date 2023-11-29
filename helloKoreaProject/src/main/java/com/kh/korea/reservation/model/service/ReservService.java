package com.kh.korea.reservation.model.service;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.korea.reservation.model.vo.Reservation;

public interface ReservService {

	// 날짜로 시간 조회
	ArrayList<Reservation> selectTime(Date reDate);
}
