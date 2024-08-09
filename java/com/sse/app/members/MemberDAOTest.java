package com.sse.app.members;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sse.app.DefaultTest;

public class MemberDAOTest extends DefaultTest {

	@Autowired
	private MemberDAO memberDAO;

	@Test
	public void loginTest() throws Exception {

		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_id("ksr3234");
		memberDTO = memberDAO.login(memberDTO);

		assertEquals(2, memberDTO.getDtos().size());

	}

}
