<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.festOrder.model.*"%>
<jsp:useBean id="festOrderSvc" scope="page" class="com.festOrder.model.FestOrderService" />

<%
	festOrderSvc = new FestOrderService();
	List<FestOrderVO> list = festOrderSvc.getAll();
	pageContext.setAttribute("list", list);
%>


<html>
<head>
<title>List_All_FestOrder.jsp</title>

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
							<font style="color: red">請修正以下錯誤:</font>
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
				<h3>節慶主題料理訂單資料 - listAllFestOrder.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/back-end/festOrder/select_page.jsp">回首頁</a>
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
			<th>訂單編號</th>
			<th>訂單狀態</th>
			<th>價格</th>
			<th>訂單成立日期</th>
			<th>出貨日期</th>
			<th>訂單結束日期</th>
<!-- 			<th>折扣</th> -->
			<th>會員編號</th>
			<th>修改</th>
			<th>刪除</th>
			<th>送出查詢</th>
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="festOrderVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">

			<tr>
				<td>${festOrderVO.fest_or_ID}</td>
				<td>${festOrderVO.fest_or_status}</td>
				<td>${festOrderVO.fest_or_price}</td>
				<td>${festOrderVO.fest_or_start}</td>
				<td>${festOrderVO.fest_or_send}</td>
				<td>${festOrderVO.fest_or_end}</td>
<%-- 				<td>${festOrderVO.fest_or_disc}</td> --%>
				<td>${festOrderVO.cust_ID}</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/festOrder/festOrder.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="fest_or_ID" value="${festOrderVO.fest_or_ID}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/festOrder/festOrder.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="fest_or_ID" value="${festOrderVO.fest_or_ID}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/festOrder/festOrder.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="送出查詢"> <input type="hidden"
							name="fest_or_ID" value="${festOrderVO.fest_or_ID}"> <input
							type="hidden" name="action"
							value="listFestOrderDetail_ByFest_or_ID">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>

	<%
		if (request.getAttribute("listFestOrderDetail_ByFest_or_ID") != null) {
	%>
	<jsp:include
		page="/front-end/festOrder/listFestOrderDetail_ByFest_or_ID.jsp" />
	<%
		}
	%>
</section>
<jsp:include page="/froTempl/footer.jsp" flush="true" />
</body>
</html>