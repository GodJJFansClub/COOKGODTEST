<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dish.model.*"%>


<%-- 此測試頁，練習採用 EL 的寫法取值 --%>


<%
	DishService dishSvc = new DishService();
	List<DishVO> list = dishSvc.getAll();
	pageContext.setAttribute("list",list);
%>
<html>
<head>
<title>所有菜色資料</title>

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
	width: 1200px;
	background-color: white;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 10px;
	text-align: center;
}
</style>

</head>
<body>
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<jsp:include page="/back-endTemplate/header.jsp" flush="true"/>
		<jsp:include page="/back-end/sideBar/dishFoodMana.jsp" flush="true" />
		<div class="page-wrapper">
			<div class="page-breadcrumb">
<%--=================================工作區================================================--%>

<table id="table-1">
	<tr>
	<td>
		 <h3><font color=red>全部<font color=blue>菜色資料</font></h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/dish/select_page.jsp">回首頁</a></h4>
	</td>
	</tr>
</table>
	<h2><font color=red>菜色狀態:D0=下架 D1=上架</font></h2>
<table>
	<tr>
		<th>菜色編號:</th>
		<th>菜色名稱:</th>
		<th>菜色照片:</th>
		<th>菜色介紹:</th>
		<th>菜色狀態</th>
		<th>菜色價格</th>
		<th>審核</th>
		
		
	</tr>
	
	<c:forEach var="dishVO" items="${list}" >	
		<tr>
			<c:if test="${dishVO.dish_status eq 'D1'}">
			<td>${dishVO.dish_ID}</td>      
			<td>${dishVO.dish_name}</td>
			<td><c:if test="${not empty dishVO.dish_pic}"><img src="<%=request.getContextPath()%>/dish/dish.do?dish_ID=${dishVO.dish_ID}" width="300" height="200"></c:if>
				<c:if test="${empty dishVO.dish_pic}"><img src="<%=request.getContextPath()%>/images/null2.jpg" width="300" height="200"></c:if>
			</td>
			<td>${dishVO.dish_resume}</td>
			<td>${dishStatusMap[dishVO.dish_status]}</td>
			<td>${dishVO.dish_price}</td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath() %>/dish/dish.do">
			     <input type="submit" value="審核">
			     <input type="hidden" name="dish_ID"  value="${dishVO.dish_ID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
		</c:if>
		</tr>
	</c:forEach>
</table> 


</body>
</html>