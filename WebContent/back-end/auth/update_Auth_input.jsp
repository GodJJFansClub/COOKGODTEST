<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.auth.model.*"%>

<%
	AuthVO authVO = (AuthVO) request.getAttribute("authVO"); //AuthServlet.java (Concroller) 存入req的authVO物件 (包括幫忙取出的authVO, 也包括輸入資料錯誤時的authVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>權限資料修改 - update_auth_input.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>權限資料修改 - update_auth_input.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/back-end/auth/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料修改:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/auth/auth.do"
		name="form1" enctype="multipart/form-data">
		<table>
			<tr>
				<td>權限編號:<font color=red><b>*</b></font></td>
				<td><%=authVO.getEmp_ID()%></td>
			</tr>
			
			<tr>
				<td>權限名稱:</td>
				<td><input type="TEXT" name="fun_ID" size="45"
					value="<%=authVO.getFun_ID()%>" /></td>
			</tr>

			


		</table>
		<div id="localImag">
			<img id="preview" width=-1 height=-1 style="diplay: none" />
		</div>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="emp_ID" value="<%=authVO.getEmp_ID()%>">
		<input type="submit" value="送出修改">
	</FORM>
</body>


<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>




</html>