package com.chef.app.board.fna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chef.app.comment.CommentDTO;
import com.chef.app.manager.InquiryDTO;
import com.chef.app.util.Pager;

@Repository
public class FnaDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.chef.app.board.fna.FnaDAO.";
	
	public List<InquiryDTO> fnaList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE + "fnaList", pager);
	}
	
	public int hitUpdate(InquiryDTO inquiryDTO) throws Exception{
		return sqlSession.update(NAMESPACE + "hitUpdate", inquiryDTO);
	}

	public Long getRowNum(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getRowNum", pager);
	}
	
	public InquiryDTO fnaDetail(CommentDTO commentDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "fnaDetail", commentDTO);
	}
	
	public int fanUpdate(InquiryDTO inquiryDTO) throws Exception{
		return sqlSession.update(NAMESPACE + "fnaUpdate", inquiryDTO);
	}
	
	public int fnaDelete(CommentDTO commentDTO) throws Exception{
		return sqlSession.delete(NAMESPACE + "fnaDelete", commentDTO);
	}
	
	public int fnaAdd(InquiryDTO inquiryDTO) throws Exception{
		return sqlSession.insert(NAMESPACE + "fnaAdd", inquiryDTO);
	}
}
