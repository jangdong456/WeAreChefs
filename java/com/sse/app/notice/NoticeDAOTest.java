package com.sse.app.notice;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sse.app.DefaultTest;
import com.sse.app.boards.notices.NoticeDAO;
import com.sse.app.boards.notices.NoticeDTO;

public class NoticeDAOTest extends DefaultTest {

	@Autowired
	private NoticeDAO noticeDAO;

//	@Test
	public void addTest() throws Exception {

		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setBoardWriter("ksr3234");
		noticeDTO.setBoardTitle("야호");
		noticeDTO.setBoardContents("만세");

		int num = noticeDAO.add(noticeDTO);
		assertEquals(1, num);

	}

	@Test
	public void addSample() throws Exception {
		NoticeDTO noticeDTO = new NoticeDTO();
		for (int i = 0; i < 100; i++) {
			noticeDTO.setBoardWriter("ksr3234");
			noticeDTO.setBoardTitle("야호" + i);
			noticeDTO.setBoardContents("만세" + i);
			noticeDAO.add(noticeDTO);
			Thread.sleep(500);
		}

		System.out.println("Finish");
	}

}
