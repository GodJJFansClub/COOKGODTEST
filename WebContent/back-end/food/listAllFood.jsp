<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.food.model.*"%>

<%
	FoodService foodSvc = new FoodService();
	List<FoodVO> list = foodSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<html>
<head>
<title>所有食材資料 - listAllFood.jsp</title>


</head>
<body bgcolor='white'>
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<aside class="left-sidebar" data-sidebarbg="skin5">
			<jsp:include page="/back-endTemplate/sidebar.jsp" flush="true" />
		</aside>
		<div class="page-wrapper">
			<div class="page-breadcrumb">
<%--=================================工作區================================================--%>
				<table id="table-1">
					<tr>
						<td>
							<h3>所有食材資料 - listAllFood.jsp</h3>
							<h4>
								<a
									href="<%=request.getContextPath()%>/back-end/food/select_page.jsp"><img
									src="<%=request.getContextPath()%>/back-end/food/images/back1.gif"
									width="100" height="32" border="0">回首頁</a>
							</h4>
						</td>
					</tr>
				</table>
				<%-- 錯誤列表 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
				<table>
					<tr>
						<th>食材編號</th>
						<th>食材名稱</th>
						<th>食材種類</th>
					</tr>
					<%@ include file="/file/page1.file"%>
					<c:forEach var="foodVO" items="${list}" begin="<%=pageIndex%>"
						end="<%=pageIndex+rowsPerPage-1%>">
						<tr>
							<td>${foodVO.food_ID}</td>
							<td>${foodVO.food_name}</td>
							<td>${foodTypeMap[foodVO.food_type_ID]}</td>
							<td>
								<FORM METHOD="post"
									ACTION="<%=request.getContextPath()%>/food/food.do"
									style="margin-bottom: 0px;">
									<input type="submit" value="修改"> <input type="hidden"
										name="food_ID" value="${foodVO.food_ID}"> <input
										type="hidden" name="action" value="getOne_For_Udate">
								</FORM>
							</td>
							<td>
								<FORM METHOD="post"
									ACTION="<%=request.getContextPath()%>/food/food.do"
									style="margin-bottom: 0px;">
									<input type="submit" value="刪除"> <input type="hidden"
										name="food_ID" value="${foodVO.food_ID}"> <input
										type="hidden" name="action" value="delete">
								</FORM>
							</td>
						</tr>
					</c:forEach>
				</table>
				<%@ include file="/file/page2.file"%>
<%--=================================工作區================================================--%>
				<jsp:include page="/back-endTemplate/footer.jsp" flush="true" />
			</div>
		</div>
	</div>
</body>
</html>