package com.ad.controller;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.servlet.http.Part;

import com.ad.model.*;


@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class AdServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doPost(req, res);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		// 新增
		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				// 1.廣告標題
				String ad_title = req.getParameter("ad_title");
				String ad_titleReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (ad_title == null || ad_title.trim().length() == 0) {
					errorMsgs.add("廣告標題: 請勿空白");
				} else if (!ad_title.trim().matches(ad_titleReg)) {
					errorMsgs.add(ad_title);
				}
				 

				// 2.廣告內文
				String ad_con = req.getParameter("ad_con");
				
				

				// 3.廣告上架日期
				java.sql.Date ad_start = null;
				try {
					ad_start = java.sql.Date.valueOf(req.getParameter("ad_start").trim());
				} catch (IllegalArgumentException e) {
					ad_start = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				// 4.廣告下架日期
				java.sql.Date ad_end = null;
				try {
					ad_end = java.sql.Date.valueOf(req.getParameter("ad_end").trim());
				} catch (IllegalArgumentException e) {
					ad_end = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				
				// 5.狀態
				String ad_status = "d2";

				// 6.廣告類別
				String ad_type =req.getParameter("ad_type").trim();
				if (ad_type == null || ad_type.trim().length() == 0) {
					errorMsgs.add("暱稱請勿空白");
				}
				//7.
				String food_sup_ID =req.getParameter("food_sup_ID").trim();
				

				// set
				AdVO adVO = new AdVO();
				adVO.setAd_title(ad_title);
				adVO.setAd_con(ad_con);
				adVO.setAd_start(ad_start);
				adVO.setAd_end(ad_end);
				adVO.setAd_status(ad_status);
				adVO.setAd_type(ad_type);
				adVO.setFood_sup_ID(food_sup_ID);
				
				
				

				// 如果以上格式有錯
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("adVO", adVO);// 以下練習正則(規)表示式(regular-expression)
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/ad/addAd.jsp");

					failureView.forward(req, res);
					return;
				}

				//將資料加入資料庫
				AdService adSvc = new AdService();

				adVO = adSvc.addAd(ad_title, ad_start, ad_status, ad_niname);
				String url = "/front-end/ad/listAllAd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				//除錯
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/ad/addAd.jsp");
				failureView.forward(req, res);
			}
		}
		
		// 查詢-單一
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("ad_ID");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入顧客編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/ad/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				String ad_ID = null;
				try {
					ad_ID = new String(str);
				} catch (Exception e) {
					errorMsgs.add("顧客編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/ad/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				AdService adSvc = new AdService();
				AdVO adVO = adSvc.getOneAd(ad_ID);
				if (adVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/ad/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("adVO", adVO); // 資料庫取出的adVO物件,存入req
				String url = "/front-end/ad/listOneAd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneAd.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/ad/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		// 查詢-全部
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String ad_ID = new String(req.getParameter("ad_ID"));

				/*************************** 2.開始查詢資料 ****************************************/
				AdService adSvc = new AdService();
				AdVO adVO = adSvc.getOneAd(ad_ID);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("adVO", adVO); // 資料庫取出的adVO物件,存入req
				String url = "/front-end/ad/update_ad_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_ad_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/ad/listAllAd.jsp");
				failureView.forward(req, res);
			}
		}

		// 修改
		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				
				//0.id
				String ad_ID = new String(req.getParameter("ad_ID").trim());
				// 1.姓名
				String ad_title = req.getParameter("ad_title");
				String ad_titleReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (ad_title == null || ad_title.trim().length() == 0) {
					errorMsgs.add("顧客姓名: 請勿空白");
				} else if (!ad_title.trim().matches(ad_titleReg)) {
					errorMsgs.add(ad_title);
				}
				// "顧客姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間"

				// 2.密碼
				String ad_pwd = req.getParameter("ad_pwd");
				String ad_pwdReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,15}$";
				if (ad_pwd == null || ad_pwd.trim().length() == 0) {
					errorMsgs.add("顧客密碼: 請勿空白");
				} else if (!ad_pwd.trim().matches(ad_pwdReg)) {
					errorMsgs.add(ad_pwd);
				}
				
				
				// "顧客密碼: 至少有一個數字, 至少有一個大寫或小寫英文字母 , 且長度必需在6到15之間"

				// 3.帳號
				String ad_acc = req.getParameter("ad_acc");
				String ad_accReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{2,15}$";
				if (ad_acc == null || ad_acc.trim().length() == 0) {
					errorMsgs.add("顧客帳號: 請勿空白");
				} else if (!ad_acc.trim().matches(ad_accReg)) {
					errorMsgs.add("顧客帳號: 只能是英文字母開頭, 且長度必需在5到15之間");
				}

				// 4.性別
				String ad_sex =req.getParameter("ad_sex");
				if (ad_sex == null || ad_sex.length() == 0) {
					errorMsgs.add("性別請勿空白");
				}

				// 5.電話
				String ad_tel =req.getParameter("ad_tel").trim();
				if (ad_tel == null || ad_tel.trim().length() == 0) {
					errorMsgs.add("電話請勿空白");
				}

				// 6.地址
				String ad_addr =req.getParameter("ad_addr").trim();
				if (ad_addr == null || ad_addr.trim().length() == 0) {
					errorMsgs.add("地址請勿空白");
				}

				// 7.身分證字號
				String ad_pid = new String(req.getParameter("ad_pid".trim()));
				if (ad_pid == null || ad_pid.trim().length() == 0) {
					errorMsgs.add("身分證字號請勿空白");
				}

				// 8.e-mail
				String ad_mail = new String(req.getParameter("ad_mail".trim()));
				if (ad_mail == null || ad_mail.trim().length() == 0) {
					errorMsgs.add("e-mail請勿空白");
				}

				// 9.生日
				java.sql.Date ad_start = null;
				try {
					ad_start = java.sql.Date.valueOf(req.getParameter("ad_start").trim());
				} catch (IllegalArgumentException e) {
					ad_start = new java.sql.Date(System.currentTimeMillis());
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
				java.sql.Date ad_reg = java.sql.Date.valueOf(xx);

				// 11.狀態
				String ad_status = new String(req.getParameter("ad_status".trim()));
				if (ad_status == null || ad_status.trim().length() == 0) {
					errorMsgs.add("狀態請勿空白");
				}
				// 12.暱稱
				String ad_niname = new String(req.getParameter("ad_niname".trim()));
				if (ad_niname == null || ad_niname.trim().length() == 0) {
					errorMsgs.add("暱稱請勿空白");
				}

				// 13.圖片
				byte[] ad_pic = null;
//				File pic = new File(req.getParameter("ad_pic".trim()));
//				FileInputStream fis = null;
//				ByteArrayOutputStream baos = null;
//
//				byte[] ad_pic = null;
//				try {
//					fis = new FileInputStream(pic);
//					ad_pic = new byte[fis.available()];
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

				String saveDirectory = "/images_uploaded";
				req.setCharacterEncoding("Big5"); // 處理中文檔名
				res.setContentType("text/html; charset=Big5");
//				PrintWriter out = res.getWriter();

				String realPath = getServletContext().getRealPath(saveDirectory);

				File fsaveDirectory = new File(realPath);
				if (!fsaveDirectory.exists())
					fsaveDirectory.mkdirs(); // 於 ContextPath 之下,自動建立目地目錄

				Collection<Part> parts = req.getParts(); // Servlet3.0新增了Part介面，讓我們方便的進行檔案上傳處理
//				out.write("<h2> Total parts : " + parts.size() + "</h2>");

				for (Part part : parts) {
					if (getFileNameFromPart(part) != null && part.getContentType() != null) {
//						out.println("<PRE>");

						// 利用File物件,寫入目地目錄,上傳成功
//						part.write(f.toString());

						// 額外測試 InputStream 與 byte[] (幫將來model的VO預作準備)
						InputStream in = part.getInputStream();
						byte[] buf = new byte[in.available()];
						in.read(buf);
						in.close();
						ad_pic = buf;

					}
				}

				// set
				AdVO adVO = new AdVO();
				adVO.setAd_acc(ad_acc);
				adVO.setAd_title(ad_title);
				adVO.setAd_pwd(ad_pwd);
				adVO.setAd_sex(ad_sex);
				adVO.setAd_tel(ad_tel);
				adVO.setAd_addr(ad_addr);
				adVO.setAd_pid(ad_pid);
				adVO.setAd_mail(ad_mail);
				adVO.setAd_start(ad_start);
				adVO.setAd_reg(ad_reg);
				adVO.setAd_pic(ad_pic);
				adVO.setAd_status(ad_status);
				adVO.setAd_niname(ad_niname);

				// 如果以上格式有錯
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("adVO", adVO);// 以下練習正則(規)表示式(regular-expression)
					RequestDispatcher failureView = req.getRequestDispatcher("/ad/update_ad_input.jsp");

					failureView.forward(req, res);
					return;
				}

//				/***************************2.開始修改資料*****************************************/
				AdService adSvc = new AdService();

				adVO = adSvc.updateAd(ad_ID, ad_acc, ad_pwd, ad_title, ad_sex, ad_tel, ad_addr,
						ad_pid, ad_mail, ad_start, ad_reg, ad_pic, ad_status, ad_niname);
//				adVO = adSvc.updateAd("C0055", "dddd", ad_title, "f", "050505", "8888", "H123456789", "@54564", ad_start, ad_reg,by , "c","ff" );
				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("adVO", adVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/front-end/ad/listOneAd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/ad/update_ad_input.jsp");
				failureView.forward(req, res);

			}
		}

		// 刪除
		if ("delete".equals(action)) { // 來自listAllAd.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				String ad_ID = new String(req.getParameter("ad_ID"));

				/*************************** 2.開始刪除資料 ***************************************/
				AdService adSvc = new AdService();
				adSvc.deleteAd(ad_ID);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/front-end/ad/listAllAd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/ad/listAllAd.jsp");
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