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
		int num = recipeDAO.hit(recipeDTO);
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
		return recipeDAO.recipeReview(recipeReviewDTO);
	}

	public List<RecipeReviewDTO> reviewList(RecipeReviewDTO recipeReviewDTO) {

		return recipeDAO.reviewList(recipeReviewDTO);
	}

	public int hit(RecipeDTO recipeDTO) {
		return recipeDAO.hit(recipeDTO);
	}

	public int recipeReply(RecipeReplyDTO recipeReplyDTO) {

		return recipeDAO.recipeReply(recipeReplyDTO);
	}

	public List<RecipeReviewDTO> replyList(RecipeReplyDTO recipeReplyDTO, RecipeDTO recipeDTO) {

		return recipeDAO.replyList(recipeReplyDTO);
	}

	@Transactional
	public int recipeComment(RecipeReplyDTO recipeReplyDTO) {
		// RecipeDTO recipeDTO;

		
		   if (recipeReplyDTO.getRecipe_reply_num() != null) {
		        RecipeReplyDTO parent = recipeDAO.getParentReply(recipeReplyDTO.getRecipe_reply_num());
		        
		        if (parent != null) {
		            recipeReplyDTO.setRef(parent.getRef());
		            recipeReplyDTO.setStep(parent.getStep() + 1);
		            recipeReplyDTO.setDepth(parent.getDepth() + 1);
		        } else {
		            throw new RuntimeException("Parent reply information is incomplete.");
		        }
		    } else {
		        // If this is a top-level reply, set initial values
		        recipeReplyDTO.setRef(null); // This will trigger the sequence value to be used
		        recipeReplyDTO.setStep(0L);
		        recipeReplyDTO.setDepth(0L);
		    }

		    return recipeDAO.recipeComment(recipeReplyDTO);
		}
		// 1. 부모 댓글 조회
//		RecipeDTO parentRecipeDTO = new RecipeDTO();
//		parentRecipeDTO.setRecipe_num(recipeReplyDTO.getRecipe_num());
//
//		// 부모 댓글 정보 조회
//		RecipeDTO parent = recipeDAO.recipeDetail(parentRecipeDTO);
//
//		if (parent != null) {
//			// 2. 부모 댓글의 ref, step, depth 가져오기
//			Long parentRef = parent.getRef();
//			Long parentStep = parent.getStep();
//			Long parentDepth = parent.getDepth();
//			
//	        System.out.println("Parent Ref: " + parentRef);
//	        System.out.println("Parent Step: " + parentStep);
//	        System.out.println("Parent Depth: " + parentDepth);
//
//			// null 체크 추가
//			if (parentRef != null && parentStep != null && parentDepth != null) {
//				// 3. 대댓글의 ref, step, depth 설정
//				recipeReplyDTO.setRef(parentRef);
//				recipeReplyDTO.setStep(parentStep + 1); // parentStep에서 1을 더하기
//				recipeReplyDTO.setDepth(parentDepth + 1); // parentDepth에서 1을 더하기
//
//				// 4. 대댓글 등록
//				int result = recipeDAO.recipeComment(recipeReplyDTO);
//
//				if (result > 0) {
//					recipeDAO.replyUpdate(parent);
//				}
//
//				System.out.println(parent.getAr().get(result).getRef());
//				// parent.setChild_ref(((RecipeReplyDTO)parent.getAr()).getRef());
//				// System.out.println("getChild_ref " + parent.getChild_ref());
//				// int result = recipeDAO.replyUpdate(parent);
//
//				/*
//				 * recipeReplyDTO.setRef(parentReply.getRef());
//				 * recipeReplyDTO.setStep(parentReply.getStep() + 1);
//				 * recipeReplyDTO.setDepth(parentReply.getDepth() + 1);
//				 */
//				// System.out.println("원본글 " + parent.getAr().get(0).getRef());
//
//				return result;
//			} else {
//				System.out.println("Parent reply information is incomplete.");
//				return 0;
//			}
//		} else {
//			// 부모 댓글이 없을 경우 처리
//			 System.out.println("Parent is null.");
//			return 0;
//		}
//	}

}
