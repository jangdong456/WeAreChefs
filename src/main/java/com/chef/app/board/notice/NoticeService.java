package com.chef.app.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chef.app.comment.CommentDTO;
import com.chef.app.manager.NoticeDTO;

@Service
public class NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;

	public List<NoticeDTO> noticeList() throws Exception{
		return noticeDAO.noticeList();
	}
	
	public NoticeDTO noticeDetail(CommentDTO commentDTO) throws Exception{
		return noticeDAO.noticeDetail(commentDTO);
	}

	public int noticeAdd(NoticeDTO noticeDTO) throws Exception{
		return noticeDAO.noticeAdd(noticeDTO);
	}
	
}
