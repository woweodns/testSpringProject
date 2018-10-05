package com.example.ex.controller.member;

import javax.activation.CommandMap;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.ex.model.member.dao.MemberDAO;
import com.example.ex.model.member.dto.MemberDTO;
import com.example.ex.service.member.MemberService;

@Controller 
@RequestMapping("member/*") 
public class MemberController {
	private static final Logger logger=
			LoggerFactory.getLogger(MemberController.class);
	@Inject
	MemberService memberService;
	
	@RequestMapping("login.do") 
	public String login() {
		return "member/login"; 
	}
	
	@RequestMapping("join.do") 
	public String join() {
		return "member/join";
	}
	
	@RequestMapping("login_check.do")
	public ModelAndView login_check(
			MemberDTO dto, HttpSession session) {
		System.out.println("ID"+dto.getUserid());
		boolean result=memberService.loginCheck(dto, session);
		ModelAndView mav=new ModelAndView();
		if(result) {
			mav.setViewName("member/member"); 
		}else {
			mav.setViewName("member/login");
			mav.addObject("message", "error");
		}
		return mav;
	}
	
	@RequestMapping("join_1.do")
	public String join(
			MemberDTO dto) {
		memberService.join(dto);
		return "redirect:/member/login.do";
	}
	
	@RequestMapping("logout.do")
	public ModelAndView logout(
			HttpSession session, ModelAndView mav) {
		memberService.logout(session);
		mav.setViewName("member/login");
		mav.addObject("message", "logout");
		return mav;
	}
	
	
}
