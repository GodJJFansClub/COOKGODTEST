package com.festOrder.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.festOrder.model.FestOrderService;
import com.festOrder.model.FestOrderVO;

public class FestOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("getOne_For_Display".equals(action)) { 
			System.out.println("檢查點成功");
			int i = 1;
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String fest_or_ID = req.getParameter("fest_or_ID");
				System.out.println("檢查點a35" +(i++));
				if (fest_or_ID == null || (fest_or_ID.trim()).length() == 0) {
					errorMsgs.add("請輸入訂單編號");
					System.out.println("檢查點b" +(i++));
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					System.out.println("檢查點c" +(i++));
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/festOrder/select_page.jsp");
					failureView.forward(req, res);
					System.out.println("檢查點d" +(i++));
					return;
				}
				
//				String report_ID= null;
//				try {
//					report_ID= str;
//				} catch (Exception e) {
//					errorMsgs.add("檢舉編號格式不正確");
//				}
				
				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front-end/festOrder/select_page.jsp");
//					failureView.forward(req, res);
//					return;
//				}
				
				FestOrderService festOrderSvc = new FestOrderService();
				System.out.println("檢查點e" +(i++));
				FestOrderVO festOrderVO = festOrderSvc.getOneFestOrder(fest_or_ID);
				System.out.println(festOrderVO.getFest_or_ID());
				System.out.println("檢查點f" +(i++));
				if (fest_or_ID == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/festOrder/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				System.out.println("檢查點f" +(i++));
				req.setAttribute("festOrderVO", festOrderVO); //資料庫取出的empVO物件，存入req
				String url = "/front-end/festOrder/listOneFestOrder.jsp";
				System.out.println("檢查點g" +(i++));
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				System.out.println("檢查點h" +(i++));
				successView.forward(req, res);
				System.out.println("檢查點i" +(i++));


			} catch (Exception e) {
				System.out.println("A");
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/festOrder/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { //來自listAllReport.jsp的請求
            
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				int i=1;
//				System.out.println(" "+ "檢查點2");
				/***************************1.接收請求參數***************************************/
				String fest_or_ID = req.getParameter("fest_or_ID");
				
				/***************************2.開始查詢資料***************************************/
				FestOrderService festOrderSvc = new FestOrderService();
				FestOrderVO festOrderVO = festOrderSvc.getOneFestOrder(fest_or_ID);
//				System.out.println(" "+ i++);				
				/***********3.查詢完成，準備轉交(Send the Success view)********/
				req.setAttribute("festOrderVO", festOrderVO);   //資料庫取得的reportVO物件，存入req      
				String url = "/front-end/festOrder/update_festOrder_input.jsp";
				System.out.println(" "+ i++);	
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
//				System.out.println(" "+ i++);	

			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/festOrder/listAllFestOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { 
			List<String> errorMsgs = new LinkedList<String>();//來自update_emp_input.jsp的請求
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/**********************1.接收請求參數-輸入格式的錯務處理*********************/
				String fest_or_ID = req.getParameter("fest_or_ID").trim();
				
				String fest_or_status = req.getParameter("fest_or_status");
				
				Integer fest_or_price = null;
				try {
					fest_or_price = new Integer(req.getParameter("fest_or_price").trim());
				} catch (NumberFormatException e) {
					fest_or_price = 0;
					errorMsgs.add("價格請填數字.");
				}

				java.sql.Date fest_or_start = null;
				 try {
					fest_or_start = java.sql.Date.valueOf(req.getParameter("fest_or_start").trim());
				} catch (Exception e) {
					fest_or_start=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入訂單成立日期!");
				}
				
				java.sql.Date fest_or_send = null;
				try {
					fest_or_send = java.sql.Date.valueOf(req.getParameter("fest_or_send").trim());
				} catch (IllegalArgumentException e) {
					fest_or_send=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入訂單出貨日期!");
				}
				
				java.sql.Date fest_or_end = null;
				try {
					fest_or_end = java.sql.Date.valueOf(req.getParameter("fest_or_end").trim());
				} catch (IllegalArgumentException e) {
					fest_or_end=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入訂單結束日期!");
				}
				
				System.out.println("  " +"A");
				String fest_or_disc = req.getParameter("fest_or_disc").trim();
				if (fest_or_disc == null || fest_or_disc.trim().length() == 0) {
					errorMsgs.add("折扣");
				}
				System.out.println("  " +"B");
				String cust_ID = req.getParameter("cust_ID").trim();
				if (cust_ID == null || cust_ID.trim().length() == 0) {
					errorMsgs.add("請輸入會員編號");
				}
				
				System.out.println("  " +"C");
				FestOrderVO festOrderVO=new FestOrderVO();
				festOrderVO.setFest_or_ID(fest_or_ID);
				festOrderVO.setFest_or_status(fest_or_status);
				festOrderVO.setFest_or_price(fest_or_price);
				festOrderVO.setFest_or_start(fest_or_start);
				festOrderVO.setFest_or_send(fest_or_send);
				festOrderVO.setFest_or_end(fest_or_end);
				festOrderVO.setFest_or_disc(fest_or_disc);
				festOrderVO.setCust_ID(cust_ID);
				System.out.println("  " +"檢查點13");
                //Send the use back to the form,if there were errors
                if (!errorMsgs.isEmpty()) {
					req.setAttribute("festOrderVO", festOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/festOrder/update_festOrder_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}

				/***************************2.開始修改資料*****************************************/
                FestOrderService festOrderSvc = new FestOrderService();
				festOrderVO = festOrderSvc.updateFestOrder
						(fest_or_ID, fest_or_status, fest_or_price, fest_or_start, fest_or_send, 
								fest_or_end, fest_or_disc, cust_ID);
				System.out.println(festOrderVO);
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("festOrderVO", festOrderVO); // 資料庫update成功後,正確的的empVO物件,存入req
				System.out.println(festOrderVO+"221");
				String url = "/front-end/festOrder/listAllFestOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				System.out.println("  " +"檢查點16");
				
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/festOrder/update_festOrder_input.jsp");
				failureView.forward(req, res);
			}
			
		}
				
        if ("insert".equals(action)) { //來自addReport.jsp的請求 
//			System.out.println("檢查點256");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				int i=1;
//				System.out.println("檢查點"+i++);
				/***********************1.接收請求參數-輸入格式的錯誤處理*************************/
				String fest_or_status = req.getParameter("fest_or_status").trim();
				if (fest_or_status == null || fest_or_status.trim().length() == 0) {
					errorMsgs.add("訂單狀態請勿空白");
				}
				
				Integer fest_or_price = null;
				try {
					fest_or_price = new Integer(req.getParameter("fest_or_price").trim());
				}catch(NumberFormatException e) {
					fest_or_price=0;
					errorMsgs.add("請輸入價格：");
				}
				
			    java.sql.Date fest_or_start = null;
			    try {
			    	fest_or_start = java.sql.Date.valueOf(req.getParameter("fest_or_start").trim());
				} catch (IllegalArgumentException e) {
					fest_or_start = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入訂單日期");
				}
			    
			    java.sql.Date fest_or_send = null;
			    try {
					fest_or_send =java.sql.Date.valueOf(req.getParameter("fest_or_send").trim());
				} catch (IllegalArgumentException e) {
					fest_or_send = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入出貨日期");
				}
				
			    java.sql.Date fest_or_end = null;
			    try {
				    fest_or_end =java.sql.Date.valueOf(req.getParameter("fest_or_end").trim());	
				} catch (IllegalArgumentException e) {
					fest_or_end = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入訂單結束日期");
				}
			  
			    String fest_or_disc = req.getParameter("fest_or_disc").trim();  
			    
				String cust_ID = req.getParameter("cust_ID").trim();
				if (cust_ID == null || cust_ID.trim().length() == 0) {
					errorMsgs.add("請輸入會員編號");
				}
				
				FestOrderVO festOrderVO = new FestOrderVO();
				festOrderVO.setFest_or_status(fest_or_status);
				festOrderVO.setFest_or_price(fest_or_price);
				festOrderVO.setFest_or_start(fest_or_start);
				festOrderVO.setFest_or_send(fest_or_send);
				festOrderVO.setFest_or_end(fest_or_end);
				festOrderVO.setFest_or_disc(fest_or_disc);
				festOrderVO.setCust_ID(cust_ID);
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("festOrderVO", festOrderVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/festOrder/addFestOrder.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料**************************************/
				FestOrderService festOrderSvc = new FestOrderService();
				festOrderVO = festOrderSvc.addFestOrder(fest_or_status,fest_or_price,fest_or_start,
				fest_or_send,fest_or_end,fest_or_disc,cust_ID);
				
				/***************************3.新增完成，準備提交(Send the Success view**********/
				String url = "/front-end/festOrder/listAllFestOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); //
				successView.forward(req, res);				
				
				/***************************其它可能的錯誤處理*********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/festOrder/addFestOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
	
		if ("delete".equals(action)) { 
			System.out.println("  " +"檢查點4");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				String fest_or_ID = req.getParameter("fest_or_ID");
				
				FestOrderService festOrderSvc = new FestOrderService();
				festOrderSvc.deleteFestOrder(fest_or_ID);
											
				String url = "/front-end/festOrder/listAllFestOrder.jsp";
		//		System.out.println("  " +"檢查點5");
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
		//		System.out.println("  " +"檢查點6");
				
			} catch (Exception e) {
				System.out.println(" "+"檢查點7");
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/festOrder/listAllFestOrder.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
