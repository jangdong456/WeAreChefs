package com.chef.app.food;

import java.util.ArrayList;
import java.util.List;

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
		System.out.println(foodNum);
				
		ServletContext servletContext = session.getServletContext();
		String path = servletContext.getRealPath("resources/upload/foods");
		System.out.println(path);
		
		String fileName = fileManager.fileSave(path, attach);
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
	
		
		pager.makeRow((long) 9);
		Long totalRow = foodDAO.getTotalCount();
		
		pager.makeNum(totalRow, (long) 9, (long) 5);
		
		return foodDAO.getList(pager);
		
	}

}
