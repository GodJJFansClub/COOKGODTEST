<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map" %>
<%@ page import="com.foodSup.model.*" %>
<jsp:useBean id="foodSupVO" scope="session" class="com.foodSup.model.FoodSupVO"/>
<% 	
	
	foodSupVO.setFood_sup_ID("C00012");
	

%>
<html>
<head>
<title>食材供應商食材商品管理頁面</title>
<style>
	table#table-1 {
		width: 450px;
		background-color: #CCCCFF;
		margin-top: 5px;
		margin-bottom: 10px;
	    border: 3px ridge Gray;
	    height: 80px;
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
</head>
<body>
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<jsp:include page="/back-endTemplate/header.jsp" flush="true"/>
		<aside class="left-sidebar" data-sidebarbg="skin5">
<%--==============<jsp:include page="/back-end/XXXX/sidebar.jsp" flush="true" />=================================--%>
		
		</aside>
		<div class="page-wrapper">
			<div class="page-breadcrumb">
<%--=================================工作區================================================--%>
	<h3>食材供應商食材管理</h3>
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
	</c:if>
	<ul>
		<li><a href='<%=request.getContextPath()%>/front-end/foodSupManaMall/listAllFoodMall.jsp'>顯示所有供應的食材</a></li>
		<%-- --%><jsp:useBean id="foodSupSvc" scope="page" class="com.foodSup.model.FoodSupService"/>
		<li>
			<form method="post" action="<%=request.getContextPath()%>/foodSupManaMall/foodSupManaMall.do">
				<b>目前有的食材商品</b>
				<select size="1" name="food_ID">
					<c:forEach var="foodMallVO" items="${foodSupSvc.getFoodMallsByFood_sup_ID(foodSupVO.food_sup_ID)}">
						<option value="${foodMallVO.food_ID}">${foodMallVO.food_m_name}
					</c:forEach>
				</select>
			</form>
		</li>
	</ul>

	<ul>
		<li><a href='<%=request.getContextPath()%>/front-end/foodSupManaMall/addFoodMall.jsp'>新增食材商品</a></li>
	</ul>
	
<%--=================================工作區================================================--%>			
				<jsp:include page="/back-endTemplate/footer.jsp" flush="true" />
<%--=================================jQuery===============================================--%>
			</div>
		</div>
	</div>
</body>
</html>