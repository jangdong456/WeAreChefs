package com.chef.app.food;

import java.util.List;
import java.util.Map;

import javax.mail.Store;

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
	
	public List<FoodDTO> getList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}
	
	public Long getTotalCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pager);
	}
	
	public List<Map<String, Object>> categoryCount() throws Exception{
		return sqlSession.selectList(NAMESPACE+"categoryCount");
	}
	
	public FoodDTO getDetail(FoodDTO foodDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getDetail", foodDTO);
	}
	
	public int updateDetail (FoodDTO foodDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"updateDetail", foodDTO);
	}
	
	public int updateFoodImg (StoreImgFileDTO storeImgFileDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"updateFoodImg", storeImgFileDTO);
	}
	
	public int detailDelete(FoodDTO foodDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"detailDelete", foodDTO);
	}
	
	public int cartAdd(Map<String, Object>map) throws Exception {
		return sqlSession.insert(NAMESPACE+"cartAdd", map);
	}
	
	public List<FoodDTO> selectCart(Map<String, Object>map) throws Exception {
		return sqlSession.selectList(NAMESPACE+"selectCart", map);
	}
	
	public int updateCart(Map<String, Object>map) throws Exception {
		return sqlSession.update(NAMESPACE+"updateCart", map);
	
	}
	
	public List<StoreCartDTO> cartList(StoreCartDTO storeCartDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"cartList", storeCartDTO);
	}
	
	public int deleteCart(StoreCartDTO storeCartDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"deleteCart", storeCartDTO);
	}
		
	public int orderInsert(StoreOrderDTO storeOrderDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"orderInsert", storeOrderDTO);
	}

	public int midOrderInsert(StoreMidOrderDTO storeMidOrderDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"midOrderInsert", storeMidOrderDTO);
	}
	
	public int orderFinishCartDelete(Map<String, Object> map) throws Exception {
		return sqlSession.delete(NAMESPACE+"orderFinishCartDelete", map);
	}
	
	public int cartCountChange(StoreCartDTO storeCartDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"cartCountChange", storeCartDTO);
	}
	
	public List<StoreCartDTO> payCartList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE+"payCartList", map);
	}
	
	public Long getNum() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getNum");
	}
	
	public int replyAdd(StoreReplyDTO storeReplyDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"replyAdd", storeReplyDTO);
	}
	
	public List<StoreReplyDTO> replyList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE+"replyList", map);
	}
	
	public int replyUpdateInsert(StoreReplyDTO storeReplyDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"replyUpdateInsert", storeReplyDTO);
	}
	
	public int adminReplySubmit(StoreReplyDTO storeReplyDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"adminReplySubmit", storeReplyDTO);
	}
	
	public List<StoreReplyDTO> findParent(StoreReplyDTO storeReplyDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"findParent", storeReplyDTO);
	}
	
	public int stepUpdate(StoreReplyDTO storeReplyDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"stepUpdate", storeReplyDTO);
	}
	
	public int replyDelete(StoreReplyDTO storeReplyDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"replyDelete", storeReplyDTO);
	}
	
	public int replyDeleteAdmin(StoreReplyDTO storeReplyDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"replyDeleteAdmin", storeReplyDTO);
	}
	
	public Long getReplyNum(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getReplyCount", map);
	}
	
}
