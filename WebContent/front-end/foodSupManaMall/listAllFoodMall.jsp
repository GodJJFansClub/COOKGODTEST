<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.foodSup.model.*"%>
<%@page import="com.foodMall.model.*"%>
<%@page import="java.util.Set" %>
<%@page import="java.util.LinkedHashSet" %>

<jsp:useBean id="foodSupSvc" class="com.foodSup.model.FoodSupService"/>

<%
	String food_sup_ID = ((FoodSupVO) session.getAttribute("foodSupVO")).getFood_sup_ID();
	Set<FoodMallVO> list = foodSupSvc.getFoodMallsByFood_sup_ID(food_sup_ID);
	pageContext.setAttribute("list", list);
%>

<html>
<head>
	<title>供應商顯示所有食材商品 listAllFoodMall.jsp</title>
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
<body>
	<h4><a href="<%=request.getContextPath()%>/front-end/foodSupManaMall/select_page.jsp">回食材商城管理頁面</a></h4>
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
			<th>食材商編號</th>
			<th>食材編號</th>
			<th>食材商品名稱</th>
			<th>食材商品狀態</th>
			<th>價格</th>
			<th>單位</th>
			<th>產地</th>
			<th>圖片</th>
			<th>介紹</th>
			<th>評價</th>
		</tr>
		
		<%@ include file="/page/page1.file" %>
		<c:forEach var="foodMallVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<tr>
				<td>${foodMallVO.food_sup_ID}</td>
				<td>${foodMallVO.food_ID}</td>
				<td>${foodMallVO.food_m_name}</td>
				<td>${statusMapStr[foodMallVO.food_m_status]}</td>
				<td>${foodMallVO.food_m_price}</td>
				<td>${foodUnitMap[foodMallVO.food_m_unit]}</td>
				<td>${foodMallVO.food_m_place}</td>
				<%--<td><img src="data:image/png;base64,${foodMallVO.food_m_pic}"></td> --%>
				<td><img src="<%=request.getContextPath()%>/foodSupManaMall/foodSupManaMall.do?food_sup_ID=${foodMallVO.food_sup_ID}&food_ID=${foodMallVO.food_ID}"></td>
				<td>${foodMallVO.food_m_resume}</td>
				<td>${foodMallVO.food_m_rate}</td>
			
				<td>
					<form method="post" action="<%=request.getContextPath()%>/foodSupManaMall/foodSupManaMall.do">
						<input type="submit" value="修改">
						<input type="hidden" value="food_ID" value="${foodMallVO.food_ID}">
						<input type="hidden" name="action" value="getOne_For_Update">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="/page/page2.file" %>
</body>
</html>