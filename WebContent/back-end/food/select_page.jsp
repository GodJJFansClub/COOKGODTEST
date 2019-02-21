<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>CookGod Food : Home</title>
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
		table#table-1 h4{
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
<body bgcolor='white'>
	<table id="table-1">
		<tr><td><h3>CookGod Food: Home</h3><h4>( MVC )</h4></td></tr>
	</table>
	<p>This is the Home page for CookGod Food: Home</p>
	<h3>資料查詢:</h3>
	<%-- 錯誤表列 --%>
	<%-- JSTL標籤 + EL隱含物件.errorMsgs --%>
	<%-- EL: 沒有宣告的變數, 請在前想像有XXXScope --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">請修正以下錯誤:</font>
		<ul>
			<%-- var + items 達成增強型for --%>
			<%-- message JSTL有宣告的變數, 所以EL會用  --%>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<%-- 不封死嗎, 這樣forward和include會不會太危險 --%>
	<ul>
		<li><a href='<%=request.getContextPath()%>/back-end/food/listAllFood.jsp'>List</a> all Food. <br><br></li>
		<li>
			<%-- 封死路徑, 強制由專案門口起算, request JSP幫你宣告好的物件 --%>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/food/food.do">
				<b>輸入食材編號(如F00001)</b>
				<%-- 記住form, VO, 資料庫欄位三者一致 --%>
				<input type="text" name="food_ID">
				<%-- 藉由隱藏的參數, 決定到control getOne_For_Display區塊 --%>
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
		<%-- FoodService物件JSP Action Elements --%>
		<%-- 只有不用驗證的可以直接連絡service取 --%>
		<%-- 只有class找不到new, 找到就用 --%> <%-- 有用到錯誤的紅就會消失 --%>
		<jsp:useBean id="foodSvc" scope="page" class="com.food.model.FoodService"/>
		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/food/food.do">
				<b>請選擇食材編號:</b>
				<select size="1" name="food_ID">
					<%-- EL NULL的時候, 不會跳錯會是空字串, 再確認? --%>
					<c:forEach var="foodVO" items="${foodSvc.all}">
						<option value="${foodVO.food_ID}">${foodVO.food_ID}
					</c:forEach>
				</select>
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
		
		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/food/food.do">
				<b>選擇食材名稱</b>
				<select size="1" name="food_ID">
					<c:forEach var="foodVO" items="${foodSvc.all}">
						<option value="${foodVO.food_ID}">${foodVO.food_name}
					</c:forEach>
				</select>
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
	</ul>
	
	<h3>食材管理</h3>
	<ul>
		<li><a href='<%=request.getContextPath()%>/back-end/food/addFood.jsp'>Add</a>a new Food.</li>
	</ul>
</body>
</html>