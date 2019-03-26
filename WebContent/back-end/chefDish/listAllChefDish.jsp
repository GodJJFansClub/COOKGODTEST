<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.chefDish.model.*"%>

<%
	ChefDishService chefDishSvc = new ChefDishService();
	List<ChefDishVO> list = chefDishSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<html>
<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<title>List_All_Chef_Dish.jsp</title>
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

	<div class="card text-center" style="background-color: #D4E6F1">	  
	  <div class="card-body" >
	    <h5 class="card-title">�D�p�ժ����</h5>
	    <p class="card-text">listAllChefDish.jsp</p>
	    <a href="index.jsp" class="btn btn-primary">�^����</a>
	  </div>
	</div>

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
						<th>�D�p�s��</th>
						<th>�D�p�m�W</th>
						<th>���s��</th>
						<th>���W��</th>
						<th>�f�֪��A</th>
						<th>�s����</th>
					</tr>
					<%@ include file="page1.file" %>
					
					<c:forEach var="chefDishVO" items="${list}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">
						<tr>
							<td>${chefDishVO.chef_ID}</td>
							<td>${chefDishVO.chef_name}</td>
							<td>${chefDishVO.dish_ID}</td>
							<td>${chefDishVO.dish_name}</td>
							<td>${chefDishVO.chef_dish_status}</td>
							<td>
								<form method="post" action="<%=request.getContextPath()%>/chefDish/chefDish.do">
									<input type="submit" value="�s��">
									<input type="hidden" name="chef_ID"  value="${chefDishVO.chef_ID}">
									<input type="hidden" name="dish_ID"  value="${chefDishVO.dish_ID}">
									<input type="hidden" name="action"	value="getOneForUpdate">
								</form>
							</td>
						</tr>	
					</c:forEach>
				</table>
				<%@ include file="page2.file" %>
  			</div>
  		</div>
  	</div>

<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
	</script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"	crossorigin="anonymous">
	</script>
	<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous">
	</script>

</body>
</html>