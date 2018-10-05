package com.example.ex.model.member.dao;

import com.example.ex.model.member.dto.MemberDTO;

public interface MemberDAO {
	public boolean loginCheck(MemberDTO dto);
	public MemberDTO viewMember(String userid);

	public void join(MemberDTO dto);
	
}
