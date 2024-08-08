package com.chef.app.board.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chef.app.comment.CommentDTO;
import com.chef.app.manager.InquiryDTO;
import com.chef.app.util.Pager;

@Repository
public class QnaDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.chef.app.board.qna.QnaDAO.";
	
	public List<InquiryDTO> qnaList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE + "qnaList", pager);
	}
	
	public InquiryDTO qnaDetail(CommentDTO commentDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "qnaDetail", commentDTO);
	}
	
	public int qanUpdate(InquiryDTO inquiryDTO) throws Exception{
		return sqlSession.update(NAMESPACE + "qnaUpdate", inquiryDTO);
	}
	
	public int qnaDelete(CommentDTO commentDTO) throws Exception{
		return sqlSession.delete(NAMESPACE + "qnaDelete", commentDTO);
	}
	
	public int qnaAdd(InquiryDTO inquiryDTO) throws Exception{
		return sqlSession.insert(NAMESPACE + "qnaAdd", inquiryDTO);
	}
	
	public Long getRowNum(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getRowNum", pager);
	}
	
	public int addQnaReply(InquiryDTO inquiryDTO) throws Exception{
		return sqlSession.insert(NAMESPACE + "addQnaReply", inquiryDTO);
	}
	
	public List<InquiryDTO> getQnaReply(CommentDTO commentDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE + "getQnaReply", commentDTO);
	}
}

