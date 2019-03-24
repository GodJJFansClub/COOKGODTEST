<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ad.model.*"%>


<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	AdService adSvc = new AdService();
	List<AdVO> list = adSvc.getAll();
	;
	pageContext.setAttribute("list", list);
%>

<html>
<head>
<title>所有廣告資料 - listAllAd.jsp</title>
<link href="../../dist/css/style.min.css" rel="stylesheet">


</head>
<body>
    <div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
        data-layout="vertical" data-sidebartype="full"
        data-boxed-layout="full">
        <jsp:include page="/back-endTemplate/header.jsp" flush="true" />
        <jsp:include page="/back-end/sideBar/dishFoodMana.jsp" flush="true" />
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
                                            <th scope="col">廣告編號:</th>
                                            <th scope="col">廣告標題:</th>
                                            <th scope="col">廣告內文:</th>
                                            <th scope="col">廣告內文:</th>
                                            <th scope="col">廣告上架日期:</th>
                                            <th scope="col">廣告下架日期:</th>
                                            <th scope="col">廣告狀態:</th>
                                            <th scope="col">廣告類別:</th>
                                            <th scope="col">食材供應商:</th>
                                          
                                        </tr>
                                    </thead>
                
								<%@ include file="/file/page1.file"%>
		                  <c:forEach var="adVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

			<tr>
				<th scope="row">${adVO.ad_ID}</th>
				<th scope="row">${adVO.ad_title}</th>
				<th scope="row"><c:if test="${not empty adVO.ad_pic}"><img src="<%=request.getContextPath()%>/ad/ad.do?ad_ID=${adVO.ad_ID}"></c:if>
				    <c:if test="${empty adVO.ad_pic}"><img src="<%=request.getContextPath()%>/images/null2.jpg"></c:if></th>
				<th scope="row">${adVO.ad_con}</th>
				<th scope="row">${adVO.ad_start}</th>
				<th scope="row">${adVO.ad_end}</th>
				<th scope="row">${adStatusMap[adVO.ad_status]}</th>
				<th scope="row">${adTypeMap[adVO.ad_type]}</th>
				<th scope="row">${adVO.food_sup_ID}</th>
				
				<th scope="row">
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/ad/ad.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="審核廣告"> <input type="hidden"
							name="ad_ID" value="${adVO.ad_ID}"> <input
							type="hidden" name="action" value="getOne_For_UpdateBack">
					</FORM>
				</th>			
			</tr>
		</c:forEach>
	</table>
	</div>
           </div>
        </div>
	<%@ include file="/file/page2.file"%>
<%--=================================工作區================================================--%>			
				<jsp:include page="/back-endTemplate/footer.jsp" flush="true" />
<%--=================================jQuery===============================================--%>
			</div>
		</div>
	</div>
	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
</body>
</html>