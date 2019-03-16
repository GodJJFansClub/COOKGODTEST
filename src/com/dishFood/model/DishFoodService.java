package com.dishFood.model;

import java .util.List;
import java.util.Set;

import com.food.model.FoodVO;

public class DishFoodService {
	
	private DishFoodDAO_interface dao;
	
	public DishFoodService() {
		dao = new DishFoodDAO();
	}

	public DishFoodVO addDishFood(String dish_ID,String food_ID,
			Integer dish_f_qty,String dish_f_unit) {
		
		DishFoodVO dishFoodVO = new DishFoodVO();
		
		dishFoodVO.setDish_ID(dish_ID);
		dishFoodVO.setFood_ID(food_ID);
		dishFoodVO.setDish_f_qty(dish_f_qty);
		dishFoodVO.setDish_f_unit(dish_f_unit);
		dao.insert(dishFoodVO);
		
		return dishFoodVO;
	}
	
	public DishFoodVO updateDishFood(String dish_ID,String food_ID,
						Integer dish_f_qty,String dish_f_unit) {
		
		DishFoodVO dishFoodVO = new DishFoodVO();
		
		dishFoodVO.setDish_ID(dish_ID);
		dishFoodVO.setFood_ID(food_ID);
		dishFoodVO.setDish_f_qty(dish_f_qty);
		dishFoodVO.setDish_f_unit(dish_f_unit);
		dao.update(dishFoodVO);
		
		return dishFoodVO;
	}
	
	public void deleteDishFood(String dish_ID,String food_ID) {
		dao.delete(dish_ID,food_ID);
	}
	
	public DishFoodVO getOneDishFood(String dish_ID,String food_ID) {
		return dao.findByPrimaryKey(dish_ID, food_ID);
	}
	
	public Set<DishFoodVO> getFoodsByDish(String dish_ID){
		return dao.getFoodsByDish(dish_ID);
	}

	public List<DishFoodVO> getAll(){
		return dao.getAll();
	}
	
	
}
