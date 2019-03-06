<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="com.foodMall.model.*" %>
<jsp:useBean id="foodMallSvc" scope="page" class="com.foodMall.model.FoodMallService"/>
<%
	List<FoodMallVO> list = foodMallSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<html>
<head>
<title></title>
</head>
<body>
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<jsp:include page="/back-endTemplate/header.jsp" flush="true"/>
		<aside class="left-sidebar" data-sidebarbg="skin5">
<%--==============<jsp:include page="/back-end/XXXX/sidebar.jsp" flush="true" />=================================--%>
		
		</aside>
		<div class="page-wrapper">
			<div class="page-breadcrumb">
<%--=================================工作區================================================--%>
				<%-- 錯誤列表 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color:red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color:red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
				<table>
					<tr>
						<th>食材商編號</th>
						<th>食材編號</th>
						<th>標題</th>
						<th>商品狀態</th>
						<th>價格</th>
						<th>單位</th>
						<th>產地</th>
						<th>圖片</th>
						<th>介紹</th>
						<th>評價</th>
					</tr>
					<%@ include file="/file/page1.file" %>
					<c:forEach var="foodMallVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
						<tr>
							<td>${foodMallVO.food_sup_ID}</td>
							<td>${foodMallVO.food_ID}</td>
							<td>${foodMallVO.food_m_name}</td>
							<td>${mallStatusMap[foodMallVO.food_m_status]}</td>
							<td>${foodMallVO.food_m_price}</td>
							<td>${foodMallVO.food_m_unit}</td>
							<td>${foodMallVO.food_m_place}</td>
							<%--<td><img src="data:image/png;base64,${foodMallVO.food_m_pic}"></td> --%>
							<td><img src="<%=request.getContextPath()%>/foodMall/foodMall.do?food_sup_ID=${foodMallVO.food_sup_ID}&food_ID=${foodMallVO.food_ID}"></td>
							<td>${foodMallVO.food_m_resume}</td>
							<td>${foodMallVO.food_m_rate}</td>
						
							<td>
								<form method="post" action="<%=request.getContextPath()%>/foodMall/foodMall.do">
									<input type="submit" value="修改">
									<input type="hidden" value="food_ID" value="${foodMallVO.food_ID}">
									<input type="hidden" name="action" value="getOne_For_Update">
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
				<%@ include file="/file/page2.file" %>

<%--=================================工作區================================================--%>			
				<jsp:include page="/back-endTemplate/footer.jsp" flush="true" />
<%--=================================jQuery===============================================--%>
			</div>
		</div>
	</div>
</body>
</html>