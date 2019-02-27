<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.auth.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	AuthService authSvc = new AuthService();
	List<AuthVO> list = authSvc.getAll();
	;
	pageContext.setAttribute("list", list);
%>


<!DOCTYPE html>
<html>
<head>
<title>所有權限資料 - listAllAuth.jsp</title>

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
	width: 500px;
	background-color: white;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 10px;
	text-align: center;
}
</style>

</head>
<body bgcolor='white'>

	<h4>此頁練習採用 EL 的寫法取值:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>所有權限資料 - listAllAuth.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/back-end/auth/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<table>
		<tr>
			<th>員工名稱</th>
			<th>權限名稱</th>
			
			
			
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="authVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">

			<tr>
				<td>${authVO.emp_ID}->${empSvc.getOneEmp(authVO.emp_ID).emp_name}</td>
				
				<td>${authVO.fun_ID}->${funSvc.getOneFun(authVO.fun_ID).fun_name}</td>
				
			
			
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/auth/auth.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="emp_ID" value="${authVO.emp_ID}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/auth/auth.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="emp_ID" value="${authVO.emp_ID}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>

</body>
</html>