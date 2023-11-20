package com.kh.korea.board.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.korea.board.model.service.BoardService;
import com.kh.korea.board.model.vo.Board;
import com.kh.korea.board.model.vo.File;
import com.kh.korea.common.model.vo.PageInfo;
import com.kh.korea.common.template.Pagination;
import com.kh.korea.common.template.SaveFile;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	// 정보게시판 리스트 조회
	@GetMapping("list.ibo")
	public String infoList(@RequestParam(value="iPage", defaultValue="1") int currentPage, Model model) {
		
		PageInfo infoPi = Pagination.getPageInfo(boardService.countInfoList(), currentPage, 10, 5);
		
		model.addAttribute("infoList", boardService.selectInfoList(infoPi));
		model.addAttribute("infoPi", infoPi);
		
		return "board/infoBoardListView";
	}
	// 정보게시글 작성하기(INSERT)
	@PostMapping("insert.ibo")
	public String insertInfo(Board board, MultipartFile upfile, HttpSession session, Model model) {
			
		File file = new File();
			
		System.out.println(board);
		System.out.println(upfile);
			
		if(!upfile.getOriginalFilename().equals("")) {
			 file.setOriginalName(upfile.getOriginalFilename());
			 file.setUploadName(SaveFile.saveFile(upfile, session));
		}
		
		if(boardService.insertInfo(board, file) > 0) { // 성공 => 게시글 목록을 보여주기!
			session.setAttribute("alertMsg", "게시글 작성 성공~");
			return "redirect:list.ibo";
		} else {
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorPage";
		}
			
	}
	// 정보게시판 글 작성 폼
	@GetMapping("enrollForm.ibo")
	public String infoEnrollForm() {
		return "board/infoBoardEnrollForm";
	}
	// 정보게시판 검색 리스트
	@GetMapping("search.ibo")
	public String searchInfo(@RequestParam(value="iPage", defaultValue="1") int currentPage,
							 Model model, String condition, String keyword) {
		
		HashMap<String, String> map = new HashMap();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		PageInfo infoPi = Pagination.getPageInfo(boardService.countSearchInfo(map), currentPage, 10, 5);
		
		model.addAttribute("infoList", boardService.selectSearchInfo(map, infoPi));
		model.addAttribute("infoPi", infoPi);
		model.addAttribute("keyword", keyword);
		model.addAttribute("condition", condition);
		
		return "board/infoBoardListView";
	}
	
	
	// 자유게시판 리스트 조회
	@GetMapping("list.fbo")
	public String freeList(@RequestParam(value="fPage", defaultValue="1") int currentPage, Model model) {
			
		PageInfo infoPi = Pagination.getPageInfo(boardService.countFreeList(), currentPage, 10, 5);
			
		model.addAttribute("freeList", boardService.selectInfoList(infoPi));
		model.addAttribute("infoPi", infoPi);
			
		return "board/freeBoardListView";
	}
	
	// 자유게시글 작성하기(INSERT)
	@PostMapping("insert.fbo")
	public String insertFree(Board board, MultipartFile upfile, HttpSession session, Model model) {
			
		File file = new File();
			
		System.out.println(board);
		System.out.println(upfile);
			
		if(!upfile.getOriginalFilename().equals("")) {
			 file.setOriginalName(upfile.getOriginalFilename());
			 file.setUploadName(SaveFile.saveFile(upfile, session));
		}
		
		if(boardService.insertFree(board, file) > 0) { // 성공 => 게시글 목록을 보여주기
			session.setAttribute("alertMsg", "게시글 작성 성공~");
			return "redirect:list.fbo";
		} else {
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorPage";
		}
			
	}
	// 자유게시판 글 작성폼
	@GetMapping("enrollForm.fbo")
	public String freeEnrollForm() {
		return "board/freeBoardEnrollForm";
	}
	
	// 자유게시판 검색 리스트
	@GetMapping("search.fbo")
	public String searchFree(@RequestParam(value="fPage", defaultValue="1") int currentPage,
							Model model, String condition, String keyword) {
				
		HashMap<String, String> map = new HashMap();
		map.put("condition", condition);
		map.put("keyword", keyword);
					
		PageInfo infoPi = Pagination.getPageInfo(boardService.countSearchFree(map), currentPage, 10, 5);
					
		model.addAttribute("freeList", boardService.selectSearchFree(map, infoPi));
		model.addAttribute("infoPi", infoPi);
		model.addAttribute("keyword", keyword);
		model.addAttribute("condition", condition);
					
		return "board/freeBoardListView";
	}
	
		
	// (공통)게시글 조회수 증가(UPDATE)
	
	// (공통)정보게시판 글 상세
	@GetMapping("detail.bo")
	public ModelAndView infoDetailView(int ino, ModelAndView mv) {
			
		if(boardService.increaseCount(ino) > 0) {
			mv.addObject("info", boardService.selectBoard(ino))
				 .setViewName("board/infoBoardDetailView");
		} else {
			mv.addObject("errorMsg", "상세정보 조회 실패").setViewName("common/errorPage");
		}
		return mv;

	}
		// (공통)게시글 수정하기(UPDATE)
		// (공통)게시글 삭제하기(UPDATE)
		// (공통)댓글 목록 조회
		// (공통)댓글 작성(INSERT)
	
	
	
	
}
