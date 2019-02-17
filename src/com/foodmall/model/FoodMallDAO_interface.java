package com.foodmall.model;

import java.util.List;

public interface FoodMallDAO_interface {
	void insert(FoodMallVO foodMallVO);
	void update(FoodMallVO foodMallVO);
	void delete(String foodSupId, String food_ID);
	FoodMallVO findByPrimaryKey(String food_sup_ID, String food_ID);
	List<FoodMallVO> getAll();
}
