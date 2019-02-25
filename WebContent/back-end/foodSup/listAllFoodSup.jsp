<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="foodSupSvc" scope="page" class="com.foodSup.model.FoodSupService"/>
<html>
<head>

<title>管理食材供應商</title>
</head>
<body>
	<h3>所有食材供應商</h3>
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<select size="1" name="getStatus_For_Display">
		<c:forEach var="foodSupStatus" items="${foodSupStatusMap}">
			<option value="${foodSupStatus.key}">${foodSupStatus.value}
		</c:forEach>
	</select>
	<table>
		<tr>
			<th>食材供應商編號</th>
			<th>食材供應商名稱</th>
			<th>聯絡電話</th>
			<th>狀態</th>
		</tr>
		<c:forEach var="foodSupVO" items="${foodSupSvc.all}">
			<tr>
				<td>${foodSupVO.food_sup_ID}</td>
				<td>${foodSupVO.food_sup_name}</td>
				<td>${foodSupVO.food_sup_tel}</td>
				<td>${foodSupStatusMap[foodSupVO.food_sup_status]}</td>
				<td>
				<form method="post" action="<%=request.getContextPath()%>/foodSup/foodSup.do">
					<input type="submit" value="修改">
					<input type="hidden" name="food_sup_ID" value="${foodSupVO.food_sup_ID}">
					<input type="hidden" name="action" value="getOne_For_Display">
				</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<script type="text/javascript">
	</script>
</body>
</html>