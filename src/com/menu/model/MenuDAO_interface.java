package com.menu.model;

import java.util.*;
import com.menuDish.model.*;

public interface MenuDAO_interface {
	
	public void insert(MenuVO menuVO);
	public void update(MenuVO menuVO);
	public void delete(String menu_ID);
	public MenuVO findByPrimaryKey(String menu_ID);
	public List<MenuVO> getAll();
	
	public Set<MenuDishVO> getDishsByMenuID(String menu_ID);
	public void insertWithDishs(MenuVO menuVO , List<MenuDishVO> list);
	
}
