package com.example.ex.service.message;

import com.example.ex.model.message.dto.MessageDTO;

public interface MessageService {
	public void addMessage(MessageDTO dto);
	public MessageDTO readMessage(String userid, int mid);
}
