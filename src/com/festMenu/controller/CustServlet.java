package com.festMenu.controller;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

import com.cust.model.*;

@WebServlet("/cust.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class CustServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		// add new cust
		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				// 1.姓名
				String fest_m_ID = req.getParameter("fest_m_ID");
				String cust_nameReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (fest_m_ID == null || fest_m_ID.trim().length() == 0) {
					errorMsgs.add("會員姓名: 請勿空白");
				} else if (!fest_m_ID.trim().matches(cust_nameReg)) {
					errorMsgs.add(fest_m_ID);
				}
				// "會員姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間"

				// 9.生日
				java.sql.Date fest_m_start = null;
				try {
					fest_m_start = java.sql.Date.valueOf(req.getParameter("fest_m_start").trim());
				} catch (IllegalArgumentException e) {
					fest_m_start = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				java.sql.Date fest_m_end= null;
				try {
					fest_m_end = java.sql.Date.valueOf(req.getParameter("fest_m_end").trim());
				} catch (IllegalArgumentException e) {
					fest_m_end = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				String fest_m_resume = req.getParameter("fest_m_resume");
				String fest_m_resume_accReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,15}$$";
				if (fest_m_resume_acc == null || fest_m_resume_acc.trim().length() == 0) {
					errorMsgs.add("會員帳號: 請勿空白");
				} else if (!fest_m_resume_acc.trim().matches(fest_m_resume_accReg)) {
					errorMsgs.add("會員帳號: 只能是英文字母開頭, 且長度必需在5到15之間");
				}
				
				// 12.暱稱
				String fest_m_status = new String(req.getParameter("fest_m_status".trim()));
				if (fest_m_status == null || fest_m_status.trim().length() == 0) {
					errorMsgs.add("暱稱請勿空白");
				}
				
				// 12.暱稱
				String fest_m_kind = new String(req.getParameter("fest_m_kind".trim()));
				if (fest_m_kind == null || fest_m_kind.trim().length() == 0) {
					errorMsgs.add("暱稱請勿空白");
				}
				
				// 12.暱稱
				String chef_ID = new String(req.getParameter("chef_ID".trim()));
				if (chef_ID == null || chef_ID.trim().length() == 0) {
					errorMsgs.add("暱稱請勿空白");
				}
				// 13.圖片
				byte[] fest_m_pic = null;
//				File pic = new File(req.getParameter("cust_pic".trim()));
//				FileInputStream fis = null;
//				ByteArrayOutputStream baos = null;
//
//				byte[] cust_pic = null;
//				try {
//					fis = new FileInputStream(pic);
//					cust_pic = new byte[fis.available()];
//				} catch (FileNotFoundException e) {
//					e.printStackTrace();
//				} catch (IOException e) {
//					e.printStackTrace();
//				} finally {
//					if (fis != null) {
//						try {
//							fis.close();
//						} catch (IOException e) {
//							e.printStackTrace();
//						}
//					}
//				}

//				String saveDirectory = "/images_uploaded";
//				req.setCharacterEncoding("Big5"); // 處理中文檔名
//				res.setContentType("text/html; charset=Big5");
//				PrintWriter out = res.getWriter();
//
//				String realPath = getServletContext().getRealPath(saveDirectory);
//
//				File fsaveDirectory = new File(req.getParameter("cust_pic".trim()));
//				if (!fsaveDirectory.exists())
//					fsaveDirectory.mkdirs(); // 於 ContextPath 之下,自動建立目地目錄
//
//				Collection<Part> parts = req.getParts(); // Servlet3.0新增了Part介面，讓我們方便的進行檔案上傳處理
//				out.write("<h2> Total parts : " + parts.size() + "</h2>");
//				
//				for (Part part : parts) {
//					if (getFileNameFromPart(part) != null && part.getContentType() != null) {
//						out.println("<PRE>");
//						String name = part.getName();
//						String filename = getFileNameFromPart(part);
//						String ContentType = part.getContentType();
//						long size = part.getSize();
//						File f = new File(fsaveDirectory, filename);
//
//						// 利用File物件,寫入目地目錄,上傳成功
//						part.write(f.toString());
//
//						// 額外測試 InputStream 與 byte[] (幫將來model的VO預作準備)
//						InputStream in = part.getInputStream();
//						cust_pic = new byte[in.available()];
//						in.read(cust_pic);
//						in.close();
//
//					}
//				}
				
				// 2.密碼
				String cust_pwd = req.getParameter("cust_pwd");
				String cust_pwdReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,15}$";
				if (cust_pwd == null || cust_pwd.trim().length() == 0) {
					errorMsgs.add("會員密碼: 請勿空白");
				} else if (!cust_pwd.trim().matches(cust_pwdReg)) {
					errorMsgs.add(cust_pwd);
				}

				// "會員密碼: 至少有一個數字, 至少有一個大寫或小寫英文字母 , 且長度必需在6到15之間"

				// 3.帳號
				String cust_acc = req.getParameter("cust_acc");
				String cust_accReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,15}$$";
				if (cust_acc == null || cust_acc.trim().length() == 0) {
					errorMsgs.add("會員帳號: 請勿空白");
				} else if (!cust_acc.trim().matches(cust_accReg)) {
					errorMsgs.add("會員帳號: 只能是英文字母開頭, 且長度必需在5到15之間");
				}

				// 4.姓別
				String cust_sex = new String(req.getParameter("cust_sex".trim()));
				if (cust_sex == null || cust_sex.trim().length() == 0) {
					errorMsgs.add("姓別請勿空白");
				}

				// 5.電話
				String cust_tel = new String(req.getParameter("cust_tel".trim()));
				if (cust_tel == null || cust_tel.trim().length() == 0) {
					errorMsgs.add("電話請勿空白");
				}

				// 6.地址
				String cust_addr = new String(req.getParameter("cust_addr".trim()));
				if (cust_addr == null || cust_addr.trim().length() == 0) {
					errorMsgs.add("地址請勿空白");
				}

				// 7.身分證字號
				String cust_pid = new String(req.getParameter("cust_pid".trim()));
				if (cust_pid == null || cust_pid.trim().length() == 0) {
					errorMsgs.add("身分證字號請勿空白");
				}

				// 8.e-mail
				String cust_mail = new String(req.getParameter("cust_mail".trim()));
				if (cust_mail == null || cust_mail.trim().length() == 0) {
					errorMsgs.add("e-mail請勿空白");
				}

				// 9.生日
				java.sql.Date cust_brd = null;
				try {
					cust_brd = java.sql.Date.valueOf(req.getParameter("cust_brd").trim());
				} catch (IllegalArgumentException e) {
					cust_brd = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				// 10.註冊日
				// 註冊日期
				SimpleDateFormat setDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				/*
				 * 時：分：秒 HH:mm:ss HH : 23小時制 (0-23) kk : 24小時制 (1-24) hh : 12小時制 (1-12) KK :
				 * 11小時制 (0-11)
				 */
				String xx = setDateFormat.format(Calendar.getInstance().getTime());
				java.sql.Date cust_reg = java.sql.Date.valueOf(xx);

				// 11.狀態
				String cust_status = "a0";

				// 12.暱稱
				String cust_niname = new String(req.getParameter("cust_niname".trim()));
				if (cust_niname == null || cust_niname.trim().length() == 0) {
					errorMsgs.add("暱稱請勿空白");
				}

				// 13.圖片
				byte[] cust_pic = null;
//				File pic = new File(req.getParameter("cust_pic".trim()));
//				FileInputStream fis = null;
//				ByteArrayOutputStream baos = null;
//
//				byte[] cust_pic = null;
//				try {
//					fis = new FileInputStream(pic);
//					cust_pic = new byte[fis.available()];
//				} catch (FileNotFoundException e) {
//					e.printStackTrace();
//				} catch (IOException e) {
//					e.printStackTrace();
//				} finally {
//					if (fis != null) {
//						try {
//							fis.close();
//						} catch (IOException e) {
//							e.printStackTrace();
//						}
//					}
//				}

//				String saveDirectory = "/images_uploaded";
//				req.setCharacterEncoding("Big5"); // 處理中文檔名
//				res.setContentType("text/html; charset=Big5");
//				PrintWriter out = res.getWriter();
//
//				String realPath = getServletContext().getRealPath(saveDirectory);
//
//				File fsaveDirectory = new File(req.getParameter("cust_pic".trim()));
//				if (!fsaveDirectory.exists())
//					fsaveDirectory.mkdirs(); // 於 ContextPath 之下,自動建立目地目錄
//
//				Collection<Part> parts = req.getParts(); // Servlet3.0新增了Part介面，讓我們方便的進行檔案上傳處理
//				out.write("<h2> Total parts : " + parts.size() + "</h2>");
//				
//				for (Part part : parts) {
//					if (getFileNameFromPart(part) != null && part.getContentType() != null) {
//						out.println("<PRE>");
//						String name = part.getName();
//						String filename = getFileNameFromPart(part);
//						String ContentType = part.getContentType();
//						long size = part.getSize();
//						File f = new File(fsaveDirectory, filename);
//
//						// 利用File物件,寫入目地目錄,上傳成功
//						part.write(f.toString());
//
//						// 額外測試 InputStream 與 byte[] (幫將來model的VO預作準備)
//						InputStream in = part.getInputStream();
//						cust_pic = new byte[in.available()];
//						in.read(cust_pic);
//						in.close();
//
//					}
//				}

				// set
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

				// 如果以上格式有錯
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("custVO", custVO);// 以下練習正則(規)表示式(regular-expression)
					RequestDispatcher failureView = req.getRequestDispatcher("/cust/addCust.jsp");

					failureView.forward(req, res);
					return;
				}

