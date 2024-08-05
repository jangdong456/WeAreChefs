package com.chef.app.board.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chef.app.comment.CommentDTO;
import com.chef.app.manager.NoticeDTO;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.chef.app.board.notice.NoticeDAO.";
	
	public List<NoticeDTO> noticeList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "noticeList");
	}
	
	public NoticeDTO noticeDetail(CommentDTO commentDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "noticeDetail", commentDTO);
	}
	
	public int noticeAdd(NoticeDTO noticeDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "noticeAdd", noticeDTO);
	}
}
