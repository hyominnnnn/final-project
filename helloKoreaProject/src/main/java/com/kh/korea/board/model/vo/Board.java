package com.kh.korea.board.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @ToString
public class Board {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private Date modifyDate;
	private int count;
	private int memberNo; // 작성자 알기 위한 회원번호
	private int categoryNo;
	private int fileNo;
	private String status;
	private String boardWriter; // 작성자 닉네임 보여줄 컬럼
	private String originalName; // 파일 원본명 보여줄 컬럼
	private String uploadName; // 수정된 파일명
	
}