//			
				CustService custSvc = new CustService();

				custVO = custSvc.addCust(cust_acc, cust_pwd, cust_name, cust_sex, cust_tel, cust_addr, cust_pid,
						cust_mail, cust_brd, cust_reg, cust_pic, cust_status, cust_niname);
//				custVO = custSvc.addCust("C0055", "dddd", cust_name, "f", "050505", "8888", "H123456789", "@54564", cust_brd, cust_reg,by , "c","ff" );

				String url = "/front-end/cust/listAllCust.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/cust/addCust.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("cust_ID");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入會員編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/cust/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				String cust_ID = null;
				try {
					cust_ID = new String(str);
				} catch (Exception e) {
					errorMsgs.add("會員編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/cust/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				CustService custSvc = new CustService();
				CustVO custVO = custSvc.getOneCust(cust_ID);
				if (custVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/cust/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("custVO", custVO); // 資料庫取出的custVO物件,存入req
				String url = "/front-end/cust/listOneCust.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneCust.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front/cust/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String cust_ID = new String(req.getParameter("cust_ID"));

				/*************************** 2.開始查詢資料 ****************************************/
				CustService custSvc = new CustService();
				CustVO custVO = custSvc.getOneCust(cust_ID);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("custVO", custVO); // 資料庫取出的custVO物件,存入req
				String url = "/front-end/cust/update_cust_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_cust_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/cust/listAllCust.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_cust_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				// 1.姓名
				String cust_name = req.getParameter("cust_name");
				String cust_nameReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (cust_name == null || cust_name.trim().length() == 0) {
					errorMsgs.add("會員姓名: 請勿空白");
				} else if (!cust_name.trim().matches(cust_nameReg)) {
					errorMsgs.add("會員姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}

				// 2.密碼
				String cust_pwd = req.getParameter("cust_pwd");
				String cust_pwdReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (cust_pwd == null || cust_pwd.trim().length() == 0) {
					errorMsgs.add("會員密碼: 請勿空白");
				} else if (!cust_pwd.trim().matches(cust_pwdReg)) {
					errorMsgs.add("會員密碼: 至少有一個數字, 至少有一個大寫或小寫英文字母 , 且長度必需在6到15之間");
				}

				// 3.帳號
				String cust_acc = req.getParameter("cust_acc");
				String cust_accReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (cust_acc == null || cust_acc.trim().length() == 0) {
					errorMsgs.add("會員帳號: 請勿空白");
				} else if (!cust_acc.trim().matches(cust_accReg)) {
					errorMsgs.add("會員帳號: 只能是英文字母、數字, 且長度必需在6到15之間");
				}

				// 4.姓別
				String cust_sex = new String(req.getParameter("cust_sex".trim()));
				if (cust_sex == null || cust_sex.trim().length() == 0) {
					errorMsgs.add("姓別請勿空白");
				}

				// 5.電話
				String cust_tel = new String(req.getParameter("cust_tel".trim()));
				if (cust_tel == null || cust_tel.trim().length() == 0) {
					errorMsgs.add("電話請勿空白");
				}

				// 6.地址
				String cust_addr = new String(req.getParameter("cust_addr".trim()));
				if (cust_addr == null || cust_addr.trim().length() == 0) {
					errorMsgs.add("地址請勿空白");
				}

				// 7.身分證字號
				String cust_pid = new String(req.getParameter("cust_pid".trim()));
				if (cust_pid == null || cust_pid.trim().length() == 0) {
					errorMsgs.add("身分證字號請勿空白");
				}

				// 8.e-mail
				String cust_mail = new String(req.getParameter("cust_mail".trim()));
				if (cust_mail == null || cust_mail.trim().length() == 0) {
					errorMsgs.add("e-mail請勿空白");
				}

				// 9.生日
				java.sql.Date cust_brd = null;
				try {
					cust_brd = java.sql.Date.valueOf(req.getParameter("cust_brd").trim());
				} catch (IllegalArgumentException e) {
					cust_brd = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				// 10.註冊日
				// 註冊日期
				SimpleDateFormat setDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				/*
				 * 時：分：秒 HH:mm:ss HH : 23小時制 (0-23) kk : 24小時制 (1-24) hh : 12小時制 (1-12) KK :
				 * 11小時制 (0-11)
				 */
				String xx = setDateFormat.format(Calendar.getInstance().getTime());
				java.sql.Date cust_reg = java.sql.Date.valueOf(xx);

				// 11.狀態
				String cust_status = new String(req.getParameter("cust_status".trim()));
				if (cust_status == null || cust_status.trim().length() == 0) {
					errorMsgs.add("暱稱請勿空白");
				}

				// 12.暱稱
				String cust_niname = new String(req.getParameter("cust_niname".trim()));
				if (cust_niname == null || cust_niname.trim().length() == 0) {
					errorMsgs.add("暱稱請勿空白");
				}

				// 13.圖片

				byte[] cust_pic = null;

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

//				 如果以上格式有錯
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("custVO", custVO);// 以下練習正則(規)表示式(regular-expression)
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/cust/update_cust_input.jsp");

					failureView.forward(req, res);
					return;
				}

				CustService custSvc = new CustService();

				custVO = custSvc.addCust(cust_acc, cust_pwd, cust_name, cust_sex, cust_tel, cust_addr, cust_pid,
						cust_mail, cust_brd, cust_reg, cust_pic, cust_status, cust_niname);
//				custVO = custSvc.addCust("C0055", "dddd", cust_name, "f", "050505", "8888", "H123456789", "@54564", cust_brd, cust_reg,by , "c","ff" );
				req.setAttribute("custVO", custVO);
				String url = "/front-end/cust/listOneCust.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/cust/update_cust_input.jsp");
				failureView.forward(req, res);
			}

		}
		if ("delete".equals(action)) { // 來自listAllCust.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				String cust_ID = new String(req.getParameter("cust_ID"));

				/*************************** 2.開始刪除資料 ***************************************/
				CustService custSvc = new CustService();
				custSvc.deleteCust(cust_ID);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/cust/listAllCust.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/cust/listAllCust.jsp");
				failureView.forward(req, res);
			}
		}

	}

	// 取出上傳的檔案名稱 (因為API未提供method,所以必須自行撰寫)by 吳神
	public String getFileNameFromPart(Part part) {
		String header = part.getHeader("content-disposition");

		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();

		if (filename.length() == 0) {
			return null;
		}
		return filename;
	}
}