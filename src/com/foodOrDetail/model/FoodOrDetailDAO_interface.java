package com.foodOrDetail.model;

import java.util.List;

public interface FoodOrDetailDAO_interface {
	void insert(FoodOrDetailVO foodOrDetailVO);
	void update(FoodOrDetailVO foodOrDetailVO);
	void delete(String foodOrId, String foodSupId, String foodId);
	FoodOrDetailVO findByPrimaryKey(String foodOrId, String foodSupId, String foodId);
	List<FoodOrDetailVO> getAll();
}
