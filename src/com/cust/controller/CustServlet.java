package com.cust.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.cust.model.CustService;
import com.cust.model.CustVO;

public class CustServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("insert".equals(action)) {
			List<String>errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String cust_name = req.getParameter("cust_name");
				String cust_nameReg ="^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if(cust_name == null || cust_name.trim().length() == 0) {
					errorMsgs.add("姓名請勿空白");
				}else if (!cust_name.trim().matches(cust_nameReg)) {
					errorMsgs.add("姓名請輸入:中文或英文，且長度需要再2-10字之間");
				}
				
				String cust_ID = new String (req.getParameter("cust_ID".trim()));
				
				CustVO custVO = new CustVO();
				custVO.setCust_name(cust_name);
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("custVO", custVO);// 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/cust/addCust.jsp");
					
					failureView.forward(req, res);
					return;
				}
				/////開始新增資料-------------
//				String cust_acc = ""
				CustService custSvc = new CustService();
//				
//				custVO = custSvc.addCust(cust_acc, cust_pwd, cust_name, cust_sex, cust_tel, cust_addr, cust_pid, cust_mail, cust_brd, cust_reg, cust_pic, cust_status, cust_niname);
				custVO = custSvc.addCust("C00066", "ddd", cust_name, "f", "050505", "8888", "A123456789", "@54564", "2017-02-06", "2015-02-01", cust_pic, "c","ff" );
				
				String url = "/cust/listAllcust.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			}catch(Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/cust/addCust.jsp");
				failureView.forward(req, res);
			}
		}
		
	}
	
}
