<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.fun.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Fun: Home</title>

<style>
table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
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

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td><h3>IBM Fun: Home</h3>
				<h4>( MVC )</h4></td>
		</tr>
	</table>

	<p>This is the Home page forFun: Home</p>

	<h3>資料查詢:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<ul>
		<li><a
			href='<%=request.getContextPath()%>/back-end/fun/listAllFun.jsp'>List</a>
			all Fun. <br>
		<br></li>


		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/fun/fun.do">
				<b>輸入權限編號:</b> <input type="text" name="fun_ID"> <input
					type="hidden" name="action" value="getOne_For_Display"> <input
					type="submit" value="送出">
			</FORM>
		</li>

		<jsp:useBean id="funSvc" scope="page"
			class="com.fun.model.FunService" />

		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/fun/fun.do">
				<b>選擇權限編號:</b> <select size="1" name="fun_ID">
					<c:forEach var="funVO" items="${funSvc.all}">
						<option value="${funVO.fun_ID}">${funVO.fun_ID}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>

		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/fun/fun.do">
				<b>選擇權限名稱:</b> <select size="1" name="fun_ID">
					<c:forEach var="funVO" items="${funSvc.all}">
						<option value="${funVO.fun_ID}">${funVO.fun_name}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
	</ul>


	<h3>權限管理</h3>

	<ul>
		<li><a href='addFun.jsp'>Add</a> a new Fun.</li>
	</ul>

</body>
</html>