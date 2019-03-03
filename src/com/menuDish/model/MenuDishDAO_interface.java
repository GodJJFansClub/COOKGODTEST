package com.menuDish.model;

import java.util.*;

public interface MenuDishDAO_interface {
	
	public void insert (MenuDishVO menuDishVO);
	public void update (String dish,MenuDishVO menuDishVO);
	public void delete (String menu_ID, String dish_ID);
	public MenuDishVO findyByPrimaryKeys(String menu_ID);
	public List<MenuDishVO> getAll();

}