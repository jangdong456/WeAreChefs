package com.sse.app.products;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.sse.app.DefaultTest;

public class ProductDAOTest extends DefaultTest {

	@Autowired
	private ProductDAO productDAO;

	public void getDetailTest() throws Exception {
		ProductDTO productDTO = new ProductDTO();
		productDTO.setItem_id(99);
		productDTO = productDAO.getDeatil(productDTO);

//		단정문
		assertNotNull(productDTO);
	}

//	@Test
	public void addInfoTest() throws Exception {
		ProductDTO productDTO = new ProductDTO();
		productDTO.setItem_name("비가");
		productDTO.setItem_detail("와요");
		productDTO.setItem_rate(7.08);
		int result = productDAO.addInfo(productDTO);

		assertEquals(1, result);

	}

//	@Test
	public void addTest() throws Exception {
		ProductDTO productDTO = new ProductDTO();
		for (int i = 0; i < 100; i++) {
			productDTO.setItem_name("자유입출금" + i);
			Double r = ((int) (Math.random() * 1000)) / 100.0;
			productDTO.setItem_rate(r);
			productDTO.setItem_detail("상세설명" + i);
			productDAO.addInfo(productDTO);
			Thread.sleep(500);
		}
		System.out.println("Finish");
	}

	@Test
	public void pageTest() throws Exception {

		long perPage = 10;
		long totalCount = 66;
		long totalPage = totalCount / perPage;

		if (totalCount % perPage != 0) {
			totalPage = totalCount / perPage + 1;
		} else {
			totalPage = totalCount / perPage;
		}

		System.out.println(totalPage);
	}

}
