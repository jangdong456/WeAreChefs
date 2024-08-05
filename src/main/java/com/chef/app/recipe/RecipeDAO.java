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
		
		 List<RecipeDTO> recipes = sqlSession.selectList(NAMESPACE + "recipeList");
		 
		   for (RecipeDTO recipe : recipes) {
	            System.out.println("Recipe Num: " + recipe.getRecipe_num());
	            System.out.println("Recipe Name: " + recipe.getRecipe_name());
	        }
		 
		    return recipes;
		
		//return sqlSession.selectList(NAMESPACE + "recipeList");

	}

}
