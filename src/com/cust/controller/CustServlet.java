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
				
				
				String cust_sex = new String (req.getParameter("cust_sex".trim()));
				if(cust_sex == null || cust_sex.trim().length() ==0) {
					errorMsgs.add("姓別請勿空白");
				}
				
				String cust_tel = new String (req.getParameter("cust_tel".trim()));
				if(cust_sex == null || cust_sex.trim().length() ==0) {
					errorMsgs.add("電話請勿空白");
				}
				
				String cust_addr = new String (req.getParameter("cust_addr".trim()));
				if(cust_sex == null || cust_sex.trim().length() ==0) {
					errorMsgs.add("地址請勿空白");
				}
				
				String cust_pid = new String (req.getParameter("cust_pid".trim()));
				if(cust_sex == null || cust_sex.trim().length() ==0) {
					errorMsgs.add("身分證字號請勿空白");
				}
				
				String cust_mail = new String (req.getParameter("cust_mail".trim()));
				if(cust_sex == null || cust_sex.trim().length() ==0) {
					errorMsgs.add("e-mail請勿空白");
				}
				
				java.sql.Date cust_brd = null;
				try {
					cust_brd = java.sql.Date.valueOf(req.getParameter("cust_brd").trim());
				} catch (IllegalArgumentException e) {
					cust_brd=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				java.sql.Date cust_reg = null;
				try {
					cust_reg = java.sql.Date.valueOf(req.getParameter("cust_reg").trim());
				} catch (IllegalArgumentException e) {
					cust_reg =new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				String cust_status = new String (req.getParameter("cust_status".trim()));
				if(cust_status == null || cust_status.trim().length() ==0) {
					errorMsgs.add("暱稱請勿空白");
				}
				String cust_niname = new String (req.getParameter("cust_niname".trim()));
				if(cust_niname == null || cust_niname.trim().length() ==0) {
					errorMsgs.add("暱稱請勿空白");
				}
				
				
				String cust_ID = new String (req.getParameter("cust_ID".trim()));
				
				CustVO custVO = new CustVO();
				custVO.setCust_acc(cust_acc);
				custVO.setCust_name(cust_name);
				custVO.setCust_pwd(cust_pwd);
				custVO.setCust_sex(cust_sex);
				custVO.setCust_tel(cust_tel);
				custVO.setCust_addr(cust_addr);
				custVO.setCust_pid(cust_pid);
				custVO.setCust_mail(cust_mail);
				custVO.setCust_brd(cust_brd);
				custVO.setCust_reg(cust_reg);
				custVO.setCust_pic(cust_pic);
				custVO.setCust_status(cust_status);
				custVO.setCust_niname(cust_niname);
				
				
				
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
