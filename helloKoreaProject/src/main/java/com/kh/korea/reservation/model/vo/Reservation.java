package com.kh.korea.reservation.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @ToString
public class Reservation {
	
	private int reNo; //RE_NO
	private int proNo; //PRO_NO
	private Date reDate; //RE_DATE
	private int personnel; //PERSONNEL
	private String status; //STATUS
	private int memberNo; //MEMBER_NO
	private String payment;
	private String reTime;
	private int price;

}
