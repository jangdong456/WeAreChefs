package com.chef.app.food;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FoodDAO {
	
	@Autowired
	private SqlSession sqlSession;

	private final String NAMESPACE = "com.chef.app.food.FoodDAO.";
	
	public List<FoodDTO> searchFood(FoodDTO foodDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"searchFood", foodDTO);
	}
	
	public int add(FoodDTO foodDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"add", NAMESPACE);
	}

}
