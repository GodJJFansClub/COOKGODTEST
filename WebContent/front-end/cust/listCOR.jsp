<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="foodOrSvc" class="com.foodOrder.model.FoodOrderService"/>
<html>
<head>
</head>
<body>
	<jsp:include page="/froTempl/header.jsp" flush="true" />
	<section class="contact-area section-padding-100">
		<table class="table table-striped">
		  <thead>
		    <tr>
		      <th scope="col">訂單編號</th>
			  <th scope="col">顧客姓名</th>
			  <th scope="col">收件人姓名</th>
			  <th scope="col">訂單狀態</th>
			  <th scope="col">下訂日期</th>
			 <th scope="col">出貨日期</th>
							<th scope="col">到貨日期</th>
							<th scope="col">完成日期</th>
							<th scope="col">收件地址</th>
							<th scope="col">收件人電話</th>
							<th scope="col">總計</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach var="foodOrderVO" items="${foodOrdSvc.getFoodOrdersByCust(custVO.cust_ID)}" >
		    <tr>
		      <td scope="col">${foodOrderVO.food_or_ID}</td>
			  <td scope="col">${custSvc.getOneCust(foodOrderVO.cust_ID).cust_name}</td>
			  <td scope="col">${foodOrderVO.food_or_name}</td>
								<td scope="col">${mallOrStatusMap[foodOrderVO.food_or_status]}</td>
								<td scope="col">${foodOrderVO.food_or_start}</td>
								<td scope="col">${foodOrderVO.food_or_send}</td>
								<td scope="col">${foodOrderVO.food_or_rcv}</td>
								<td scope="col">${foodOrderVO.food_or_end}</td>
								<td scope="col">${foodOrderVO.food_or_addr}</td>
								<td scope="col">${foodOrderVO.food_or_tel}</td>
		    </tr>
		    </c:forEach>
		</table>
	</section>
	<jsp:include page="/froTempl/footer.jsp" flush="true" />
</body>
</html>