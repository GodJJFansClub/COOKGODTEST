package food.model;

import java.util.List;

public interface FoodDAO_interface {
	void insert(FoodVO foodVO);
	void update(FoodVO foodVO);
	void delete(String foodId);
	FoodVO findByPrimaryKey(String foodId);
	List<FoodVO> getAll();
}
