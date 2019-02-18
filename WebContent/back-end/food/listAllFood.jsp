<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.food.model.*" %>

<%
	FoodService foodSvc = new FoodService();
	List<FoodVO> list = foodSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<html>
<head>
	<title>所有食材資料 - listAllFood.jsp</title>
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
	<table id="table-1">
		<tr><td>
			<h3>所有食材資料 - listAllFood.jsp</h3>
			<h4><a href="<%=request.getContextPath()%>/back-end/food/select_page.jsp"><img src="<%=request.getContextPath()%>/images/back.gif" width="100" height="32" border="0">回首頁</a></h4>
		</td></tr>
	</table>
	<%-- 錯誤列表 --%>
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
			<th>食材編號</th>
			<th>食材名稱</th>
			<th>食材種類</th>
		</tr>
		<%@ include file="/back-end/food/page1.file" %>
		<c:forEach var="foodVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<tr>
				<td>${foodVO.food_ID}</td>
				<td>${foodVO.food_name}</td>
				<td>${foodVO.food_type}</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="/back-end/food/page2.file" %>
</body>
</html>