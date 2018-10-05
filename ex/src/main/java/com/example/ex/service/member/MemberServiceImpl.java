package com.example.ex.service.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.ex.model.member.dao.MemberDAO;
import com.example.ex.model.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	MemberDAO memberDao;

	@Override
	public boolean loginCheck(
			MemberDTO dto, HttpSession session) {
		boolean result=memberDao.loginCheck(dto);
		if(result) { 
			MemberDTO dto2=viewMember(dto.getUserid());
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("name", dto2.getName());
			System.out.println(session.getAttribute("userid"));
			System.out.println(session.getAttribute("name"));
		} 
		return result;
	}

	@Override
	public void join(MemberDTO dto) {
		memberDao.join(dto);
	}
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public MemberDTO viewMember(String userid) {
		return memberDao.viewMember(userid);
	}

}
