package com.sse.app.accounts;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.springframework.beans.factory.annotation.Autowired;

import com.sse.app.DefaultTest;

public class AccountDAOTest extends DefaultTest {

	@Autowired
	private AccountDAO accountDAO;

	public void detail() {
		AccountDTO accountDTO = new AccountDTO();
		accountDTO.setBank_id("1720399639825");
		accountDTO.getProductDTO();

		assertNotNull(accountDTO.getProductDTO());

	}

	public void password() throws Exception {
		AccountInfoDTO accountInfoDTO = new AccountInfoDTO();
		accountInfoDTO.setAccount_u("7777");
		accountInfoDTO.setBalance(10000);
		accountInfoDTO.setBank_id("4444");
		accountInfoDTO.setDifference(1000);
		int num = accountDAO.transfer(accountInfoDTO);

		assertEquals(num, 1);
	}

}
