package com.kh.korea.game.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @ToString
public class Score {
	
	private int memberNo;
	private int levelNo;
	private Date testDate;
	private int score;
	private String memberNickname;
	private String email;
	private int nationNo;
	private String nationName;

}
