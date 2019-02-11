package foodMall.model;

import java.util.List;

public interface FoodMallDAO_interface {
	void insert(FoodMallVO foodMallVO);
	void update(FoodMallVO foodMallVO);
	void delete(String foodSupId, String foodId);
	FoodMallVO findByPrimaryKey(String foodSupId, String foodId);
	List<FoodMallVO> getAll();
}
