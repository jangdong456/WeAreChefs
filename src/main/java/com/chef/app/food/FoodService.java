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
	
	public FoodDTO getDetail(FoodDTO foodDTO) throws Exception {
		return foodDAO.getDetail(foodDTO);
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
		return foodDAO.detailDelete(foodDTO);
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

}
