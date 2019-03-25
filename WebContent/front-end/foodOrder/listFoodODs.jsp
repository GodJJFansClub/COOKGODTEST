<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="foodOrderSvc" class="com.foodOrder.model.FoodOrderService"/>
<jsp:useBean id="foodSupSvc" class="com.foodSup.model.FoodSupService"/>
<jsp:useBean id="foodSvc" class="com.food.model.FoodService"/>
<jsp:useBean id="foodMallSvc" class="com.foodMall.model.FoodMallService"/>
<html>
<head>
<title></title>
	<style type="text/css">
		*{
	    margin: 0;
	    padding: 0;
		}
		.rate {
		    float: left;
		    height: 46px;
		    padding: 0 10px;
		}
		.rate:not(:checked) > input {
		    position:absolute;
		    top:-9999px;
		}
		.rate:not(:checked) > label {
		    float:right;
		    width:1em;
		    overflow:hidden;
		    white-space:nowrap;
		    cursor:pointer;
		    font-size:30px;
		    color:#ccc;
		}
		.rate:not(:checked) > label:before {
		    content: '★ ';
		}
		.rate > input:checked ~ label {
		    color: #ffc700;    
		}
		.rate:not(:checked) > label:hover,
		.rate:not(:checked) > label:hover ~ label {
		    color: #deb217;  
		}
		.rate > input:checked + label:hover,
		.rate > input:checked + label:hover ~ label,
		.rate > input:checked ~ label:hover,
		.rate > input:checked ~ label:hover ~ label,
		.rate > label:hover ~ input:checked ~ label {
		    color: #c59b08;
		}
	</style>
</head>
<body>
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
			<th>標題</th>
			<th>食材供應商名稱</th>
			<th>食材名稱</th>
			<th>數量</th>
			<th>小計</th>
			<th>評價</th>
			<th>留言</th>
			<th></th>
		</tr>
		
		<c:forEach var="foodOrDetailVO" items="${foodODVOset}">
			<form method="<%=request.getContextPath()%>/foodOrDetail/foodOrDetail.do" method="post">
				<tr>
					<td>${foodMallSvc.getOneFoodMall(foodOrDetailVO.food_sup_ID, foodOrDetailVO.food_ID).food_m_name}</td>
					<td>${foodSupSvc.getOneFoodSup(foodOrDetailVO.food_sup_ID).food_sup_name}</td>
					<td>${foodSvc.getOneFood(foodOrDetailVO.food_ID).food_name}</td>
					<td>${foodOrDetailVO.food_od_qty}</td>
					<td>${foodOrDetailVO.food_od_stotal}</td>
					<td>
						<div class="rate">
						<% for(int i = 1; i <= 5; i++){ %>
							<input type="radio" id="star${i}" name="rate" value="${i}"
								${(foodOrDetailVO.food_od_rate == i)?'checked':''}/>
							<label for="star${i}" title="text">${i} stars</label>				
						<% } %>
						</div>
					</td>
					<td>${foodOrDetailVO.food_od_msg}
					</td>
					<td>
						<c:choose>
							<c:when test="${foodOrderVO.food_or_status == 'o4'}">
								<button type="submit">送出評價及留言</button>
								<input type="hidden" name="food_or_ID" value="${foodOrDetailVO.food_or_ID}">
								<input type="hidden" name="food_ID" value="${foodOrDetailVO.food_ID}">
								<input type="hidden" name="food_sup_ID" value="${foodOrDetailVO.food_sup_ID}">
								<input type="hidden" name="action" value="custUpODRateS">
							</c:when>
							<c:otherwise>
								訂單尚未完成無法評價及留言
							</c:otherwise>
						</c:choose>	
					</td>
				</tr>
			</form>
		</c:forEach>
		
	</table>
</body>
</html>