package com.chef.app.recipe;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chef.app.util.Pager;

@Repository
public class RecipeDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.chef.app.recipe.RecipeDAO.";

	public List<RecipeDTO> recipeList() {

		return sqlSession.selectList(NAMESPACE + "recipeList");

//		for (RecipeDTO recipe : recipes) {
//			System.out.println("Recipe Num: " + recipe.getRecipe_num());
//			System.out.println("Recipe Name: " + recipe.getRecipe_name());
//		}
//
//		return recipes;
	}

	public int recipeAdd(RecipeDTO recipeDTO) {

		int recipes = sqlSession.insert(NAMESPACE + "recipeAdd", recipeDTO);

		System.out.println("DAO Recipe Num: " + recipeDTO.getRecipe_num());
		System.out.println("DAO Recipe Name: " + recipeDTO.getRecipe_name());

		return recipes;
	}
//    public Long getLastInsertId() {
//        return sqlSession.selectOne(NAMESPACE + "getLastInsertId");
//    }
	
	public Long getTotalCount(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + "getTotalCount", pager);
	}

	public int mainImg(RecipeImgFileDTO recipeImgFileDTO) {

		return sqlSession.insert(NAMESPACE + "mainImg", recipeImgFileDTO);
	}

}
