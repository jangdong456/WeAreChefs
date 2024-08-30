package com.chef.app.board.qna;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.chef.app.comment.CommentDTO;
import com.chef.app.file.FileManager;
import com.chef.app.manager.InquiryDTO;
import com.chef.app.util.Pager;

@Service
public class QnaService {
	
	@Autowired
	private QnaDAO qnaDAO;
	
	@Autowired
	private FileManager fileManager;
	
	private Pager pager;
	
	public List<InquiryDTO> qnaList(Pager pager) throws Exception{
		Long perBlock = 5L;
		Long totalCount = qnaDAO.getRowNum(pager);
		if(totalCount == 0) {
			perBlock = 1L;
			totalCount = 1L;
		}
		pager.makeRow(5L);
		pager.makeNum(totalCount, 5L, perBlock);
		return qnaDAO.qnaList(pager);
	}
	
	public int hitUpdate(InquiryDTO inquiryDTO) throws Exception{
		return qnaDAO.hitUpdate(inquiryDTO);
	}
	
	public InquiryDTO qnaDetail(CommentDTO commentDTO) throws Exception{
		return qnaDAO.qnaDetail(commentDTO);
	}
	public int qnaUpdate(InquiryDTO inquiryDTO) throws Exception{
		return qnaDAO.qanUpdate(inquiryDTO);
	}
	
	public int qnaDelete(CommentDTO commentDTO) throws Exception{
		return qnaDAO.qnaDelete(commentDTO);
	}
	
	public int qnaAdd(InquiryDTO inquiryDTO) throws Exception{
		return qnaDAO.qnaAdd(inquiryDTO);
	}
	
	public String ckEditor(MultipartFile upload, HttpSession session) throws Exception{
		ServletContext servletContext = session.getServletContext();
		String path = servletContext.getRealPath("/resources/upload/boardContents");
		return fileManager.fileSave(path, upload);
		// 파일에 사진 저장까지 함.
		
	}
	
	public List<InquiryDTO> getQnaReply(CommentDTO commentDTO) throws Exception{
		return qnaDAO.getQnaReply(commentDTO);
	}
	
	public int addQnaReply(InquiryDTO inquiryDTO) throws Exception {
		return qnaDAO.addQnaReply(inquiryDTO);
	}
	
	public InquiryDTO getReplyUpdate(InquiryDTO inquiryDTO) throws Exception{
		return qnaDAO.getReplyUpdate(inquiryDTO);
	}
	
	public int replyUpdate(InquiryDTO inquiryDTO) throws Exception{
		return qnaDAO.replyUpdate(inquiryDTO);
	}
	
	public int replyDeleteUpdate(CommentDTO commentDTO) throws Exception{
		return qnaDAO.replyDeleteUpdate(commentDTO);
	}
}
