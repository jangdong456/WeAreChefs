package com.chef.app.food;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class FoodDAOTest extends DefaultTest{
	
	@Autowired
	private FoodDAO foodDAO;

	@Test
	public void test() {
		foodDAO.getList(pager)
	}

}
