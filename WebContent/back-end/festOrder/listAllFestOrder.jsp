<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.festOrder.model.*"%>
<jsp:useBean id="custSvc" class="com.cust.model.CustService"/>
<jsp:useBean id="festOrderSvc" scope="page" class="com.festOrder.model.FestOrderService" />

<%
	List<FestOrderVO> list = festOrderSvc.getAll();
	pageContext.setAttribute("list", list);
%>


<html>
<head>
<title></title>


</head>
<body bgcolor='white'>
		<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<jsp:include page="/back-endTemplate/header.jsp" flush="true"/>
		<jsp:include page="/back-end/sideBar/custMana.jsp" flush="true"/>
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
 <section class="page-content">
 	
   <div class="container pt-3 pb-3">
   <div class="table-responsive-sm table-middle">
           <thead class="thead-dark">
	<table class="table table-hover">
	   <thead class="thead-dark">
		<tr>
			<th>訂單編號</th>
			<th>訂單狀態</th>
			<th>價格</th>
			<th>訂單成立日期</th>
			<th>出貨日期</th>
			<th>訂單結束日期</th>
<!-- 			<th>折扣</th> -->
			<th>會員編號</th>
			<th>修改</th>
			<th>送出查詢</th>
		</tr>
		</thead>
		<%@ include file="page1.file"%>
		<c:forEach var="festOrderVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">

			<tr>
				<td>${festOrderVO.fest_or_ID}</td>
				<td>${mallOrStatusMap[festOrderVO.fest_or_status]}</td>
				<td>${festOrderVO.fest_or_price}</td>
				<td>${festOrderVO.fest_or_start}</td>
				<td>${festOrderVO.fest_or_send}</td>
				<td>${festOrderVO.fest_or_end}</td>
<%-- 				<td>${festOrderVO.fest_or_disc}</td> --%>
				<td>${custSvc.getOneCust(festOrderVO.cust_ID).cust_name}</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/festOrder/festOrder.do"
						style="margin-bottom: 0px;">
						<button type="submit" class="btn btn-outline-secondary btn-block">修改</button>
<!-- 						<input type="submit" value="修改"> -->
						 <input type="hidden"
							name="fest_or_ID" value="${festOrderVO.fest_or_ID}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>

				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/festOrder/festOrder.do"
						style="margin-bottom: 0px;">
						<button type="submit" class="btn btn-secondary text-white">送出查詢</button>
<!-- 						<input type="submit" value="送出查詢" >  -->
						<input type="hidden"
							name="fest_or_ID" value="${festOrderVO.fest_or_ID}"> <input
							type="hidden" name="action" 
							value="listFestOrderDetail_ByFest_or_ID_Back">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	</div>
	</section>
	
	<%@ include file="page2.file"%>

	<%
		if (request.getAttribute("listFestOrderDetail_ByFest_or_ID") != null) {
	%>
	<jsp:include
		page="/back-end/festOrder/listFestOrderDetail_ByFest_or_ID.jsp" />
	<%
		}
	%>
<%--=================================工作區================================================--%>			
				<jsp:include page="/back-endTemplate/footer.jsp" flush="true" />
<%--=================================jQuery===============================================--%>
			</div>
		</div>
	</div>
</body>
</html>