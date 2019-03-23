<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.menuDish.model.*"%>
<jsp:useBean id="dishSvc" scope="page" class="com.dish.model.DishService"/>
<jsp:useBean id="menuSvc" scope="page" class="com.menu.model.MenuService"/>
<%
  MenuDishVO menuDishVO = (MenuDishVO) request.getAttribute("MenuDishVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>新增套餐菜色</title>
   


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
	width: 870px;
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
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
				<FORM METHOD="post"	ACTION="<%=request.getContextPath()%>/menuDish/menuDish.do" >
					<table>
						<tr>
							<th>套餐名稱:</th>
							<td><input readonly  name="menu_ID" value="${menuVO.menu_ID}"></td>
						</tr>
						<tr>
							<th>選擇菜色:</th>
							<td>
								<c:forEach var="DishVO" items="${dishSvc.all}"   varStatus="sc">
									<input type="checkbox" name="dish_ID" value="${DishVO.dish_ID}">${DishVO.dish_name}
									<a href="<%=request.getContextPath()%>/menuDish/menuDish.do?dish_ID=${menuDishVO.dish_ID}">${dishSvc.getOneDish(menuDishVO.dish_ID).dish_name}</a>
								<c:if test="${sc.count%5 == 0 }">									
									<br>
								</c:if>	
								
								</c:forEach>
							</td>
						
						</tr>
						
					
					</table>
					<input type="hidden" name="action" value="insert">
					<input type="submit" value="送出"><br>
				</FORM>
			

	


</body>
</html>