<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	EmpVO empVO = (EmpVO) session.getAttribute("empVO"); //SustServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>員工資料 - listOneEmp.jsp</title>



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
<body>

	<%
		if (empVO != null) {
	%>

	<h4>此頁暫練習採用 Script 的寫法取值:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>員工資料 - ListOneEmp.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/back-end/emp/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>員工編號</th>
			<th>員工帳號</th>
			<th>員工密碼</th>
			<th>員工姓名</th>
			<th>大頭照</th>
			
		</tr>
		<tr>
			<td><%=empVO.getEmp_ID()%></td>
			<td><%=empVO.getEmp_acc()%></td>
			<td><%=empVO.getEmp_pwd()%></td>
			<td><%=empVO.getEmp_name()%></td>
			<td><c:if test="${not empty empVO.emp_pic}"><img src="<%=request.getContextPath()%>/emp/emp.do?emp_ID=${empVO.emp_ID}"></c:if>
				    <c:if test="${empty empVO.emp_pic}"><img src="<%=request.getContextPath()%>/images/null2.jpg"></c:if></td>

			

		</tr>
	</table>
	<%
		}
	%>

			</div>
		</div>
	</div>
</body>
</html>