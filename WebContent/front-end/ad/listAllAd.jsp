<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ad.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	AdService adSvc = new AdService();
	List<AdVO> list = adSvc.getAll();
	;
	pageContext.setAttribute("list", list);
%>


<!DOCTYPE html>
<html>
<head>
<title>所有廣告資料 - listAllAd.jsp</title>

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
				<h3>所有廣告資料 - listAllAd.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/front-end/ad/select_page.jsp">回首頁</a>
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
			<th>廣告編號</th>
			<th>廣告帳號</th>
			<th>廣告密碼</th>
			<th>廣告姓名</th>
			<th>廣告性別</th>
			<th>廣告電話</th>
			<th>廣告地址</th>
			<th>廣告身份證字號</th>
			<th>E-mail</th>
			<th>廣告生日</th>
			<th>廣告註冊日</th>
			<th>大頭照</th>
			<th>廣告狀態</th>
			<th>廣告暱稱</th>
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="adVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">

			<tr>
				<td>${adVO.ad_ID}</td>
				<td>${adVO.ad_acc}</td>
				<td>${adVO.ad_pwd}</td>
				<td>${adVO.ad_title}</td>
				<c:if test="${adVO.ad_sex.equals('M')}" var="true"
					scope="session">
					<td>男生</td>
				</c:if>
				<c:if test="${adVO.ad_sex.equals('F')}" var="true"
					scope="session">
					<td>女生</td>
				</c:if>
				<td>${adVO.ad_tel}</td>
				<td>${adVO.ad_addr}</td>
				<td>${adVO.ad_pid}</td>
				<td>${adVO.ad_mail}</td>
				<td>${adVO.ad_start}</td>
				<td>${adVO.ad_reg}</td>
				<td><c:if test="${not empty adVO.ad_pic}"><img src="<%=request.getContextPath()%>/ad/ad.do?ad_ID=${adVO.ad_ID}"></c:if>
				    <c:if test="${empty adVO.ad_pic}"><img src="images/null2.jpg"></c:if></td>

				<c:if test="${adVO.ad_status.equals('a0')}" var="true"
					scope="session">
					<td>未停權</td>
				</c:if>
				<c:if test="${adVO.ad_status.equals('a1')}" var="true"
					scope="session">
					<td>停權</td>
				</c:if>
				<td>${adVO.ad_niname}</td>

				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/ad/ad.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="ad_ID" value="${adVO.ad_ID}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/ad/ad.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="ad_ID" value="${adVO.ad_ID}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>

</body>
</html>