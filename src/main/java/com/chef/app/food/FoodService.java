package com.chef.app.food;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.chef.app.file.FileManager;
import com.chef.app.util.Pager;

@Service
public class FoodService {
	
	@Autowired
	private FoodDAO foodDAO;
	@Autowired
	private FileManager fileManager;
	
	public List<FoodDTO> searchFood(FoodDTO foodDTO) throws Exception{
		List<FoodDTO> ar = foodDAO.searchFood(foodDTO);
		return ar;
	}
	
	public int add(FoodDTO foodDTO,MultipartFile attach,HttpSession session) throws Exception{
		
		int result = foodDAO.add(foodDTO);
		Long foodNum = foodDTO.getFood_num();
		
		if(attach.isEmpty()) {
			StoreImgFileDTO storeImgFileDTO = new StoreImgFileDTO();
			storeImgFileDTO.setFood_num(foodNum);
			storeImgFileDTO.setFile_name("default.jpg");
			result = foodDAO.mainImg(storeImgFileDTO);
			return result;
		}
				
		ServletContext servletContext = session.getServletContext();
	    String absolutePath = servletContext.getRealPath("resources/upload/foods");
		System.out.println(absolutePath);
		
		String fileName = fileManager.fileSave(absolutePath, attach);
		StoreImgFileDTO storeImgFileDTO = new StoreImgFileDTO();
		storeImgFileDTO.setFile_name(fileName);
		storeImgFileDTO.setFood_num(foodNum);
		
		result = foodDAO.mainImg(storeImgFileDTO);
		
		return result;
		
	}
	
	public String uploadContentImage(MultipartFile upload,HttpSession session) throws Exception{
				
		ServletContext servletContext = session.getServletContext();
		String path = servletContext.getRealPath("resources/upload/foodcontents");

		String fileName = fileManager.fileSave(path,upload);
		return fileName;
		
	}
	
	public List<FoodDTO> getList(Pager pager) throws Exception{
				
		Long totalRow = foodDAO.getTotalCount(pager);
		
		if(totalRow==0) {
			totalRow=1L;
		}
	
		pager.makeRow(9L);
		pager.makeNum(totalRow, 9L, 5L);
		List<FoodDTO> ar = foodDAO.getList(pager);
		return ar;
		
	}
	
	public List<Map<String, Object>> categoryCount() throws Exception{
		return foodDAO.categoryCount();
	}
	
