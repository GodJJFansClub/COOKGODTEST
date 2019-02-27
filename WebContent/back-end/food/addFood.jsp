<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.food.model.*"%>


<% FoodVO foodVO = (FoodVO) request.getAttribute("foodVO"); %>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>食材資料新增 - addFood.jsp</title>
</head>
<body>
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<aside class="left-sidebar" data-sidebarbg="skin5">
			<jsp:include page="/back-endTemplate/sidebar.jsp" flush="true" />
		</aside>
		<div class="page-wrapper">
			<div class="page-breadcrumb">
<%--=================================工作區================================================--%>
				
<%--=================================工作區================================================--%>
				<jsp:include page="/back-endTemplate/footer.jsp" flush="true" />
			</div>
		</div>
	</div>
</body>
</html>