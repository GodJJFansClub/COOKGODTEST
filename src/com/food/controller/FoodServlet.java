package com.food.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.food.model.FoodService;
import com.food.model.FoodVO;

public class FoodServlet extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {
		doPost(req, res);
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException{
		
		req.setCharacterEncoding("UTF-8");
		// 利用action參數來決定要做哪個區塊的事
		String action = req.getParameter("action");
		// 字串.equals(放字串變數), 這樣就可以避免NullPointerException
		if("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求
			// 完了只記得LinkedList的特性是插拔比較有利, 但errorMsgs為什麼用這個忘記了
			List<String> errorMsgs = new LinkedList<String>();
			// 記住多數jsp取用時都是看左邊的, 跟map相似的東西
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			// 這個try catch 負責抓錯來顯示?
			try {
			/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("food_ID");
				// 有的表單沒寫會回傳null, 擺在前面因為Short-Circuit Evaluation, 可避滿後者因null產生錯誤
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入食材編號");
				}
				// Send the use back to the form, if there were errors
				// 如果有錯就轉送回select_page
				if (!errorMsgs.isEmpty()) {
					// 暫時沒想到怎樣不寫死路徑, 應是參考P76, P150
					// 目前前面寫/會是以專案路徑開頭
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/food/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				
				// 這裡也許可以用正規表示式來檢查
				String food_ID = str;
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/food/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				/***************************2.開始查詢資料*****************************************/
				FoodService foodSvc = new FoodService();
				FoodVO foodVO = foodSvc.getOneFood(food_ID);
				if (foodVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
//				if (!errorMsgs.) {
//					
//				}
			}catch(Exception e) {
				
			}
		}
	}
}
