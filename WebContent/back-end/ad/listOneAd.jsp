<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ad.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	AdVO adVO = (AdVO) request.getAttribute("adVO"); //SustServlet.java(Concroller), 存入req的adVO物件
%>

<html>
<head>
<title>廣告資料 - listOneAd.jsp</title>
<link href="../../dist/css/style.min.css" rel="stylesheet">

</head>
<body >
		<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
        data-layout="vertical" data-sidebartype="full"
        data-boxed-layout="full">
        <jsp:include page="/back-endTemplate/header.jsp" flush="true" />
        <jsp:include page="/back-end/sideBar/dishFoodMana.jsp" flush="true" />
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <%--=================================工作區================================================--%>

                
		
<%--==============<jsp:include page="/back-end/XXXX/sidebar.jsp" flush="true" />=================================--%>
		
		<%-- </aside>
		<div class="page-wrapper">
			<div class="page-breadcrumb">--%>
<%--=================================工作區================================================--%>
	<%
		if (adVO != null) {
	%>


	

				<div class="col">
                        <div class="card">
                            
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">廣告編號:</th>
                                            <th scope="col">廣告標題:</th>
                                            <th scope="col">廣告內文:</th>
                                            <th scope="col">廣告上架日期:</th>
                                            <th scope="col">廣告下架日期:</th>
                                            <th scope="col">廣告狀態:</th>
                                            <th scope="col">廣告類別:</th>
                                            <th scope="col">食材供應商:</th>
                                            <th scope="col">食材供應商編號:</th>
                                          
                                        </tr>
                                    </thead>
                
	
		<tr >
			<th scope="row"><%=adVO.getAd_ID()%></th>
			<th scope="row"><%=adVO.getAd_title()%></th>
			<th scope="row"><c:if test="${not empty adVO.ad_pic}"><img src="<%=request.getContextPath()%>/ad/ad.do?ad_ID=${adVO.ad_ID}" width="300" height="200"></c:if>
				    		<c:if test="${empty adVO.ad_pic}"><img src="<%=request.getContextPath()%>/images/null2.jpg" width="300" height="200"></c:if></th>
			<th scope="row"><%=adVO.getAd_con()%></th>
			<th scope="row"><%=adVO.getAd_start()%></th>
			<th scope="row"><%=adVO.getAd_end()%></th>
			<th scope="row">${adStatusMap[adVO.ad_status]}</th>
			<th scope="row">${adTypeMap[adVO.ad_type]}</th>
			<th scope="row"><%=adVO.getFood_sup_ID()%></th>
			
		</tr>
		
		<tr align='center' valign="middle">
			<td>
				
				<h4>
					<a href="<%=request.getContextPath()%>/back-end/ad/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	
	</table>
	</div>
           </div>
        </div>
	<%
		}
	%>
<%--=================================工作區================================================--%>			
				<jsp:include page="/back-endTemplate/footer.jsp" flush="true" />
<%--=================================jQuery===============================================--%>
			</div>
		</div>
	</div>
	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
</body>
</html>