<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="foodMallSvc" class="com.foodMall.model.FoodMallService" />
<jsp:useBean id="foodSvc" class="com.food.model.FoodService" />
<jsp:useBean id="foodSupSvc" class="com.foodSup.model.FoodSupService" />

<html>
<head>
</head>
<body>
	<jsp:include page="/froTempl/header.jsp" flush="true" />
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">食材</th>
				<th scope="col">標題</th>
				<th scope="col">供應商</th>
				<th scope="col">數量</th>
				<th scope="col">小計</th>
				<th scope="col">
					<a href="<%=request.getContextPath()%>/front-end/foodOrder/addFoodOrder.jsp">確認結帳</a>
				</th>
			</tr>
		</thead>
		<tbody id="shopCartList">
			<c:set var="total" value="0"/>
			<c:forEach var="shopItem" items="${shoppingCart}">
				<tr class="shopItemTr">
					<td>${foodSvc.getOneFood(shopItem.food_ID).food_name}</td>
					<td>${foodMallSvc.getOneFoodMall(shopItem.food_sup_ID, shopItem.food_ID).food_m_name}</td>
					<td>${foodSupSvc.getOneFoodSup(shopItem.food_sup_ID).food_sup_name}</td>
					<td>${shopItem.food_od_qty}</td>
					<td>${shopItem.food_od_stotal}</td>
					<c:set var="total" value="${total+shopItem.food_od_stotal}"/>
				</tr>
			</c:forEach>
			<tr><td>${total}</td></tr>
		</tbody>
	</table>


	<jsp:include page="/froTempl/footer.jsp" flush="true" />
</body>
</html>