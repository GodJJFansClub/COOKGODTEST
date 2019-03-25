<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.menuOrder.model.*"%>
<jsp:useBean id="custSvc" class="com.cust.model.CustService"/>
<jsp:useBean id="menuSvc" class="com.menu.model.MenuService"/>
<%
	MenuOrderService menuOrderSvc = new MenuOrderService();
	List<MenuOrderVO> listAll = menuOrderSvc.getAll();
	pageContext.setAttribute("listAll", listAll);
%>

<html>
<head>
<title>List_All_Menu_Order</title>
<style type="text/css">
th,td{
	width:100px;
	border:1px solid gray;
	text-align:center;
}
</style>
</head>
<body>
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<jsp:include page="/back-endTemplate/header.jsp" flush="true" />
		<jsp:include page="/back-end/sideBar/custMana.jsp"></jsp:include>
		<div class="page-wrapper">
			<div class="page-breadcrumb">
				<%--=================================工作區================================================--%>
				<%--Error Message--%>
				<c:if test="${not empty errorMsgs} }">
					<font style="color: red; font-size: 30px;">Error</font>
					<ul>
						<c:forEach var="errMsgs" items="${errorMsgs}">
							<li style="color: red;">${errMsgs}</li>
						</c:forEach>
					</ul>
				</c:if>

				<div class="col">
					<div class="card">

						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">訂單編號</th>
										<th scope="col">訂單狀態</th>
										<th scope="col">下訂日期</th>
										<th scope="col">預約日期</th>
										<th scope="col">完成日期</th>
										<th scope="col">訂單評價</th>
										<th scope="col">訂單留言</th>
										<th scope="col">顧客編號</th>
										<th scope="col">主廚編號</th>
										<th scope="col">套餐編號</th>
										<th scope="col">修改訂單</th>
										<th scope="col">刪除訂單</th>

									</tr>
								</thead>

								
												<%@ include file="page1.file"%>
												<c:forEach var="menuOrderVO" items="${listAll}"
													begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">
													<tr>
														<th scope="row">${menuOrderVO.menu_od_ID}</th>
														<th scope="row"><c:if test="${menuOrderVO.menu_od_status=='g0'}">未審核</c:if>
															<c:if test="${menuOrderVO.menu_od_status=='g1'}">審核通過</c:if>
															<c:if test="${menuOrderVO.menu_od_status=='g2'}">審核不通過</c:if>
															<c:if test="${menuOrderVO.menu_od_status=='g3'}">主廚到府</c:if>
															<c:if test="${menuOrderVO.menu_od_status=='g4'}">訂單完成</c:if></th>
														<th scope="row">${menuOrderVO.menu_od_start}</th>
														<th scope="row">${menuOrderVO.menu_od_book}</th>
														<th scope="row">${menuOrderVO.menu_od_end}</th>
														<th scope="row">${menuOrderVO.menu_od_rate}</th>
														<th scope="row">${menuOrderVO.menu_od_msg}</th>
														<th scope="row">${custSvc.getOneCust(menuOrderVO.cust_ID).cust_name}</th>
														<th scope="row">${custSvc.getOneCust(menuOrderVO.chef_ID).cust_name}</th>
														<th scope="row">${menuSvc.getOneMenu(menuOrderVO.menu_ID).menu_name}</th>
														<th scope="row">
															<form method="post"
																action="<%=request.getContextPath()%>/menuOrder/menuOrder.do">
																<input type="submit" value="編輯"> <input
																	type="hidden" name="menu_od_ID"
																	value="${menuOrderVO.menu_od_ID}"> <input
																	type="hidden" name="action" value="getOneForDispaly">
															</form>
														</th>
														<th scope="row">
															<form method="post"
																action="<%=request.getContextPath()%>/menuOrder/menuOrder.do">
																<input type="submit" value="刪除"> <input
																	type="hidden" name="menu_od_ID"
																	value="${menuOrderVO.menu_od_ID}"> <input
																	type="hidden" name="action" value="delete">
															</form>
														</th>
													</tr>
												</c:forEach>
											</table>
											<%@ include file="page2.file"%>
										</div>
									</div>
								</div>

								<%--=================================工作區================================================--%>
								<jsp:include page="/back-endTemplate/footer.jsp" flush="true" />
								<%--=================================jQuery===============================================--%>
						</div>
					</div>
				</div></body>
</html>