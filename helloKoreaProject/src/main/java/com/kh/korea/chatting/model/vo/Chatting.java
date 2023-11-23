package com.kh.korea.chatting.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
@AllArgsConstructor
@Builder
public class Chatting {
	private int chatNo;
	private String chatTitle;
	private String memberNo;
	private Date chatEnrollDate;
	private String status;
	
}
