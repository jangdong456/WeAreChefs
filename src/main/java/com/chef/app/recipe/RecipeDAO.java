package com.chef.app.recipe;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.chef.app.recipe.RecipeDAO.";

	public List<RecipeDTO> recipeList() {
		return sqlSession.selectList(NAMESPACE + "recipeList");

	}

}
