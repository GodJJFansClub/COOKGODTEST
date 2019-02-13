package com.foodOrder.model;

import java.util.List;


public interface FoodOrderDAO_interface {
	void insert(FoodOrderVO foodOrderVO);
	void update(FoodOrderVO foodMallVO);
	void delete(String foodOrId);
	FoodOrderVO findByPrimaryKey(String foodOrId);
	List<FoodOrderVO> getAll();
}
