package com.chef.app.recipe;

import java.sql.Date;
import java.util.List;

public class RecipeDTO {
	private Long recipe_num;
	private String member_id;
	private String recipe_name;
	private String menu_recipe;
	private Date create_date;
	private Date update_date;
	private String recipe_category;
	private String recipe_level;
	private String recipe_time;
	private Long rating;
	private Long recipe_like;
	private Long recipe_hit;
	private List<RecipeReplyDTO> ar;
	private String recipe_ck;

	private Long ref; // 댓글의 ref
	private Long step; // 댓글의 step
	private Long depth; // 댓글의 depth

	public String getRecipe_ck() {
		return recipe_ck;
	}

	public void setRecipe_ck(String recipe_ck) {
		this.recipe_ck = recipe_ck;
	}

	public Long getRef() {
		return ref;
	}

	public void setRef(Long ref) {
		this.ref = ref;
	}

	public Long getStep() {
		return step;
	}

	public void setStep(Long step) {
		this.step = step;
	}

	public Long getDepth() {
		return depth;
	}

	public void setDepth(Long depth) {
		this.depth = depth;
	}

	public List<RecipeReplyDTO> getAr() {
		return ar;
	}

	public void setAr(List<RecipeReplyDTO> ar) {
		this.ar = ar;
	}

	private RecipeImgFileDTO recipeImgFileDTO;

	public RecipeImgFileDTO getRecipeImgFileDTO() {
		return recipeImgFileDTO;
	}

	public void setRecipeImgFileDTO(RecipeImgFileDTO recipeImgFileDTO) {
		this.recipeImgFileDTO = recipeImgFileDTO;
	}

	public Long getRecipe_num() {
		return recipe_num;
	}

	public void setRecipe_num(Long recipe_num) {
		this.recipe_num = recipe_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getRecipe_name() {
		return recipe_name;
	}

	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}

	public String getMenu_recipe() {
		return menu_recipe;
	}

	public void setMenu_recipe(String menu_recipe) {
		this.menu_recipe = menu_recipe;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public String getRecipe_category() {
		return recipe_category;
	}

	public void setRecipe_category(String recipe_category) {
		this.recipe_category = recipe_category;
	}

	public String getRecipe_level() {
		return recipe_level;
	}

	public void setRecipe_level(String recipe_level) {
		this.recipe_level = recipe_level;
	}

	public String getRecipe_time() {
		return recipe_time;
	}

	public void setRecipe_time(String recipe_time) {
		this.recipe_time = recipe_time;
	}

	public Long getRating() {
		return rating;
	}

	public void setRating(Long rating) {
		this.rating = rating;
	}

	public Long getRecipe_like() {
		return recipe_like;
	}

	public void setRecipe_like(Long recipe_like) {
		this.recipe_like = recipe_like;
	}

	public Long getRecipe_hit() {
		return recipe_hit;
	}

	public void setRecipe_hit(Long recipe_hit) {
		this.recipe_hit = recipe_hit;
	}
}
