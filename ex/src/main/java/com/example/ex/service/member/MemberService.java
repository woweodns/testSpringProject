package com.example.ex.service.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.example.ex.model.member.dto.MemberDTO;

public interface MemberService {
	
	public boolean loginCheck(
			MemberDTO dto, HttpSession session);
	public void logout(HttpSession session);
	public MemberDTO viewMember(String userid);

	public void join(MemberDTO dto);
}
