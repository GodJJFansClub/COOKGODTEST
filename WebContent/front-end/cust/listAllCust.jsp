<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cust.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    CustService custSvc = new CustService();
    List<CustVO> list = custSvc.gelAllCust();
    pageContext.setAttribute("list",list);
%>


<!DOCTYPE html>
<html>
<head>
<title>�Ҧ��|����� - listAllCust.jsp</title>

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
	width: 800px;
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

<h4>�����m�߱ĥ� EL ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�Ҧ��|����� - listAllCust.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>�|���s��</th>
		<th>�|���b��</th>
		<th>�|���K�X</th>
		<th>�|���m�W</th>
		<th>�|���m�O</th>
		<th>�|���q��</th>
		<th>�|���a�}</th>
		<th>�|�������Ҧr��</th>
		<th>email</th>
		<th>�|���ͤ�</th>
		<th>�|�����U��</th>
		<th>�j�Y��</th>
		<th>�|�����A</th>
		<th>�|���ʺ�</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="custVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${custVO.cust_ID}</td>
			<td>${custVO.cust_acc}</td>
			<td>${custVO.cust_pwd}</td>
			<td>${custVO.cust_name}</td>
			<td>${custVO.cust_sex}</td>
			<td>${custVO.cust_tel}</td>
			<td>${custVO.cust_addr}</td>
			<td>${custVO.cust_pid}</td>
			<td>${custVO.cust_mail}</td>
			<td>${custVO.cust_brd}</td>
			<td>${custVO.cust_reg}</td>
			<td>${custVO.cust_pic}</td>
			<td>${custVO.cust_status}</td>
			<td>${custVO.cust_niname}</td>
						
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/cust/cust.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="cust_ID"  value="${custVO.cust_ID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/cust/cust.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="cust_ID"  value="${custVO.cust_ID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>