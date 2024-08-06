package com.chef.app.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chef.app.comment.CommentDTO;
import com.chef.app.manager.InquiryDTO;
import com.chef.app.util.Pager;

@Service
public class QnaService {
	
	@Autowired
	private QnaDAO qnaDAO;
	
	public List<InquiryDTO> qnaList(Pager pager) throws Exception{
		return qnaDAO.qnaList(pager);
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
}
