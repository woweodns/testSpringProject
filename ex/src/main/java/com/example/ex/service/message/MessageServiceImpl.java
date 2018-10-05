package com.example.ex.service.message;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.ex.model.message.dao.MessageDAO;
import com.example.ex.model.message.dao.PointDAO;
import com.example.ex.model.message.dto.MessageDTO;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Inject
	MessageDAO messageDao;
	@Inject
	PointDAO pointDao;
	
	@Transactional
	@Override
	public void addMessage(MessageDTO dto) {
		messageDao.create(dto);
		pointDao.updatePoint(dto.getSender(), 10);
	}

	@Override
	public MessageDTO readMessage(String userid, int mid) {
		// TODO Auto-generated method stub
		return null;
	}

}
