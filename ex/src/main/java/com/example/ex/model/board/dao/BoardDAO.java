package com.example.ex.model.board.dao;

import java.util.List;

import com.example.ex.model.board.dto.BoardDTO;

public interface BoardDAO {
	public void deleteFile(String fullName); 
	public List<String> getAttach(int bno); 
	public void addAttach(String fullName);
	public void updateAttach(String fullName, int bno);
	public void create(BoardDTO dto) throws Exception; 
	public void update(BoardDTO dto) throws Exception; 
	public void delete(int bno) throws Exception; 
	public List<BoardDTO> listAll(String search_option, String keyword, int start, int end) throws Exception;
	public void increateViewcnt(int bno) throws Exception;
	public int countArticle(String search_option, String keyword) throws Exception;
	public BoardDTO read(int bno) throws Exception;	
	

}
