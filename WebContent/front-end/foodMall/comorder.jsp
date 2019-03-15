<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="custSvc" class="com.cust.model.CustService"/>
<jsp:useBean id="foodOrderSvc" class="com.foodOrder.model.FoodOrderService"/>
<html>
<head>
<title>單一食材商城訂單</title>
</head>
<body>
	<jsp:include page="/froTempl/header.jsp" flush="true" />

	 <!-- ##### Contact Area Start #####-->
    <section class="contact-area section-padding-100">
			<%-- 錯誤表列 --%>
			<c:if test="${not empty errorMsgs}">
				<font style="color:red">請修正以下錯誤:</font>
				<ul>
				    <c:forEach var="message" items="${errorMsgs}">
						<li style="color:red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">食材訂單編號</th>
			      <th scope="col">食材供應商</th>
			      <th scope="col">食材名稱</th>
			      <th scope="col">訂單開始</th>
			      <th scope="col">訂單狀態</th>
			      <th scope="col">出貨日期</th>
			      <th scope="col">到貨日期</th>
			    </tr>
			  </thead>
			  <tbody>
			  </tbody>
			 </table>
            

	</section>
    <!-- ##### Contact Area End #####-->

	<jsp:include page="/froTempl/footer.jsp" flush="true" />
</body>
</html>