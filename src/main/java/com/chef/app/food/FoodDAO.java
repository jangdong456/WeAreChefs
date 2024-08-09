package com.chef.app.food;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chef.app.util.Pager;

@Repository
public class FoodDAO {
	
	@Autowired
	private SqlSession sqlSession;

	private final String NAMESPACE = "com.chef.app.food.FoodDAO.";
	
	public List<FoodDTO> searchFood(FoodDTO foodDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"searchFood", foodDTO);
	}
	
	public int add(FoodDTO foodDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"add", foodDTO);
	}
	
	public int mainImg(StoreImgFileDTO storeImgFileDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"mainImg", storeImgFileDTO);
	}
	
	public List<FoodDTO> getList(FoodPager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}
	
	public Long getTotalCount(FoodPager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pager);
	}
	
	public List<Map<String, Object>> categoryCount() throws Exception{
		return sqlSession.selectList(NAMESPACE+"categoryCount");
	}
	
	public FoodDTO getDetail(FoodDTO foodDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getDetail", foodDTO);
	}

}
