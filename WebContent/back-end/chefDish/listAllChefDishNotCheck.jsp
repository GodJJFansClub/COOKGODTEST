<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.chefDish.model.*"%>

<%	
	ChefDishService chefDishSvc = new ChefDishService();
	List<ChefDishVO> list = chefDishSvc.getAllNotCheck();
	pageContext.setAttribute("list",list);
%>

<html>
<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<title>�D�p�s���f��</title>
</head>
<body>
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light" data-layout="vertical" data-sidebartype="full" data-boxed-layout="full">
		<jsp:include page="/back-endTemplate/header.jsp" flush="true"/>
		<jsp:include page="/back-end/sideBar/foodSupMana.jsp" flush="true"/>
		<div class="page-wrapper">
			<div class="page-breadcrumb">
<%--=================================�u�@��================================================--%>

<div class="alert alert-secondary text-center" role="alert" ><font style="font-weight:bold;font-size:26px;">�D�p�s���ӽ�</font></div>
<hr class="border:0;height: 1px;background-image: linear-gradient(to right, rgba(0,0,0,0), rgba(0,0,0,0.75), rgba(0,0,0,0));"/>

<%--Error Message--%>
<c:if test = "${not empty errorMsgs} }">
	<font style="color:red;font-size:30px;">Error</font>
	<ul>
		<c:forEach var="errMsgs" items="${errorMsgs}">
			<li style="color:red;">${errMsgs}</li>
		</c:forEach>
	</ul>
</c:if>

		<div class="col">
			<div class="card">
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">�D�p�s��</th>
								<th scope="col">�D�p�m�W</th>
								<th scope="col">���s��</th>
								<th scope="col">���W��</th>
								<th scope="col">���A</th>
								<th scope="col" colspan="2">�f�ֵ��</th>
							</tr>
						</thead>
							<%@ include file="page1.file"%>
							<c:forEach var="chefDishVO" items="${list}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">
						<tr>
							<th scope="row">${chefDishVO.chef_ID}</th>
							<th scope="row">${chefDishVO.chef_name}</th>
							<th scope="row">${chefDishVO.dish_ID}</th>
							<th scope="row">${chefDishVO.dish_name}</th>
							<th scope="row">
								<c:if test="${chefDishVO.chef_dish_status=='d0'}">���f��</c:if>
								<c:if test="${chefDishVO.chef_dish_status=='d1'}">�f�ֳq�L</c:if>
								<c:if test="${chefDishVO.chef_dish_status=='d2'}">�f�֤��q�L</c:if>
							</th>
							<th scope="row">
								<form method="post" action="<%=request.getContextPath()%>/chefDish/chefDish.do">
									<input type="submit" value="�f�ֳq�L">
									<input type="hidden" name="chef_ID"  value="${chefDishVO.chef_ID}">
									<input type="hidden" name="dish_ID"  value="${chefDishVO.dish_ID}">
									<input type="hidden" name="chef_dish_status"  value="d1">
									<input type="hidden" name="action"	value="update">
								</form>
							</th>
							<th scope="row">
								<form method="post" action="<%=request.getContextPath()%>/chefDish/chefDish.do">
									<input type="submit" value="�f�֤��q�L">
									<input type="hidden" name="chef_ID"  value="${chefDishVO.chef_ID}">
									<input type="hidden" name="dish_ID"  value="${chefDishVO.dish_ID}">
									<input type="hidden" name="action"	value="delete_bakend">
								</form>
							</th>
						</tr>
					</c:forEach>
				</table>
				<%@ include file="page2.file"%>
			</div>
		</div>
	</div>

<%--=================================jQuery===============================================--%>
			</div>
		</div>
	</div>

</body>
</html>