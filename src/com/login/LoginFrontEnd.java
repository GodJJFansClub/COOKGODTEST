package com.login;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.cust.model.CustService;
import com.cust.model.CustVO;


import javax.servlet.annotation.WebServlet;

@WebServlet("/LoginFrontEnd")
public class LoginFrontEnd extends HttpServlet {
	private static final long serialVersionUID = 2L;

	// 【檢查使用者輸入的帳號(account) 密碼(password)是否有效】
	// 【實際上應至資料庫搜尋比對】

	protected boolean allowUser(String account, String password, HttpSession session) {
		CustService custSvc = new CustService();
//	  try {
		CustVO custVO = custSvc.getOneCust_acc(account);
		if (custSvc.getOneCust_acc(account) == null) {
			return false;
		} else if (password.equals(custVO.getCust_pwd())) {

			session.setAttribute("custVO", custVO);
			return true;
		} else
			return false;
//    }catch (NullPointerException nu) {
//    	System.out.println("查無此帳號");
//    }

	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("Big5");
		res.setContentType("text/html; charset=Big5");
		PrintWriter out = res.getWriter();
		CustVO custVO = (CustVO) req.getAttribute("custVO");

		// 【取得使用者 帳號(account) 密碼(password)】
		String account = req.getParameter("account");
		String password = req.getParameter("password");
		HttpSession session = req.getSession();
		
		session.setAttribute("custVO", custVO);

		// 【檢查該帳號 , 密碼是否有效】
		if (!allowUser(account, password, session)) { // 【帳號 , 密碼無效時】
			out.println("<HTML><HEAD><TITLE>Access Denied</TITLE></HEAD>");
			out.println("<BODY>你的帳號 , 密碼無效!<BR>");
			out.println("請按此重新登入 <A HREF=" + req.getContextPath() + "/loginFrontEnd.html>重新登入</A>");
			out.println("</BODY></HTML>");
		} else { // 【帳號 , 密碼有效時, 才做以下工作】

			try {
				String location = (String) session.getAttribute("location");
				if (location != null) {
					session.removeAttribute("location"); // *工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
					res.sendRedirect(location);
					return;
				}
			} catch (Exception ignored) {
			}

			res.sendRedirect(req.getContextPath() + "/login_success.jsp"); // *工作3: (-->如無來源網頁:則重導至login_success.jsp)
		}
	}
}