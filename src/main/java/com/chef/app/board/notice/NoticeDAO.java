package com.chef.app.board.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chef.app.manager.NoticeDTO;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSession sql_session;
	
	private final String NAMESPACE = "com.chef.app.board.notice.NoticeDAO.";
	
	public List<NoticeDTO> notice_list() throws Exception {
		return sql_session.selectList(NAMESPACE + "notice_list");
	}
}
