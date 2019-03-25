<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.festOrder.model.*"%>

<%
	FestOrderVO festOrderVO = (FestOrderVO) request.getAttribute("festOrderVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>查詢一筆節慶主題料理訂單(FestOrder) - listOneFestOrder.jsp</title>

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
<jsp:include page="/froTempl/header.jsp" flush="true" />
<!-- ##### Contact Area Start #####-->
<section class="contact-area section-padding-100">
<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Section Heading -->
				<div class="section-heading text-center wow fadeInUp"
					data-wow-delay="100ms">
					<h2>Get In Touch</h2>
					<img src="img/core-img/x.png" alt="">
				</div>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-12 col-lg-8">
				<!-- Contact Form -->
				<div class="contact-form-area text-center">
					<form
						action="<%=request.getContextPath()%>/festOrderDetail/festOrderDetail.do"
						method="post">
						<c:if test="${not empty errorMsgs}">
							<font style="color: red"></font>
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li style="color: red">${message}</li>
								</c:forEach>
							</ul>
						</c:if>
<body bgcolor='white'>


	<table id="table-1">
		<tr>
			<td>
				<h3>節慶主題料理訂單資料 - ListOneFestOrder.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/back-end/festOrder/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>訂單編號</th>
			<th>訂單狀態</th>
			<th>價格</th>
			<th>訂單成立日期</th>
			<th>出貨日期</th>
			<th>訂單結束日期</th>
<!-- 			<th>折扣</th> -->
			<th>會員編號</th>
		</tr>
		<tr>
			<td><%=festOrderVO.getFest_or_ID()%></td>
			<td><%=festOrderVO.getFest_or_status()%></td>
			<td><%=festOrderVO.getFest_or_price()%></td>
			<td><%=festOrderVO.getFest_or_start()%></td>
			<td><%=festOrderVO.getFest_or_send()%></td>
			<td><%=festOrderVO.getFest_or_end()%></td>
<%-- 			<td><%=festOrderVO.getFest_or_disc()%></td> --%>
			<td><%=festOrderVO.getCust_ID()%></td>
		</tr>
	</table>
</section>
<jsp:include page="/froTempl/footer.jsp" flush="true" />
</body>
</html>