package com.chef.app.board.notice;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.chef.app.comment.CommentDTO;
import com.chef.app.file.FileManager;
import com.chef.app.manager.NoticeDTO;
import com.chef.app.util.Pager;

@Service
public class NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private FileManager fileManager;
	
	private Pager pager;

	public List<NoticeDTO> noticeList(Pager pager) throws Exception{
		Long perBlock = 5L;
		pager.makeRow(10L);
		Long totalCount = noticeDAO.getRowNum(pager);
		if(totalCount == 0) {
			perBlock = 1L;
		}
		pager.makeNum(totalCount, 10L, perBlock);
		return noticeDAO.noticeList(pager);
	}
	
	public NoticeDTO noticeDetail(CommentDTO commentDTO) throws Exception{
		return noticeDAO.noticeDetail(commentDTO);
	}
	
	public int noticeUpdate(NoticeDTO noticeDTO) throws Exception{
		return noticeDAO.noticeUpdate(noticeDTO);
	}
	
	public int noticeDelete(CommentDTO commentDTO)throws Exception{
		return noticeDAO.noticeDelete(commentDTO);
	}

	public int noticeAdd(NoticeDTO noticeDTO) throws Exception{
		return noticeDAO.noticeAdd(noticeDTO);
	}
	
	public String ckEditor(MultipartFile upload, HttpSession session) throws Exception{
		ServletContext servletContext = session.getServletContext();
		String path = servletContext.getRealPath("/resources/upload/boardContents");
		System.out.println("@@ path : " + path);
		return fileManager.fileSave(path, upload);
		// 파일에 사진 저장까지 함.
		
	}
	
}
