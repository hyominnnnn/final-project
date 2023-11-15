package com.kh.korea.board.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @ToString
public class Scrap {
	
	private int boardNo;
	private int memberNo;
	private Date scrapDate;

}
