package com.menuOrder.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.menuOrder.model.MenuOrderService;
import com.menuOrder.model.MenuOrderVO;

public class MenuOrderServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String indexUrl = "/menuOrder/index.jsp";
		
		if("insert".equals(action)) {
			//1.接收參數，處理錯誤
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);

			try{
				Timestamp menu_od_book = null;	
				try {
					menu_od_book = Timestamp.valueOf(request.getParameter("menu_od_book").trim());
				}catch(Exception e){
					menu_od_book = null;
					errorMsgs.add("請輸入正確日期");
				}
				String cust_ID = request.getParameter("cust_ID");
				String chef_ID = request.getParameter("chef_ID");
				String menu_ID = request.getParameter("menu_ID");
				
				MenuOrderVO menuOrderVO = new MenuOrderVO();
				menuOrderVO.setMenu_od_book(menu_od_book);
				menuOrderVO.setCust_ID(cust_ID);
				menuOrderVO.setChef_ID(chef_ID);
				menuOrderVO.setMenu_ID(menu_ID);
				
				if(!errorMsgs.isEmpty()) {
					request.setAttribute("menuOrderVO", menuOrderVO);
					RequestDispatcher errView = request.getRequestDispatcher("/menuOrder/addMenuOrder.jsp");
					errView.forward(request, response);
					return;
				}
				//2.新增資料
				MenuOrderService menuOrderSvc = new MenuOrderService();
				menuOrderVO = menuOrderSvc.addMenuOrder(menu_od_book, cust_ID, chef_ID, menu_ID);
				//3.新增完成&轉交
				RequestDispatcher successView = request.getRequestDispatcher("/menuOrder/listAllMenuOrder.jsp");
				successView.forward(request, response);
				//4.其他可能的錯誤處理
			}catch(Exception e){
				errorMsgs.add(e.getMessage());
				RequestDispatcher errView = request.getRequestDispatcher("/menuOrder/addMenuOrder.jsp");
				errView.forward(request, response);
			}
		}
		if("getOneForUpdate".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {				
				//1.接收請求參數，並做錯誤判斷				
				String menu_od_ID = request.getParameter("menu_od_ID");
				
				//2.開始查詢資料
				MenuOrderService menuOrderSvc = new MenuOrderService();
				MenuOrderVO menuOrderVO = menuOrderSvc.getOneMenuOrder(menu_od_ID);
				
				//3.查詢完成，準備轉交
				request.setAttribute("menuOrderVO", menuOrderVO);
				RequestDispatcher sucessView = request.getRequestDispatcher("/menuOrder/updateMenuOrder.jsp");
				sucessView.forward(request, response);
				
			}catch(Exception e) {
				errorMsgs.add("無法取得要修改的資料:"+e.getMessage());
				RequestDispatcher errView = request.getRequestDispatcher("/menuOrder/listAllMenuOrder.jsp");
				errView.forward(request, response);
			}
		}
	
		if("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try {				
				//1.接收請求參數，並做錯誤判斷
				String menu_od_ID = request.getParameter("menu_od_ID");
				String menu_od_status = request.getParameter("menu_od_status");
				Timestamp menu_od_book = null;	
				try {
					menu_od_book = Timestamp.valueOf(request.getParameter("menu_od_book").trim());
				}catch(Exception e){
					menu_od_book = null;
					errorMsgs.add("請輸入正確日期");
				}
				java.sql.Date menu_od_end = null;
				try {
					menu_od_end = java.sql.Date.valueOf(request.getParameter("menu_od_end").trim());
				}catch(Exception e){
					menu_od_end = null;
					errorMsgs.add("請輸入正確日期");
				}
				Integer menu_od_rate = new Integer(request.getParameter("menu_od_rate"));
				String menu_od_msg = request.getParameter("menu_od_msg");
				String chef_ID = request.getParameter("chef_ID");
				String menu_ID = request.getParameter("menu_ID");
				
				MenuOrderVO menuOrderVO = new MenuOrderVO();
				menuOrderVO.setMenu_od_ID(menu_od_ID);
				menuOrderVO.setMenu_od_status(menu_od_status);
				menuOrderVO.setMenu_od_book(menu_od_book);
				menuOrderVO.setMenu_od_end(menu_od_end);
				menuOrderVO.setMenu_od_rate(menu_od_rate);
				menuOrderVO.setMenu_od_msg(menu_od_msg);
				menuOrderVO.setChef_ID(chef_ID);
				menuOrderVO.setMenu_ID(menu_ID);
				
				if(!errorMsgs.isEmpty()) {
					request.setAttribute("menuOrderVO", menuOrderVO);
					RequestDispatcher errView = request.getRequestDispatcher("/menuOrder/updateMenuOrder.jsp");
					errView.forward(request, response);
					return;
				}
				//2.開始修改資料
				MenuOrderService menuOrderSvc = new MenuOrderService();
				menuOrderVO = menuOrderSvc.updateMenuOrder(menu_od_status, menu_od_book, menu_od_end, menu_od_rate, menu_od_msg, chef_ID, menu_ID);
				
				//3.修改完成，轉交資料
				request.setAttribute("menuOrderVO", menuOrderVO);
				RequestDispatcher sucessView = request.getRequestDispatcher("/menuOrder/listOneMenuOrder.jsp");
				sucessView.forward(request, response);
				
			}catch(Exception e) {
				errorMsgs.add("Update Data Error:"+e.getMessage());
				RequestDispatcher errView = request.getRequestDispatcher("/menuOrder/updateMenuOrder.jsp");
				errView.forward(request, response);
			}
		}

		if("getOneMenuOrder".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			request.setAttribute("errorMsgs", errorMsgs);
			
			try{
				//1.接收請求參數，並做錯誤判斷
				String str = request.getParameter("menu_od_ID");
				if(str==null||str.trim().length()==0) {
					errorMsgs.add("請輸入訂單編號");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher errView = 
							request.getRequestDispatcher(indexUrl); 
					errView.forward(request, response);
					return;				
				}
				String menu_od_ID = null;
				try {
					menu_od_ID = new String(str);
				}catch(Exception e) {
					errorMsgs.add("套餐訂單編號格式不正確");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher errView = 
							request.getRequestDispatcher(indexUrl);
					errView.forward(request, response);
					return;//程式中斷
				}
				
				//2.開始查詢資料
				MenuOrderService menuOrderSvc = new MenuOrderService();
				MenuOrderVO menuOrderVO = menuOrderSvc.getOneMenuOrder(menu_od_ID);
				if(menuOrderVO==null) {
					errorMsgs.add("查無資料");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher errView = 
							request.getRequestDispatcher(indexUrl);
					errView.forward(request, response);
					return;
				}
				//3.查詢完成，準備轉交
				//資料庫取出的menuOrderVO物件,存入request
				request.setAttribute("menuOrderVO", menuOrderVO);
				RequestDispatcher successView = 
						request.getRequestDispatcher("/menuOrder/listOneMenuOrder.jsp");
				successView.forward(request, response);
			}catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher errView = 
						request.getRequestDispatcher(indexUrl);
				errView.forward(request, response);
			}	
		}
	}
}
