package com.menuOrder.model;

import java.sql.Date;
import java.sql.Timestamp;

public class MenuOrderService {
	
	private MenuOrderDAO_Interface dao;
	
	public MenuOrderService() {
		dao = new MenuOrderDAO();
	}
	
	public MenuOrderVO addMenuOrder(String menu_od_status, Timestamp menu_od_start, Timestamp menu_od_book, String cust_ID, String chef_ID, String menu_ID) {
		
		MenuOrderVO menuOrderVO = new MenuOrderVO();
		menuOrderVO.setMenu_od_status(menu_od_status);
		menuOrderVO.setMenu_od_start(menu_od_start);
		menuOrderVO.setMenu_od_book(menu_od_book);
		menuOrderVO.setCust_ID(cust_ID);
		menuOrderVO.setChef_ID(chef_ID);
		menuOrderVO.setMenu_ID(menu_ID);
				
		return menuOrderVO;	
	}
	public MenuOrderVO updateMenuOrder() {
		
		MenuOrderVO menuOrderVO = new MenuOrderVO();
		
		return menuOrderVO;
	}
	
}
