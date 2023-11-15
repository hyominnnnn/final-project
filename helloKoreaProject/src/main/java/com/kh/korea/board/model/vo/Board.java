package com.kh.korea.board.model.vo;

import java.sql.Date;

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
	private String boardWriter; // 나중에 글쓴이 보여주려면 필요할 거 같아서 일단 세팅

}
