package com.cust.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.cust.model.CustService;
import com.cust.model.CustVO;

import piciotest.PicIOTest;

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
					errorMsgs.add("會員姓名: 請勿空白");
				}else if (!cust_name.trim().matches(cust_nameReg)) {
					errorMsgs.add("會員姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}
				
				String cust_pwd = req.getParameter("cust_pwd");
				String cust_pwdReg ="^[(?=.*\\d)(?=.*[a-zA-Z])]{6,15}$$";
				if(cust_name == null || cust_name.trim().length() == 0) {
					errorMsgs.add("會員密碼: 請勿空白");
				}else if (!cust_name.trim().matches(cust_nameReg)) {
					errorMsgs.add("會員密碼: 至少有一個數字, 至少有一個大寫或小寫英文字母 , 且長度必需在6到15之間");
				}
				
				String cust_acc = req.getParameter("cust_acc");
				String cust_accReg ="[A-Za-z0-9]{6,15}";
				if(cust_name == null || cust_name.trim().length() == 0) {
					errorMsgs.add("會員帳號: 請勿空白");
				}else if (!cust_name.trim().matches(cust_nameReg)) {
					errorMsgs.add("會員帳號: 只能是英文字母、數字, 且長度必需在6到15之間");
				}
				
				
				
				String cust_ID = new String (req.getParameter("cust_ID".trim()));
				
				CustVO custVO = new CustVO();
				custVO.setCust_name(cust_name);
				
				//如果以上格式有錯
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("custVO", custVO);//以下練習正則(規)表示式(regular-expression)
					RequestDispatcher failureView = req.getRequestDispatcher("/cust/addCust.jsp");
					
					failureView.forward(req, res);
					return;
				}
				
//				String cust_acc = ""
				CustService custSvc = new CustService();
//				
//				custVO = custSvc.addCust(cust_acc, cust_pwd, cust_name, cust_sex, cust_tel, cust_addr, cust_pid, cust_mail, cust_brd, cust_reg, cust_pic, cust_status, cust_niname);
				custVO = custSvc.addCust("C00066", "ddd", cust_name, "f", "050505", "8888", "A123456789", "@54564", "2017-02-06", "2015-02-01", PicIOTest.getPictureByteArray("C://Pictures/go.jpg"), "c","ff" );
				
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
