package com.chef.app.recipe;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.chef.app.recipe.RecipeDAO.";

	public List<RecipeDTO> recipeList(RecipePager recipePager) {

		return sqlSession.selectList(NAMESPACE + "recipeList", recipePager);

//		for (RecipeDTO recipe : recipes) {
//			System.out.println("Recipe Num: " + recipe.getRecipe_num());
//			System.out.println("Recipe Name: " + recipe.getRecipe_name());
//		}
//
//		return recipes;
	}

	public RecipeDTO recipeDetail(RecipeDTO recipeDTO) {
		return sqlSession.selectOne(NAMESPACE + "recipeDetail", recipeDTO);
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

	public Long getTotalCount(RecipePager recipePager) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("DAO Recipe Num: " + recipePager.getLastNum());
		return sqlSession.selectOne(NAMESPACE + "getTotalCount", recipePager);

	}

	public int mainImg(RecipeImgFileDTO recipeImgFileDTO) {

		return sqlSession.insert(NAMESPACE + "mainImg", recipeImgFileDTO);
	}

	public List<Map<String, Object>> categoryCount() {

		return sqlSession.selectList(NAMESPACE + "categoryCount");
	}

	public int recipeReview(RecipeReviewDTO recipeReviewDTO) {
		return sqlSession.insert(NAMESPACE + "recipeReview", recipeReviewDTO);
	}

	public List<RecipeReviewDTO> reviewList(RecipeReviewDTO recipeReviewDTO) {

		return sqlSession.selectList(NAMESPACE + "reviewList", recipeReviewDTO);
	}

	public int replyUpdateInsert(RecipeReviewDTO recipeReviewDTO) {
		return sqlSession.update(NAMESPACE + "replyUpdateInsert", recipeReviewDTO);
	}

	public int hit(RecipeDTO recipeDTO) {
		return sqlSession.update(NAMESPACE + "hit", recipeDTO);
	}

	public int recipeReply(RecipeReplyDTO recipeReplyDTO) {

		return sqlSession.insert(NAMESPACE + "recipeReply", recipeReplyDTO);
	}

	public List<RecipeReviewDTO> replyList(RecipeReplyDTO recipeReplyDTO) {

		return sqlSession.selectList(NAMESPACE + "replyList", recipeReplyDTO);
	}

	public int recipeComment(RecipeReplyDTO recipeReplyDTO) {

		return sqlSession.insert(NAMESPACE + "recipeComment", recipeReplyDTO);
	}

	public int replyUpdate(RecipeDTO recipeDTO) {
		return sqlSession.update(NAMESPACE + "replyUpdate", recipeDTO);
	}

	public RecipeReplyDTO getParentReply(Long recipe_reply_num) {
		return sqlSession.selectOne(NAMESPACE + "getParentReply", recipe_reply_num);
	}

	public List<RecipeReplyDTO> findParent(RecipeReplyDTO recipeReplyDTO) {
		return sqlSession.selectList(NAMESPACE + "findParent", recipeReplyDTO);
	}

	public int stepUpdate(RecipeReplyDTO recipeReplyDTO) {
		return sqlSession.update(NAMESPACE + "stepUpdate", recipeReplyDTO);

	}

	public int adminReplySubmit(RecipeReplyDTO recipeReplyDTO) {
		return sqlSession.insert(NAMESPACE + "adminReplySubmit", recipeReplyDTO);
	}

	public int recipeUpdate(RecipeDTO recipeDTO) {
		return sqlSession.update(NAMESPACE + "recipeUpdate", recipeDTO);
	}

	public int updateRecipeImg(RecipeImgFileDTO recipeImgFileDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "updateRecipeImg", recipeImgFileDTO);
	}

	public int recipeDelete(RecipeDTO recipeDTO) {
		return sqlSession.update(NAMESPACE + "recipeDelete", recipeDTO);
	}

	public int reviewDelete(RecipeReviewDTO recipeReviewDTO) {
		
		return sqlSession.update(NAMESPACE + "reviewDelete", recipeReviewDTO);
	}

//	public Long getNum() {
//
//		return sqlSession.selectOne(NAMESPACE + "getNum");
//	}

}
