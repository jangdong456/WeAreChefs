package com.chef.app.board.fna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chef.app.comment.CommentDTO;
import com.chef.app.manager.InquiryDTO;
import com.chef.app.util.Pager;

@Service
public class FnaService {

	@Autowired
	private FnaDAO fnaDAO;
	
	public List<InquiryDTO> fnaList(Pager pager) throws Exception{
		Long perBlock = 5L;
		pager.makeRow(10L);
		Long totalCount = fnaDAO.getRowNum(pager);
		if(totalCount == 0) {
			perBlock = 1L;
		}
		pager.makeNum(totalCount, 10L, perBlock);
		return fnaDAO.fnaList(pager);
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
}
