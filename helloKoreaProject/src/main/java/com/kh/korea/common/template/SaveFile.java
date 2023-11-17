package com.kh.korea.common.template;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class SaveFile {

	public static String saveFile(MultipartFile upfile, HttpSession session) {
			
		// 파일명 수정 작업 후 서버에 업로드("bono.jpg" => 2023110338292235923.jpg)
		String originalName = upfile.getOriginalFilename();
		
		// "20231103102244"(년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 23432(5자리 랜덤값)
		int ranNum = (int)(Math.random() * 90000) + 10000;
		
		// 확장자
		String ext = originalName.substring(originalName.lastIndexOf("."));
		
		String uploadName = currentTime + ranNum + ext;
		
		String filePath = session.getServletContext().getRealPath("/resources/boardFiles/");
		
		try {
			upfile.transferTo(new File(filePath + uploadName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return "resources/boardFiles/" + uploadName;
	}
		
}
