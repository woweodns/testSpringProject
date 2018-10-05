package com.example.ex.controller.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.ex.model.board.dto.BoardDTO;
import com.example.ex.service.board.BoardService;
import com.example.ex.service.board.Pager;

@Controller
@RequestMapping("board/*")
public class BoardController {
	
	@Inject
	BoardService boardService;
	
	@RequestMapping("list.do") 
	public ModelAndView list(
			@RequestParam(defaultValue="name") String search_option,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="1") int curPage) throws Exception{
		int count=boardService.countArticle(search_option,keyword);
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<BoardDTO> list
		=boardService.listAll(search_option,keyword,start,end); 
		ModelAndView mav=new ModelAndView();
		HashMap<String,Object> map=new HashMap<>();
		map.put("list", list); 
		map.put("count", count);
		map.put("pager", pager);
		map.put("search_option", search_option);
		map.put("keyword",keyword);
		mav.setViewName("board/list"); 
		mav.addObject("map", map); 
		return mav; 
	}
	
	
	@RequestMapping("write.do")
	public String write() {
		return "board/write";
	}
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute BoardDTO dto
			, HttpSession session)
					throws Exception {
		String writer=(String)session.getAttribute("userid");
		dto.setWriter(writer); 
		boardService.create(dto);
		return "redirect:/board/list.do";
	}
	
	@RequestMapping("view.do")
	public ModelAndView view(int bno, HttpSession session)
		throws Exception {
		boardService.increaseViewcnt(bno, session); 
		ModelAndView mav=new ModelAndView();
		mav.setViewName("board/view"); 
		mav.addObject("dto", boardService.read(bno)); 
		return mav; 
	} 
	
	@RequestMapping("getAttach/{bno}")
	@ResponseBody  
	public List<String> getAttach(@PathVariable int bno){
		return boardService.getAttach(bno); 
	}
	
	@RequestMapping("update.do")
	public String update(BoardDTO dto) throws Exception {
		System.out.println("dto:"+dto);
		if(dto != null) {
			boardService.update(dto);
		}
		return "redirect:/board/view.do?bno="+dto.getBno();
	}
	
	@RequestMapping("delete.do")
	public String delete(int bno) throws Exception {
		boardService.delete(bno); 
		return "redirect:/board/list.do"; 
	}

}
