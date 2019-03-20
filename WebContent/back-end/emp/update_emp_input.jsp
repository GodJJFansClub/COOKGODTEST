<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>

<%
	EmpVO empVO = (EmpVO) request.getAttribute("empVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>員工資料修改 - update_emp_input.jsp</title>



<style>
table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body>



	<table id="table-1">
		<tr>
			<td>
				<h3>員工資料修改 - update_emp_input.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/back-end/emp/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料修改:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do"
		name="form1" enctype="multipart/form-data">
		<table>
			<tr>
				<td>員工編號:<font color=red><b>*</b></font></td>
				<td><%=empVO.getEmp_ID()%></td>
			</tr>
			<tr>
				<td>員工帳號:</td>
				<td><input type="TEXT" name="emp_acc" size="45"
					value="<%=empVO.getEmp_acc()%>" /></td>
			</tr>

			<tr>
				<td>員工密碼:</td>
				<td><input type="TEXT" name="emp_pwd" size="45"
					value="<%=empVO.getEmp_pwd()%>" /></td>
			</tr>

			<tr>
				<td>員工姓名:</td>
				<td><input type="TEXT" name="emp_name" size="45"
					value="<%=empVO.getEmp_name()%>" /></td>
			</tr>

						
			<tr>
				<td>員工大頭照:</td>
				<td><input type="file" name="emp_pic" size="45" id="doc"
					onchange="javascript:setImagePreview();" /></td>
			</tr>


		</table>
		<div id="localImag">
			<img id="preview" width=-1 height=-1 style="diplay: none" />
		</div>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="emp_ID" value="<%=empVO.getEmp_ID()%>">
		<input type="submit" value="送出修改">
	</FORM>


</body>
</html>