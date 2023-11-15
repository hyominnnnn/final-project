package com.kh.korea.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @ToString
public class File {
	
	private int fileNo;
	private String originalName;
	private String uploadName;
	private String filePath;

}