	public Map<String, Object> getDetail(FoodDTO foodDTO,Pager pager) throws Exception {
		
		FoodDTO foodDTO2 =foodDAO.getDetail(foodDTO);
		
		Map<String, Object> replyList = new HashMap<String, Object>();
		
		replyList.put("foodDTO", foodDTO);
		
		Long totalRow = foodDAO.getReplyNum(foodDTO);
		if(totalRow==0) {
			totalRow=1L;
		}

		int result = 1;
		Long testStart = 1L;
		Long testEnd = 5L;
		int middleSize = 0;
		Pager testPager = new Pager();
		Map<String, Object> testMap = new HashMap<String, Object>();
		
		testPager.setStartRow(testStart);
		testPager.setLastRow(testEnd);
		testMap.put("foodDTO", foodDTO);
		testMap.put("pager", testPager);
		
		if(foodDAO.replyList(testMap).isEmpty()) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("dto", foodDTO2);
			
			return map;
			
		}else {			
			
			middleSize = foodDAO.replyList(testMap).size();
			
			while(middleSize!=totalRow) {
				testStart+=5;
				testEnd+=5;
				testPager.setStartRow(testStart);
				testPager.setLastRow(testEnd);
				testMap.put("foodDTO", foodDTO);
				testMap.put("pager", testPager);
				middleSize +=foodDAO.replyList(testMap).size();
				result+=1;
			}
			
			long totalBlock = 0;
			
			if (result % 5 != 0) {
				totalBlock = result / 5 + 1;
			} else {
				totalBlock = result / 5;
			}
			
			long curBlock = 0;
			
			if (pager.getPage() % 5 != 0) {
				curBlock = pager.getPage() / 5 + 1;
			} else {
				curBlock = pager.getPage() / 5;
			}
			
			Long startNum = 1 + (5 * (curBlock - 1));
			Long lastNum = curBlock * 5;
			
			boolean pre = true;
			boolean next = true; 
			if (curBlock == 1) {
				pre = false;
			}
			
			if (curBlock == totalBlock) {
				next = false;
				lastNum = (long) result;
			}
			
			pager.makeRow(5L);
			
			pager.setLastNum(lastNum);
			pager.setStartNum(startNum);
			pager.setPre(pre);
			pager.setNext(next);
			
			
			replyList.put("pager", pager);
			
			List<StoreReplyDTO> storeReplyDTOs = foodDAO.replyList(replyList);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("dto", foodDTO2);
			map.put("reply", storeReplyDTOs);
			map.put("pager", pager);
			
			return map;
		}
			
	}
	
	public int updateDetail(MultipartFile attach,HttpSession session,FoodDTO foodDTO) throws Exception {
		
		int result = foodDAO.updateDetail(foodDTO);
		Long foodNum = foodDTO.getFood_num();
		
		if(!attach.isEmpty()) {
				
			ServletContext servletContext = session.getServletContext();
			String path = servletContext.getRealPath("resources/upload/foods");
			System.out.println(path);
			
			String fileName = fileManager.fileSave(path, attach);
			StoreImgFileDTO storeImgFileDTO = new StoreImgFileDTO();
			storeImgFileDTO.setFile_name(fileName);
			storeImgFileDTO.setFood_num(foodNum);
			
			result = foodDAO.updateFoodImg(storeImgFileDTO);

			return result;
		}	
	
			String notChange = foodDTO.getStoreImgFileDTO().getFile_name();
			
			StoreImgFileDTO storeImgFileDTO = new StoreImgFileDTO();
			storeImgFileDTO.setFile_name(notChange);
			storeImgFileDTO.setFood_num(foodNum);
			
			result = foodDAO.updateFoodImg(storeImgFileDTO);
			
			return result;
	}
	
	public int detailDelete (FoodDTO foodDTO) throws Exception {
		int result = foodDAO.detailDelete(foodDTO);
		result = foodDAO.imgDelete(foodDTO);
		return result;
	} 
	
	public int cartAdd (Map<String, Object> map) throws Exception {
				
		List<FoodDTO> ar = foodDAO.selectCart(map);
		
		if(ar.isEmpty()) {
			return foodDAO.cartAdd(map);
		}
			return foodDAO.updateCart(map);
	}
	
	public List<StoreCartDTO> cartList(StoreCartDTO storeCartDTO) throws Exception{
		return foodDAO.cartList(storeCartDTO);
	}
	
	public int deleteCart(StoreCartDTO storeCartDTO) throws Exception {
		return foodDAO.deleteCart(storeCartDTO);
	}	
	
	public int orderInsert (StoreOrderDTO storeOrderDTO) throws Exception {
		
		int result = foodDAO.orderInsert(storeOrderDTO);
		
		
		List<StoreMidOrderDTO> list = storeOrderDTO.getStore_ar();
		
		for(StoreMidOrderDTO a : list) {
			a.setOrder_num(storeOrderDTO.getOrder_num());
			result = foodDAO.midOrderInsert(a);
			result = foodDAO.stockMinus(a);
		}
		
		String member_id = storeOrderDTO.getMember_id();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("midList", list);
		map.put("member_id", member_id);
		
		result = foodDAO.orderFinishCartDelete(map);
	
		return result;
		
	}
	
	public int cartCountChange(StoreCartDTO storeCartDTO) throws Exception {
		
		return foodDAO.cartCountChange(storeCartDTO);
		
	}
	
	public List<StoreCartDTO> payCartList(List<StoreCartDTO> ar) throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		String member_id = ar.get(0).getMember_id();
		map.put("dto", ar);
		map.put("member_id", member_id);
		
		return foodDAO.payCartList(map);
	}
	
	public int replyAdd(StoreReplyDTO storeReplyDTO) throws Exception {
		
		if(storeReplyDTO.getBoard_content().isEmpty()) {
			storeReplyDTO.setBoard_content(" ");
		}
		
		Long num = foodDAO.getNum();
		
		storeReplyDTO.setBoard_num(num);
		
		return foodDAO.replyAdd(storeReplyDTO);
		
	}
	
	public int replyUpdateInsert(StoreReplyDTO storeReplyDTO) throws Exception {
		
		if(storeReplyDTO.getReply_content().isEmpty()) {
			storeReplyDTO.setReply_content(" ");
		}
		
		return foodDAO.replyUpdateInsert(storeReplyDTO);
	}
	
	public int adminReplySubmit(StoreReplyDTO storeReplyDTO) throws Exception {
		
		if(storeReplyDTO.getReply_content().isEmpty()) {
			storeReplyDTO.setReply_content(" ");
		}
		
		Long ref = storeReplyDTO.getFood_reply_num();
		
		storeReplyDTO.setRef(ref);
		
		Long maxStep = 0L;
		Long maxDepth = 0L;	
		
		List<StoreReplyDTO> parents = foodDAO.findParent(storeReplyDTO);	
		for(StoreReplyDTO p : parents) {
			
		    if (p.getStep() > maxStep) {
		        maxStep = p.getStep();
		    }
		    if (p.getDepth() > maxDepth) {
		        maxDepth = p.getDepth();
		    }
			
			foodDAO.stepUpdate(p);
		}
		
		storeReplyDTO.setStep(maxStep+1);
		storeReplyDTO.setDepth(maxDepth+1);		
		
		return foodDAO.adminReplySubmit(storeReplyDTO);
		
	}
	
	public int replyDelete(StoreReplyDTO storeReplyDTO) throws Exception{
		
		if(storeReplyDTO.getMember_id().equals("12341234")) {
			return foodDAO.replyDeleteAdmin(storeReplyDTO);
		}
		
		return foodDAO.replyDelete(storeReplyDTO);
		
	}
	
	public Double startAvg(FoodDTO foodDTO) throws Exception {
		return foodDAO.startAvg(foodDTO);
	}

}
