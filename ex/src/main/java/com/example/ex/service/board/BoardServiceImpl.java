package com.example.ex.service.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.ex.model.board.dao.BoardDAO;
import com.example.ex.model.board.dto.BoardDTO;

@Service 
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO boardDao;

	@Override
	public void deleteFile(String fullName) {
		boardDao.deleteFile(fullName);//F4
	}

	@Override
	public List<String> getAttach(int bno) {
		return boardDao.getAttach(bno);
	}

	@Transactional
	@Override
	public void create(BoardDTO dto) throws Exception {
		boardDao.create(dto); 
		String[] files=dto.getFiles(); 
		if(files==null) return;  
		for(String name : files) {
			boardDao.addAttach(name);
		}
	}

	@Override
	public BoardDTO read(int bno) throws Exception {
		return boardDao.read(bno);
	}

	@Transactional 
	@Override
	public void update(BoardDTO dto) throws Exception {
		boardDao.update(dto); 
		String[] files=dto.getFiles();
		if(files==null) return;
		for(String name : files) {
			System.out.println("첨부파일 이름:"+name);
			boardDao.updateAttach(name, dto.getBno());//F4
		}
	}


	@Transactional
	@Override
	public void delete(int bno) throws Exception {
		boardDao.delete(bno); 
	}

	@Override
	public List<BoardDTO> listAll(String search_option, String keyword, int start, int end) throws Exception {
		return boardDao.listAll(search_option,keyword,start,end);
	}

	@Override
	public void increaseViewcnt(int bno, HttpSession session)
			throws Exception {
		long update_time=0;
		if(session.getAttribute("update_time_"+bno)!=null) {
			update_time=
					(long)session.getAttribute("update_time_"+bno);
		}
		long current_time=System.currentTimeMillis();
		if(current_time - update_time > 5*1000) {
			boardDao.increateViewcnt(bno);
			session.setAttribute("update_time_"+bno, current_time);

		}
	}

	@Override
	public int countArticle(String search_option, String keyword) throws Exception {
		return boardDao.countArticle(search_option,keyword);//F4
	}

}
