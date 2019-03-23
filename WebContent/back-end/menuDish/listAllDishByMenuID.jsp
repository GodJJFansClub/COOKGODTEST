<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.menuDish.model.*"%>
<jsp:useBean id="menuSvc" scope="page" class="com.menu.model.MenuService"/>
<jsp:useBean id="dishSvc" scope="page" class="com.dish.model.DishService" />
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    MenuDishService menuDishSvc = new MenuDishService();
	String menu_ID = request.getAttribute("menu_ID").toString();
    List<MenuDishVO> list = menuDishSvc.getAllByMenuID(menu_ID);
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有套餐菜色 </title>



<style>
  table {
	width: 600px;
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
<body bgcolor='white'>


<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		
		</c:forEach>
			
  <li><a href='addMenuDish.jsp'>Add</a> a new Dish.</li>
</ul>
	
</c:if>
			
<table>
		<tr><td colspan ="4">套餐名稱:<font color="red" size="5">${menuSvc.getOneMenu(menuVO.menu_ID).menu_name}</font></td></tr>
	<tr>
		
		<th>菜色名稱</th>
	</tr>
	
	<c:forEach var="menuDishVO" items="${list}" >
		<tr>

			<td>${dishSvc.getOneDish(menuDishVO.dish_ID).dish_name}</td>
		
		</tr>
	</c:forEach>
	<tr>
	<td >
		 <h4><a href="<%=request.getContextPath()%>/back-end/dish/select_page.jsp">回首頁</a></h4>
	</td>
	</tr>
</table>




</body>
</html>