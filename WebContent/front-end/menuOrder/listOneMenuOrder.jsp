<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.menuOrder.model.*"%>

<html>
<head>
<title>List_One_Menu_Order.jsp</title>
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
<table id="listOneMenuOrder">
	<tr><th><h3>getOneMenuOrder.jsp</h3></th><td><h4><a href="index.jsp">�^����</a></h4></td></tr>
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
		<th>�q��s��</th>
		<th>�q�檬�A</th>
		<th>�U�q���</th>
		<th>�w�����</th>
		<th>�������</th>
		<th>�q�����</th>
		<th>�q��d��</th>
		<th>�U�Ƚs��</th>
		<th>�D�p�s��</th>
		<th>�M�\�s��</th>
	</tr>	
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
	</tr>
</table>

</body>
</html>