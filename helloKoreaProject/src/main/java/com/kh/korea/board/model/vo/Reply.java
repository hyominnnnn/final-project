package com.kh.korea.board.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @ToString
public class Reply {
	
	private int replyNo;
	private String replyContent;
	private Date createDate;
	private int boardNo;
	private String replyMember;
	
}
