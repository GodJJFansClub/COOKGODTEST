<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.chefDish.model.*"%>
<% List<ChefDishVO> list = (List<ChefDishVO>)session.getAttribute("list") ; %>

<html>
<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<title>List_Dish_By_Chef_ID.jsp</title>
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
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
	data-layout="vertical" data-sidebartype="full"
	data-boxed-layout="full">
	<jsp:include page="/back-endTemplate/header.jsp" flush="true"/>
	<jsp:include page="/back-end/sideBar/foodSupMana.jsp" flush="true"/>
	<div class="page-wrapper">
	<div class="page-breadcrumb">
<%--=================================工作區================================================--%>
<%--Error Message--%>
<c:if test = "${not empty errorMsgs} }">
	<font style="color:red;font-size:30px;">Error</font>
	<ul>
		<c:forEach var="errMsgs" items="${errorMsgs}">
			<li style="color:red;">${errMsgs}</li>
		</c:forEach>
	</ul>
</c:if>
	<div class="container justify-content-center">
  		<div class="row">
  			<div class="col-12">  			
				<table>
					<tr>
						<th>主廚編號</th>
						<th>主廚姓名</th>
						<th>菜色編號</th>
						<th>菜色名稱</th>
						<th>菜色狀態</th>
						<th colspan="2">審核菜色</th>
					</tr>
					<%@ include file="page1.file" %>
					<c:forEach var="chefDishVO" items="${list}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">
						<c:if test="${chefDishVO.chef_dish_status=='d0'}">
							<tr>
								<td>${chefDishVO.chef_ID}</td>
								<td>${chefDishVO.chef_name}</td>
								<td>${chefDishVO.dish_ID}</td>
								<td>${chefDishVO.dish_name}</td>
								<td>
									<c:if test="${chefDishVO.chef_dish_status=='d0'}">未審核</c:if>
									<c:if test="${chefDishVO.chef_dish_status=='d1'}">審核通過</c:if>
									<c:if test="${chefDishVO.chef_dish_status=='d2'}">審核不通過</c:if>
								</td>
								<td>
								<c:if test="${chefDishVO.chef_dish_status=='d0'}">
									<form method="post" action="<%=request.getContextPath()%>/chefDish/chefDish.do">
										<input type="submit" value="審核通過">
										<input type="hidden" name="chef_ID"  value="${chefDishVO.chef_ID}">
										<input type="hidden" name="dish_ID"  value="${chefDishVO.dish_ID}">
										<input type="hidden" name="chef_dish_status"  value="d1">
										<input type="hidden" name="action"	value="update">
									</form>
								</c:if>
								</td>
								<td>
								<c:if test="${chefDishVO.chef_dish_status=='d0'}">
									<form method="post" action="<%=request.getContextPath()%>/chefDish/chefDish.do">
										<input type="submit" value="審核不通過">
										<input type="hidden" name="chef_ID"  value="${chefDishVO.chef_ID}">
										<input type="hidden" name="dish_ID"  value="${chefDishVO.dish_ID}">
										<input type="hidden" name="chef_dish_status"  value="d2">
										<input type="hidden" name="action"	value="update">
									</form>
								</c:if>
								</td>
							</tr>	
						</c:if>
					</c:forEach>
				</table>
				<%@ include file="page2.file" %>
  			</div>
  		</div>
  	</div>

			</div>
		</div>
	</div>

</body>
</html>