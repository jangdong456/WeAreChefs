package com.sse.app.qna;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sse.app.DefaultTest;
import com.sse.app.boards.BoardDTO;
import com.sse.app.boards.qnas.QnaDAO;
import com.sse.app.util.Pager;

public class QnADAOTest extends DefaultTest {

	@Autowired
	private QnaDAO qnaDAO;

	@Test
	public void test() throws Exception {
		Pager pager = new Pager();
		pager.makeRow();
		List<BoardDTO> ar = qnaDAO.getList(pager);

		System.out.println(ar.get(0).getBoardTitle());
		System.out.println(ar.get(0).getBoardNum());

	}

}
