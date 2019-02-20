<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.menuOrder.model.*"%>

<html>
<head>

<title>MenuOrder</title>
<style>
	li{
		margin:10px;
		font-size:20px;
	}
</style>
</head>
<body>

<div style="font-size:30px;width:500px;height:100px;background-color:#D4E6F1;text-align:center;">MenuOrder</div>

<%--Error Message --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red;font-size:20px;">Error:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<h3>查詢套餐訂單</h3>
<ul>
	<li>
	<a href = 'listAllMenuOrder.jsp'>List_All_Menu_Oredr</a>
	</li>
	
	<li>
	<form method = "post" action="menuOrder.do">
		輸入訂單編號：
		<input type="text" name="menu_od_ID">
		<input type="hidden" name="action" value="getOneMenuOrder">
        <input type="submit" value="送出">
	</form>
	</li>
	<jsp:useBean id="menuOrderSvc" scope="page" class="com.menuOrder.model.MenuOrderService" />
	<li>
	<form method = "post" action="menuOrder.do">
		選擇訂單編號：
		<select size="1" name="menu_od_ID">
			<c:forEach var = "menuOrderVO" items="${menuOrderSvc.all}">
				<option value = "${menuOrderVO.menu_od_ID}">${menuOrderVO.menu_od_ID}
			</c:forEach>
		</select>
		<input type="hidden" name="action" value="getOneMenuOrder">
        <input type="submit" value="送出">
	</form>
	</li>
</ul>

<h3>新增套餐訂單</h3>
<ul>
	<li><a href = 'addMenuOrder.jsp'>Add Menu Order</a></li>
</ul>

</body>
</html>