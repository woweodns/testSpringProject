package com.example.ex.service.board;

import java.util.List;

import com.example.ex.model.board.dto.ReplyDTO;

public interface ReplyService {
	
	public List<ReplyDTO> list(int bno);
	public int count(int bno);
	public void create(ReplyDTO dto);

}
