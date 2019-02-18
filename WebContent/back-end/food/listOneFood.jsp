<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.food.model.*" %>

<%--測試一下這東西應該是不用
	FoodVO foodVO = (FoodVO) request.getAttribute("foodVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
--%>

<html>
<head>
	<title>食材資料 - listOneFood.jsp</title>
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
	<table id="table-1">
		<tr><td>
			<h3>食材資料 - listOneFood.jsp</h3>
		 	<h4><a href="<%=request.getContextPath()%>/back-end/food/select_page.jsp"><img src="<%=request.getContextPath()%>/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
		</td></tr>
	</table>
	<table>
		<tr>
			<th>食材編號</th>
			<th>食材名稱</th>
			<th>食材種類</th>
		</tr>
		<tr>
			<%-- 思考一下這裡是左邊還是右邊, 左邊上面的其實是script用 --%>
			<td>${foodVO.food_ID}</td>
			<td>${foodVO.food_name}</td>
			<td>${foodVO.food_type}</td>
		</tr>
	</table>

</body>
</html>