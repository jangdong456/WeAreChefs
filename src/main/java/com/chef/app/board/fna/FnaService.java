package com.chef.app.board.fna;

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
public class FnaService {

	@Autowired
	private FnaDAO fnaDAO;
	
	@Autowired
	private FileManager fileManager;
	
	public List<InquiryDTO> fnaList(Pager pager) throws Exception{
		Long perBlock = 5L;
		Long totalCount = fnaDAO.getRowNum(pager);
		if(totalCount == 0) {
			perBlock = 1L;
			totalCount = 1L;
		}
		pager.makeRow(5L);
		pager.makeNum(totalCount, 5L, perBlock);
		return fnaDAO.fnaList(pager);
	}
	
	public int hitUpdate(InquiryDTO inquiryDTO) throws Exception{
		return fnaDAO.hitUpdate(inquiryDTO);
	}
	
	public InquiryDTO fnaDetail(CommentDTO commentDTO) throws Exception{
		return fnaDAO.fnaDetail(commentDTO);
	}
	
	public int fnaUpdate(InquiryDTO inquiryDTO) throws Exception{
		return fnaDAO.fanUpdate(inquiryDTO);
	}
	
	public int fnaDelete(CommentDTO commentDTO) throws Exception{
		return fnaDAO.fnaDelete(commentDTO);
	}
	
	public int fnaAdd(InquiryDTO inquiryDTO) throws Exception{
		return fnaDAO.fnaAdd(inquiryDTO);
	}
	
	public String ckEditor(MultipartFile upload, HttpSession session) throws Exception{
		ServletContext servletContext = session.getServletContext();
		String path = servletContext.getRealPath("/resources/upload/boardContents");
		System.out.println("@@ path : " + path);
		return fileManager.fileSave(path, upload);
		// 파일에 사진 저장까지 함.
		
	}
}
