package com.chef.app.recipe;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.chef.app.file.FileManager;

@Service
public class RecipeService {

	@Autowired
	private RecipeDAO recipeDAO;
	@Autowired
	private FileManager fileManager;

	public String uploadContentImage(MultipartFile upload, HttpSession session) throws Exception {

		ServletContext servletContext = session.getServletContext();
		String path = servletContext.getRealPath("resources/upload/recipecontents");

		String fileName = fileManager.fileSave(path, upload);
		return fileName;

	}

	public List<RecipeDTO> recipeList() {

		return recipeDAO.recipeList();
	}

	public int recipeAdd(RecipeDTO recipeDTO, MultipartFile attach, HttpSession session) throws Exception {
		int result = recipeDAO.recipeAdd(recipeDTO);
		Long RecipeNnm = recipeDTO.getRecipe_num();

		System.out.println("recipeDTO.getRecipe_num " + recipeDTO.getRecipe_num());
		System.out.println("recipeDTO.getRecipe_num " + RecipeNnm);

		ServletContext servletContext = session.getServletContext();
		String path = servletContext.getRealPath("resources/upload/recipes");

		System.out.println(path);

		String fileName = fileManager.fileSave(path, attach);

		RecipeImgFileDTO recipeImgFileDTO = new RecipeImgFileDTO();

		recipeImgFileDTO.setFile_name(fileName);
		recipeImgFileDTO.setRecipe_num(RecipeNnm);

		System.out.println("setFile_name " + fileName);
		System.out.println("setRecipe_num " + RecipeNnm);

		result = recipeDAO.mainImg(recipeImgFileDTO);

		return result;

	}

}
