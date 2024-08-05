package com.chef.app.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chef.app.manager.NoticeDTO;

@Service
public class NoticeService {
	@Autowired
	private NoticeDAO notice_dao;

	public List<NoticeDTO> notice_list() throws Exception{
		return notice_dao.notice_list();
	}
	
}
