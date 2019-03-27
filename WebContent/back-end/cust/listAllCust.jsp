<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cust.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	CustService custSvc = new CustService();
	List<CustVO> list = custSvc.getAll();
	;
	pageContext.setAttribute("list", list);
%>


<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<jsp:include page="/back-endTemplate/header.jsp" flush="true" />
		<jsp:include page="/back-end/sideBar/custMana.jsp" flush="true" />
		<div class="page-wrapper">
			<div class="page-breadcrumb">
				<%--=================================工作區================================================--%>

				<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
			
			<div class="col">
					<div class="card">

						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">顧客編號</th>
										<th scope="col">顧客帳號</th>
										<th scope="col">顧客密碼</th>
										<th scope="col">顧客姓名</th>
										<th scope="col">顧客性別</th>
										<th scope="col">顧客電話</th>
										<th scope="col">大頭照</th>
										<th scope="col">顧客狀態</th>
										
									</tr>
								</thead>


								
									<%@ include file="/file/page1.file"%>
									<c:forEach var="custVO" items="${list}" begin="<%=pageIndex%>"
										end="<%=pageIndex+rowsPerPage-1%>">

										<tr>
											<th scope="row">${custVO.cust_ID}</th>
											<th scope="row">${custVO.cust_acc}</th>
											<th scope="row">${custVO.cust_pwd}</th>
											<th scope="row">${custVO.cust_name}</th>
											<c:if test="${custVO.cust_sex.equals('M')}" var="true"
												scope="session">
												<td>男生</td>
											</c:if>
											<c:if test="${custVO.cust_sex.equals('F')}" var="true"
												scope="session">
												<td>女生</td>
											</c:if>
											<th scope="row">${custVO.cust_tel}</th>
											<th scope="row"><c:if test="${not empty custVO.cust_pic}">
													<img
														src="<%=request.getContextPath()%>/cust/cust.do?cust_ID=${custVO.cust_ID}" width="300" height="200">
												</c:if> <c:if test="${empty custVO.cust_pic}" >
													<img src="<%=request.getContextPath()%>/images/null2.jpg" width="300" height="200">
												</c:if></th>

											<c:if test="${custVO.cust_status.equals('a0')}" var="true"
												scope="session">
												<td>未停權</td>
											</c:if>
											<c:if test="${custVO.cust_status.equals('a1')}" var="true"
												scope="session">
												<td>停權</td>
											</c:if>
											

											<th scope="row">
												<FORM METHOD="post"
													ACTION="<%=request.getContextPath()%>/cust/cust.do"
													style="margin-bottom: 0px;">
													<input type="submit" value="修改"> <input
														type="hidden" name="cust_ID" value="${custVO.cust_ID}">
													<input type="hidden" name="action"
														value="getOne_For_UpdateBack">
												</FORM>
											</th>
										</tr>
									</c:forEach>
								</table>
						</div>
					</div>
				</div>
								<%@ include file="/file/page2.file"%>
							
						</div>
					</div>
	</div>
	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
</body>
</html>