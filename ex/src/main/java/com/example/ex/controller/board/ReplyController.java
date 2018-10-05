package com.example.ex.controller.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.ex.model.board.dto.ReplyDTO;
import com.example.ex.service.board.ReplyService;

@RestController 
@RequestMapping("reply/*") 
public class ReplyController {
	@Inject
	ReplyService replyService;
	
	@RequestMapping("insert.do") 
	public void insert(ReplyDTO dto, HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		dto.setReplyer(userid);
		replyService.create(dto);
	}
	
	@RequestMapping("list.do")
	public ModelAndView list(int bno, ModelAndView mav) {
		List<ReplyDTO> list=replyService.list(bno);
		mav.setViewName("board/reply_list"); 
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("list_json.do")
	public List<ReplyDTO> list_json(int bno){
		return replyService.list(bno);
	}	

}
