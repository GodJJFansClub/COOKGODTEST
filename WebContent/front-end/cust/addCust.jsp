<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cust.model.*"%>

<%
  CustVO custVO = (CustVO) request.getAttribute("custVO");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�|����Ʒs�W - addEmp.jsp</title>

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
<body bgcolor='white'>
	<h3>��Ʒs�W:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<FORM METHOD="post" ACTION="cust.do" name="form1">
		
		<table>
			<tr>
				<td>�|���b��:</td>
				<td><input type="TEXT" name="cust_acc" size="45"
					value="<%= (custVO==null)? "�d�ç�" : custVO.getCust_acc()%>" /></td>
			</tr>
		
			<tr>
				<td>�|���K�X:</td>
				<td><input type="TEXT" name="cust_pwd" size="45"
					value="<%= (custVO==null)? "�d�ç�" : custVO.getCust_acc()%>" /></td>
			</tr>
			
			<tr>
				<td>�|���m�W:</td>
				<td><input type="TEXT" name="cust_name" size="45"
					value="<%= (custVO==null)? "�d�ç�" : custVO.getCust_name()%>" /></td>
			</tr>
			
			<tr>
				<td>�|�������Ҧr��:</td>
				<td><input type="TEXT" name="cust_pid" size="45"
					value="<%= (custVO==null)? "�d�ç�" : custVO.getCust_name()%>" /></td>
			</tr>
			
			<tr>
				<td>�|���ʧO:</td>
				<td><input type="checkbox" name="cust_sex" size="45"
					value="<%= (custVO==null)? "�d�ç�" : custVO.getCust_acc()%>" /></td>
			</tr>
			
			<tr>
				<td>�|���ͤ�:</td>
				<td><input type="date" name="cust_brd" size="45"
					value="<%= (custVO==null)? "�d�ç�" : custVO.getCust_acc()%>" /></td>
			</tr>
			
			<tr>
				<td>�|���q��:</td>
				<td><input type="TEXT" name="cust_tel" size="45"
					value="<%= (custVO==null)? "�d�ç�" : custVO.getCust_acc()%>" /></td>
			</tr>
			
			<tr>
				<td>�|���a�}:</td>
				<td><input type="TEXT" name="cust_addr" size="45"
					value="<%= (custVO==null)? "�d�ç�" : custVO.getCust_acc()%>" /></td>
			</tr>
			
			<tr>
				<td>�|���H�c:</td>
				<td><input type="TEXT" name="cust_mail" size="45"
					value="<%= (custVO==null)? "�d�ç�" : custVO.getCust_acc()%>" /></td>
			</tr>
			
			<tr>
				<td>�|���ʺ�:</td>
				<td><input type="TEXT" name="cust_niname" size="45"
					value="<%= (custVO==null)? "�d�ç�" : custVO.getCust_name()%>" /></td>
			</tr>
			
			<tr>
				<td>�|���j�Y��:</td>
				<td><input type="TEXT" name="cust_pic" size="45"
					value="<%= (custVO==null)? "�d�ç�" : custVO.getCust_name()%>" /></td>
			</tr>
			


		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="�e�X�s�W">
	
	</FORM>
</body>


<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>





</script>
</html>