package com.example.ex.model.message.dao;

import com.example.ex.model.message.dto.MessageDTO;

public interface MessageDAO {
	public void create(MessageDTO dto);
	public MessageDTO readMessage(int mid);
	public void updateState(int mid);
}
