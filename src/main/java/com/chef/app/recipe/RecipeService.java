package com.chef.app.recipe;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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

	public List<RecipeDTO> recipeList(RecipePager recipePager) throws Exception {
//		1.rownum 계산
		Long perBlock = 5L; // 페이지 버튼 몇개 보여줄건지
		// 한페이지에 게시글 몇개 보여줄건지
		Long totalRow = recipeDAO.getTotalCount(recipePager);
		System.out.println("total " + totalRow);
		if (totalRow == 0) {
			totalRow = 1L;
		}

		// pager.makeNum(recipeDAO.getTotalCount(pager),9L,5L);
		// Long totalCount = recipeDAO.getTotalCount(pager);
		recipePager.makeRow(9L);
		recipePager.makeNum(totalRow, 9L, perBlock);

		System.out.println("Start Row: " + recipePager.getStartRow());
		System.out.println("Last Row: " + recipePager.getLastRow());
		List<RecipeDTO> ar = recipeDAO.recipeList(recipePager);

		System.out.println("recipePager.getPage() " + recipePager.getPage());

		return ar;
	}

	public RecipeDTO recipeDetail(RecipeDTO recipeDTO) {
		return recipeDAO.recipeDetail(recipeDTO);

	}

	@Transactional
	public int recipeAdd(RecipeDTO recipeDTO, MultipartFile attach, HttpSession session) throws Exception {
		recipeDAO.recipeAdd(recipeDTO);
		// Long RecipeNnm = recipeDTO.getRecipe_num();
		Long RecipeNnm = recipeDTO.getRecipe_num();
		// recipeDTO.setRecipe_num(RecipeNnm);

		System.out.println("recipeDTO.getRecipe_num " + recipeDTO.getRecipe_num());
		System.out.println("RecipeNnm " + RecipeNnm);

		ServletContext servletContext = session.getServletContext();
		String path = servletContext.getRealPath("resources/upload/recipes");

		System.out.println(path);

		String fileName = fileManager.fileSave(path, attach);

		RecipeImgFileDTO recipeImgFileDTO = new RecipeImgFileDTO();

		recipeImgFileDTO.setFile_name(fileName);
		recipeImgFileDTO.setRecipe_num(RecipeNnm);

		System.out.println("setFile_name " + fileName);
		System.out.println("setRecipe_num " + RecipeNnm);

		int result = recipeDAO.mainImg(recipeImgFileDTO);

		return result;

	}

	public List<Map<String, Object>> categoryCount() throws Exception {

		return recipeDAO.categoryCount();
	}

	public int recipeReview(RecipeReviewDTO recipeReviewDTO) {
		return  recipeDAO.recipeReview(recipeReviewDTO);
	}



}
