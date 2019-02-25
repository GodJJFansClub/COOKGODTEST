<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.fun.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	FunVO funVO = (FunVO) request.getAttribute("funVO"); //SustServlet.java(Concroller), 存入req的funVO物件
%>

<html>
<head>
<title>權限資料 - listOneFun.jsp</title>

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
		if (funVO != null) {
	%>

	<h4>此頁暫練習採用 Script 的寫法取值:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>權限資料 - ListOneFun.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/back-end/fun/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>權限編號</th>
			
			<th>權限姓名</th>
		
			
		</tr>
		<tr>
			<td><%=funVO.getFun_ID()%></td>
			<td><%=funVO.getFun_name()%></td>
					

		</tr>
	</table>
	<%
		}
	%>
</body>
</html>