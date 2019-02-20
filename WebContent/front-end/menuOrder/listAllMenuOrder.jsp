<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.menuOrder.model.*"%>

<%
	MenuOrderService menuOrderSvc = new MenuOrderService();
	List<MenuOrderVO> listAll = menuOrderSvc.getAll();
	pageContext.setAttribute("listAll", listAll);
%>
<html>
<head>
<title>List_All_Menu_Order.jsp</title>
<style type="text/css">
	table{
		border: 2px solid gray;
		margin: 15px;
	}
	th,td{
		border:1px solid;
		width: 100px;
		height: 50px;
		text-align: center;
		padding:3px;
	}
</style>
</head>
<body>
<table id="listAllMenuOrder">
	<tr><th><h3>All_Menu_Order.jsp</h3></th><td><h4><a href="index.jsp">回首頁</a></h4></td></tr>
</table>

<%--Error Message--%>
<c:if test = "${not empty errorMsgs} }">
	<font style="color:red;font-size:30px;">Error</font>
	<ul>
		<c:forEach var="errMsgs" items="${errorMsgs}">
			<li style="color:red;">${errMsgs}</li>
		</c:forEach>
	</ul>
</c:if>
<table>
	<tr>
		<th>訂單編號</th>
		<th>訂單狀態</th>
		<th>下訂日期</th>
		<th>預約日期</th>
		<th>完成日期</th>
		<th>訂單評價</th>
		<th>訂單留言</th>
		<th>顧客編號</th>
		<th>主廚編號</th>
		<th>套餐編號</th>
		<th>修改訂單</th>
		<th>刪除訂單</th>		
	</tr>
	<%@ include file="page1.file" %>
	<c:forEach var="menuOrderVO" items="${listAll}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">
		<tr>
			<td>${menuOrderVO.menu_od_ID}</td>
			<td>${menuOrderVO.menu_od_status}</td>
			<td>${menuOrderVO.menu_od_start}</td>
			<td>${menuOrderVO.menu_od_book}</td>
			<td>${menuOrderVO.menu_od_end}</td>
			<td>${menuOrderVO.menu_od_rate}</td>
			<td>${menuOrderVO.menu_od_msg}</td>
			<td>${menuOrderVO.cust_ID}</td>
			<td>${menuOrderVO.chef_ID}</td>
			<td>${menuOrderVO.menu_ID}</td>
			<td>
				<form method="post" action="<%=request.getContextPath()%>/menuOrder/menuOrder.do">
					<input type="submit" value="編輯">
					<input type="hidden" name="menu_od_ID"  value="${menuOrderVO.menu_od_ID}">
					<input type="hidden" name="action"	value="getOneForUpdate">
				</form>
			</td>
			<td>
				<form method="post" action="<%=request.getContextPath()%>/menuOrder/menuOrder.do">
					<input type="submit" value="刪除">
					<input type="hidden" name="menu_od_ID"  value="${menuOrderVO.menu_od_ID}">
					<input type="hidden" name="action"	value="getOneForDelete">
				</form>
			</td>
		</tr>	
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>