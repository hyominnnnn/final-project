package com.kh.korea.admin.model.service;

import java.util.ArrayList;

import com.kh.korea.common.model.vo.PageInfo;
import com.kh.korea.member.model.vo.Member;

public interface AdminService {
	
	int selectMemberList();
	
	ArrayList<Member> selectList(PageInfo pi);

}
