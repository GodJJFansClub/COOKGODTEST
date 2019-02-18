<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cust.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    CustService custSvc = new CustService();
    List<CustVO> list = custSvc.getAll();;
    pageContext.setAttribute("list",list);
%>


<!DOCTYPE html>
<html>
<head>
<title>所有會員資料 - listAllCust.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有會員資料 - listAllCust.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>會員編號</th>
		<th>會員帳號</th>
		<th>會員密碼</th>
		<th>會員姓名</th>
		<th>會員姓別</th>
		<th>會員電話</th>
		<th>會員地址</th>
		<th>會員身份證字號</th>
		<th>email</th>
		<th>會員生日</th>
		<th>會員註冊日</th>
		<th>大頭照</th>
		<th>會員狀態</th>
		<th>會員暱稱</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="custVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${custVO.cust_ID}</td>
			<td>${custVO.cust_acc}</td>
			<td>${custVO.cust_pwd}</td>
			<td>${custVO.cust_name}</td>
			<td>${custVO.cust_sex}</td>
			<td>${custVO.cust_tel}</td>
			<td>${custVO.cust_addr}</td>
			<td>${custVO.cust_pid}</td>
			<td>${custVO.cust_mail}</td>
			<td>${custVO.cust_brd}</td>
			<td>${custVO.cust_reg}</td>
			<td>${custVO.cust_pic}</td>
			<td>${custVO.cust_status}</td>
			<td>${custVO.cust_niname}</td>
						
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/cust/cust.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="cust_ID"  value="${custVO.cust_ID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/cust/cust.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="cust_ID"  value="${custVO.cust_ID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>