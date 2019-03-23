<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dish.model.*"%>
<%

 DishVO dishVO = (DishVO) request.getAttribute("dishVO");
%>


<html>
<head>


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
	<tr><td>
		 <h3>所有菜色資料 - listAllDish.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/dish/select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>


<table>
	<tr>
		<th>菜色編號:</th>
		<th>菜色名稱:</th>
		<th>菜色照片:</th>
		<th>菜色介紹:</th>
		<th>菜色狀態</th>
		<th>菜色價格</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	
	
		<tr>
		
			<td>${dishVO.dish_ID}</td>      
			<td>${dishVO.dish_name}</td>
			<td><c:if test="${not empty dishVO.dish_pic}"><img src="<%=request.getContextPath()%>/dish/dish.do?dish_ID=${dishVO.dish_ID}" width="300" height="200"></c:if>
				<c:if test="${empty dishVO.dish_pic}"><img src="<%=request.getContextPath()%>/back-end/images/null2.jpg" width="300" height="200"></c:if>
			</td>
			<td>${dishVO.dish_resume}</td>
			<td>${dishVO.dish_status}</td>
			<td>${dishVO.dish_price}</td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath() %>/dishFood/dishFood.do">
			     <input type="submit" value="新增食材">
			     <input type="hidden" name="dish_ID"  value="${dishVO.dish_ID}"> 
			     <input type="hidden" name="action"	value="convey"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/dish/dish.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="dish_ID"  value="${dishVO.dish_ID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	
</table>

<%--=================================工作區================================================--%>			
				<jsp:include page="/back-endTemplate/footer.jsp" flush="true" />
<%--=================================jQuery===============================================--%>
			</div>
		</div>
	</div>
</body>
</html>