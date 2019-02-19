<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cust.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  CustVO custVO = (CustVO) request.getAttribute("custVO"); //SustServlet.java(Concroller), 存入req的custVO物件
%>

<html>
<head>
<title>會員資料 - listOneCust.jsp</title>

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
	width: 600px;
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

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>員工資料 - ListOneCust.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/front-end/cust/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

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
	<tr>
		<td><%=custVO.getCust_ID()%></td>
		<td><%=custVO.getCust_acc()%></td>
		<td><%=custVO.getCust_pwd()%></td>
		<td><%=custVO.getCust_name()%></td>
		<td><%=custVO.getCust_sex()%></td>
		<td><%=custVO.getCust_tel()%></td>
		<td><%=custVO.getCust_addr()%></td>
		<td><%=custVO.getCust_pid()%></td>
		<td><%=custVO.getCust_mail()%></td>
		<td><%=custVO.getCust_brd()%></td>
		<td><%=custVO.getCust_reg()%></td>
		<td><%=custVO.getCust_pic()%></td>
		<td><%=custVO.getCust_status()%></td>
		<td><%=custVO.getCust_niname()%></td>
		
	</tr>
</table>

</body>
</html>