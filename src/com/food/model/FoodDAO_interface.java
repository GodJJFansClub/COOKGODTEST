package com.food.model;

import java.util.List;

public interface FoodDAO_interface {
	void insert(FoodVO foodVO);
	void update(FoodVO foodVO);
	void delete(String food_ID);
	FoodVO findByPrimaryKey(String food_ID);
	List<FoodVO> getAll();
}
