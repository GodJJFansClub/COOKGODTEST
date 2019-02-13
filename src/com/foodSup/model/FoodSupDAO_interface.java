package com.foodSup.model;

import java.util.List;

public interface FoodSupDAO_interface {
	void insert(FoodSupVO foodSupVO);
	void update(FoodSupVO foodSupVO);
	void delete(String foodSupId);
	FoodSupVO findByPrimaryKey(String foodSupId);
	List<FoodSupVO> getAll();
}
