<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dishFood.model.*"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="foodSvc" scope="page" class="com.food.model.FoodService"/>
<jsp:useBean id="dishSvc" scope="page" class="com.dish.model.DishService"/>
<jsp:useBean id="dishFoodSvc" scope="page" class="com.dishFood.model.DishFoodService" />
<jsp:useBean id="BroadSoc" scope="page" class="com.broadcast.controller.BroadcastWebSocket"/>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	List<DishFoodVO> listFoods_ByDish = (List<DishFoodVO>) request.getAttribute("listFoods_ByDish"); 
%>

<html>
<head>
<title>菜色食材資料 </title>

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


<table>	
		
		<tr><td colspan ="4">菜色名稱:<font color="red" size="5">${dishSvc.getOneDish(dishVO.dish_ID).dish_name}</font></td></tr>
		
	<tr>
	
		
		<th>食材名稱</th>
		<th>食材數量</th>
		<th>食材單位</th>
		
	</tr>
	
	<c:forEach var="dishFoodVO" items="${listFoods_ByDish}">
	<tr>
	
			
			<td>${foodSvc.getOneFood(dishFoodVO.food_ID).food_name}</td>
			<td>${dishFoodVO.dish_f_qty}</td>
			<td>${foodUnitMap[dishFoodVO.dish_f_unit]}</td>
			
	</tr>
	</c:forEach>
	<tr>
	<td colspan="3">
		 <h4><a href="<%=request.getContextPath()%>/back-end/dish/select_page.jsp">回首頁</a></h4>
	</td>
	</tr>
</table>

</body>
</html>