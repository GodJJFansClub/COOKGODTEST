package com.foodSup.model;

import java.util.List;

public interface FoodSupDAO_interface {
	void insert(FoodSupVO foodSupVO);
	void update(FoodSupVO foodSupVO);
	FoodSupVO findByPrimaryKey(String food_sup_ID);
	List<FoodSupVO> getAll();
}
