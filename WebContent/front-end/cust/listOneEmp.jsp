<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.cust.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  CustVO custVO = (CustVO) request.getAttribute("custVO"); //EmpServlet.java(Concroller), �s�Jreq��custVO����
%>

<html>
<head>
<title>�|����� - listOneCust.jsp</title>

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

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>���u��� - ListOneCust.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

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
	<tr>
		<td><%=custVO.getCust_ID()%></td>
		<td><%=custVO.getCust_acc()%></td>
		<td><%=custVO.getCust_pwd()%></td>
		<td><%=custVO.getCust_name()%></td>
		<td><%=custVO.getCust_sex()%></td>
		<td><%=custVO.getCust_tel()%></td>
		<td><%=custVO.getCust_addr()%></td>
		<td><%=custVO.getCust_pid()%></td>
		<td><%=custVO.getCust_mail()%></td>
		<td><%=custVO.getCust_brd()%></td>
		<td><%=custVO.getCust_reg()%></td>
		<td><%=custVO.getCust_pic()%></td>
		<td><%=custVO.getCust_status()%></td>
		<td><%=custVO.getCust_niname()%></td>
		
	</tr>
</table>

</body>
</html>