<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.foodOrder.model.*"%>
<%@ page import="com.foodOrDetail.model.FoodOrDetailVO" %>
<%@ page import="java.util.List" %>
<jsp:useBean id="foodOrderSvc" class="com.foodOrder.model.FoodOrderService"/>
<jsp:useBean id="custSvc" class="com.cust.model.CustService"/>
<%
	
	List<FoodOrderVO> list = foodOrderSvc.getAll();
	pageContext.setAttribute("list", list);
%>


<html>
<head>
<title></title>
</head>
<body>
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<jsp:include page="/back-endTemplate/header.jsp" flush="true"/>
		<aside class="left-sidebar" data-sidebarbg="skin5">
<%--==============<jsp:include page="/back-end/XXXX/sidebar.jsp" flush="true" />=================================--%>
			<jsp:include page="/back-end/foodOrder/sidebar.jsp" flush="true"/>
		</aside>
		<div class="page-wrapper">
			<div class="page-breadcrumb">
<%--=================================工作區================================================--%>
				<%-- 錯誤列表 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
				<div class="table-responsive">
					<table class="table">
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
						
						
						<%@ include file="/file/page1.file"%>
						<c:forEach var="foodOrderVO" items="${list}"  begin="<%=pageIndex%>"
						end="<%=pageIndex+rowsPerPage-1%>">
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
								<td scope="col">
									<c:set var="total" value="${0}"/>
										<c:forEach var="foodOrDetailVO" items="${foodOrderSvc.getFoodOrDetailsByFood_or_ID(foodOrderVO.food_or_ID)}">
											<c:set var="total" value="${total+foodOrDetailVO.food_od_stotal}"/>
										</c:forEach>
									${total}
								</td>
								<td>
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/foodOrder/foodOrder.do" >
										<input type="submit" value="修改">
										<input type="hidden" name="food_or_ID" value="${foodOrderVO.food_or_ID}">
										<input type="hidden" name="action" value="getOne_For_Udate">
									</FORM>
								</td>
							</tr>
						</c:forEach>
					</table>
					<%@ include file="/file/page2.file"%>
				</div>


<%--=================================工作區================================================--%>			
				<jsp:include page="/back-endTemplate/footer.jsp" flush="true" />
<%--=================================jQuery===============================================--%>
			</div>
		</div>
	</div>
</body>
</html>