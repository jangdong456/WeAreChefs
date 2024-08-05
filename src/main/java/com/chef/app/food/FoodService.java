package com.chef.app.food;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FoodService {
	
	@Autowired
	private FoodDAO foodDAO;
	
	public List<FoodDTO> searchFood(FoodDTO foodDTO) throws Exception{
		List<FoodDTO> ar = foodDAO.searchFood(foodDTO);
		return ar;
	}
	
	public void add(FoodDTO foodDTO,MultipartFile attach,HttpSession session) throws Exception{
		
		int result = foodDAO.add(foodDTO);
		
		if(attach == null) {
			return result;
		}
		
		ServletContext servletContext = session.getServletContext();
		String path = servletContext.getRealPath("resources/upload/foods");
		
	}

}
