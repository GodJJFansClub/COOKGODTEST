<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.menu.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  MenuVO menuVO = (MenuVO) request.getAttribute("menuVO");   
  %>

<html>
<head>

<title>單一菜色查詢</title>

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
	width: 870px;
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

<table id="table-1">
	<tr><td>
		 <h3>菜色瀏覽</h3>
		 
	</td></tr>
</table>

<table class="myTable">
	<tr>
		<th>菜色編號</th>
		<th>菜色名稱</th>
		<th>菜色照片</th>
		<th>菜色介紹</th>
		<th>菜色價格</th>
		<th>菜色狀態</th>
		<th>審核</th>
		<th>刪除</th>
	</tr>
	<tr>
		<td><%=menuVO.getMenu_ID()%></td>
		<td><%=menuVO.getMenu_name()%></td>
		<td><%=menuVO.getMenu_resume()%></td>
		<td><img src ="<%=request.getContextPath()%>/menu/menu.do?menu_ID=${menuVO.menu_ID}"  width="300" height="200"></td>
		<td><%=menuVO.getMenu_status()%></td>
		<td><%=menuVO.getMenu_price()%></td>
		
		
		<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/menu/menu.do" style="margin-bottom: 0px;">
			     <input type="submit" value="審核">
			     <input type="hidden" name="menu_ID"  value="${menuVO.menu_ID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/menu/menu.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="menu_ID"  value="${menuVO.menu_ID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		
	</tr>
</table>

</body>
</html>