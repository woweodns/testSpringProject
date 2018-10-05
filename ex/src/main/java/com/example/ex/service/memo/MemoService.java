package com.example.ex.service.memo;

import java.util.List;

import com.example.ex.model.memo.dto.MemoDTO;

public interface MemoService {
	
	public List<MemoDTO> list();
	public void insert(MemoDTO dto);
	public MemoDTO memo_view(int idx);
	public void update(MemoDTO dto);
	public void delete(int idx);

}
