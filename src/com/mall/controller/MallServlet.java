package com.mall.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.food.model.FoodService;
import com.foodOrDetail.model.FoodOrDetailVO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class MallServlet extends HttpServlet{

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		@SuppressWarnings("unchecked")
		List<Object> buyList = (Vector<Object>) session.getAttribute("shoppingCart");
		String action = req.getParameter("action");
		
		if(!"checkout".equals(action)) {
			if("addFoodMShoppingCart".equals(action)) {
				JsonObject errors = new JsonObject();
				try {
					/*************************** 1.接收請求參數 ****************************************/
					FoodOrDetailVO foodOrDetailVO = getFOD(req, res, errors);
					if( foodOrDetailVO == null ) {
						return;
					}
					/*************************** 2.加入購物車 ****************************************/
					if (buyList == null) {
						buyList = new Vector<Object>();
						buyList.add(foodOrDetailVO);
					} else {
						if (buyList.contains(foodOrDetailVO)) {
							FoodOrDetailVO innerFoodODVO = (FoodOrDetailVO)buyList.get(buyList.indexOf(foodOrDetailVO));
							innerFoodODVO.setFood_od_qty(innerFoodODVO.getFood_od_qty() + foodOrDetailVO.getFood_od_qty());
							innerFoodODVO.setFood_od_stotal(innerFoodODVO.getFood_od_stotal() + foodOrDetailVO.getFood_od_stotal());
						} else {
							buyList.add(foodOrDetailVO);
						}
					}
					session.setAttribute("shoppingCart", buyList);
					
					writeCartJson(res,buyList);
					
				}catch(Exception e) {
					
				}
			}
		}
	}
	
	private void writeJson(HttpServletResponse res, JsonObject outJson) throws IOException{
		res.setContentType("application/Json");
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		out.print(outJson);
		out.flush();
		out.close();
	}
	
	private void writeCartJson(HttpServletResponse res, List<Object> buyList) throws IOException{
		res.setContentType("application/Json");
		res.setCharacterEncoding("UTF-8");
		Gson gson = new Gson();

		PrintWriter out = res.getWriter();
		out.print(gson.toJson(buyList));
		out.flush();
		out.close();
	}
	
	private FoodOrDetailVO getFOD(HttpServletRequest req, HttpServletResponse res,JsonObject errors) throws IOException {
		FoodOrDetailVO foodOrDetailVO = new FoodOrDetailVO();
		String food_ID = req.getParameter("food_ID");
		if(food_ID == null) {
			errors.addProperty("efood_ID", "請輸入食材編號");
			errors.addProperty("foodMCardID", req.getParameter("foodMCardID"));
			writeJson(res, errors);
			return null;
		}
		
		String food_sup_ID = req.getParameter("food_sup_ID");
		if(food_sup_ID == null) {
			errors.addProperty("efood_sup_ID", "請輸入供應商編號");
			errors.addProperty("foodMCardID", req.getParameter("foodMCardID"));
			writeJson(res, errors);
			return null;
		}
		
		Integer food_od_qty = null;
		try {
			food_od_qty = new Integer(req.getParameter("food_od_qty"));
			if(food_od_qty <= 0) {
				errors.addProperty("efood_od_qty", "數量請勿輸入0以下");
				errors.addProperty("foodMCardID", req.getParameter("foodMCardID"));
				writeJson(res, errors);
				return null;
			}
		} catch(Exception e) {
			errors.addProperty("efood_od_qty", "數量格式不正確");
			errors.addProperty("foodMCardID", req.getParameter("foodMCardID"));
			writeJson(res, errors);
			return null;
		}
		Integer food_m_price = null;
		try {
			food_m_price = new Integer(req.getParameter("food_m_price"));
			if(food_m_price <= 0) {
				errors.addProperty("efood_m_price", "價格請勿輸入0以下");
				errors.addProperty("foodMCardID", req.getParameter("foodMCardID"));
				writeJson(res, errors);
				return null;
			}
		}catch(Exception e) {
			errors.addProperty("efood_m_price", "價格格式不正確");
			errors.addProperty("foodMCardID", req.getParameter("foodMCardID"));
			writeJson(res, errors);
			return null;
		}
		foodOrDetailVO.setFood_sup_ID(food_sup_ID);
		foodOrDetailVO.setFood_ID(food_ID);
		foodOrDetailVO.setFood_od_qty(food_od_qty);
		foodOrDetailVO.setFood_od_stotal(food_m_price * food_od_qty);
		
		return foodOrDetailVO;
	}

}
