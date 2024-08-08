package com.chef.app.board.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chef.app.comment.CommentDTO;
import com.chef.app.manager.NoticeDTO;
import com.chef.app.util.Pager;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.chef.app.board.notice.NoticeDAO.";

	public List<NoticeDTO> noticeList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "noticeList", pager);
	}
	
	public NoticeDTO noticeDetail(CommentDTO commentDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "noticeDetail", commentDTO);
	}
	
	public int noticeUpdate(NoticeDTO noticeDTO) throws Exception{
		return sqlSession.update(NAMESPACE + "noticeUpdate", noticeDTO);
	}
	
	public int noticeDelete(CommentDTO commentDTO) throws Exception{
		return sqlSession.delete(NAMESPACE + "noticeDelete", commentDTO);
	}
	
	public int noticeAdd(NoticeDTO noticeDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "noticeAdd", noticeDTO);
	}
	
	public Long getRowNum(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getRowNum", pager);
	}
}
