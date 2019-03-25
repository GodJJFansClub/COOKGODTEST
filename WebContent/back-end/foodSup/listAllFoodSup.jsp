<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="foodSupSvc" scope="page" class="com.foodSup.model.FoodSupService"/>
<jsp:useBean id="custSvc" class="com.cust.model.CustService"/>
<html>
<head>
<link href="../../dist/css/style.min.css" rel="stylesheet">
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
				<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
				<font color='red'>請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color:red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
				
				<div class="col">
					<div class="card">

						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">食材供應商編號</th>
										<th scope="col">食材供應商名稱</th>
										<th scope="col">聯絡電話</th>
										<th scope="col">狀態</th>
										<th scope="col">更改狀態</th>
										
									</tr>
								</thead>
				
					<c:forEach var="foodSupVO" items="${foodSupSvc.all}">
						<tr class="foodSupEntiy">
							<th scope="row">${foodSupVO.food_sup_ID}</th>
							<th scope="row">${foodSupVO.food_sup_name}</th>
							<th scope="row">${foodSupVO.food_sup_tel}</th>
							<th scope="row">${foodSupStatusMap[foodSupVO.food_sup_status]}</th>

							<th scope="row">
							<form method="post" action="<%=request.getContextPath()%>/foodSup/foodSup.do">
								<button id="update">修改</button>
								<input type="hidden" id="food_sup_ID" name="food_sup_ID" value="${foodSupVO.food_sup_ID}">
								<input type="hidden" id="action" name="action">
								<input type="hidden" id="requestURL" name="requestURL" value="<%=request.getServletPath()%>">
							</form>
							</th>
						</tr>
					</c:forEach>
				</table>
				</div>
					</div>
				</div>
				<%if (request.getAttribute("listFoodMalls_ByFood_sup_ID") != null ) {%>
					<jsp:include page="/back-end/foodSup/listFoodMalls_ByFood_sup_ID.jsp" flush="true" />
				<%}%>
<%--=================================工作區================================================--%>			
				<jsp:include page="/back-endTemplate/footer.jsp" flush="true" />
<%--=================================jQuery===============================================--%>
			</div>
		</div>
	</div>
	
	<script>
	
		$(document).ready(function(){
			$(".foodSupEntiy").click(function(evt){
				let foodForm = $(this).find("form");
				if(evt.target.id != "update") { 
					foodForm.children("#requestURL").val("<%=request.getServletPath()%>");
					foodForm.children("#action").val("listFoodMalls_ByFood_sup_ID");
				}else{
					foodForm.children("#action").val("getOne_For_Update");	
				}
				foodForm.submit();
			});
		});
	</script>
</body>
</html>