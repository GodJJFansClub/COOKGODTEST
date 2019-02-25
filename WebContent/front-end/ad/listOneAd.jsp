<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ad.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	AdVO adVO = (AdVO) request.getAttribute("adVO"); //SustServlet.java(Concroller), 存入req的adVO物件
%>

<html>
<head>
<title>廣告資料 - listOneAd.jsp</title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</head>
<body bgcolor='white'>
	<%
		if (adVO != null) {
	%>

	<h4>此頁暫練習採用 Script 的寫法取值:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>廣告資料 - ListOneAd.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/front-end/ad/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>廣告編號</th>
			<th>廣告帳號</th>
			<th>廣告密碼</th>
			<th>廣告姓名</th>
			<th>廣告性別</th>
			<th>廣告電話</th>
			<th>廣告地址</th>
			<th>廣告身份證字號</th>
			<th>E-mail</th>
			<th>廣告生日</th>
			<th>廣告註冊日</th>
			<th>大頭照</th>
			<th>廣告狀態</th>
			<th>廣告暱稱</th>
		</tr>
		<tr>
			<td><%=adVO.getAd_ID()%></td>
			<td><%=adVO.getAd_acc()%></td>
			<td><%=adVO.getAd_pwd()%></td>
			<td><%=adVO.getAd_title()%></td>
			<c:if test="${adVO.ad_sex.equals('M')}" var="true"
				scope="session">
				<td>男生</td>
			</c:if>
			<c:if test="${adVO.ad_sex.equals('F')}" var="true"
				scope="session">
				<td>女生</td>
			</c:if>
			<td><%=adVO.getAd_tel()%></td>
			<td><%=adVO.getAd_addr()%></td>
			<td><%=adVO.getAd_pid()%></td>
			<td><%=adVO.getAd_mail()%></td>
			<td><%=adVO.getAd_start()%></td>
			<td><%=adVO.getAd_reg()%></td>
			<td><img
				src="<%=request.getContextPath()%>/ad/ad.do?ad_ID=${adVO.ad_ID}"></td>
			<c:if test="${adVO.ad_status.equals('a0')}" var="true"
				scope="session">
				<td>未停權</td>
			</c:if>
			<c:if test="${adVO.ad_status.equals('a1')}" var="true"
				scope="session">
				<td>停權</td>
			</c:if>
			<td><%=adVO.getAd_niname()%></td>

		</tr>
	</table>
	<%
		}
	%>
</body>
</html>