package com.chef.app.recipe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecipeService {

	@Autowired
	private RecipeDAO recipeDAO;

	public List<RecipeDTO> recipeList() {
		
		return recipeDAO.recipeList();
	}

}
