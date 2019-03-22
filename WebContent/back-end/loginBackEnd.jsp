<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cust.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=Big5">
<title>後台login</title>
</head>
<body>
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<jsp:include page="/back-endTemplate/header.jsp" flush="true"/>
		<aside class="left-sidebar" data-sidebarbg="skin5">
<%--==============<jsp:include page="/back-end/XXXX/sidebar.jsp" flush="true" />=================================--%>
		
		</aside>
		<div class="page-wrapper">
			<div class="page-breadcrumb">
<%--=================================工作區================================================--%>

		<center>
			<form action="<%=request.getContextPath()%>/back-end/login.do" method="post">
				
					<table border=1>
						<tr>
							<td colspan=2>
								<p align=center>
									輸入<b>後台登入</b>:<br> 
									
							</td>
						</tr>
		
						<tr>
							<td>
								<p align=right>
									<b>account:</b>
							</td>
							<td>
								<p>
									<input type=text name="account" value="" size=15>
							</td>
						</tr>
		
						<tr>
							<td>
								<p align=right>
									<b>password:</b>
							</td>
							<td>
								<p>
									<input type=password name="password" value="" size=15>
							</td>
						</tr>
		
		
						<tr>
							<td colspan=2 align=center>
								
									<input type=submit value="  ok   ">
								
							</td>
						</tr>
					</table>
			</form>
		</center>
<%--=================================工作區================================================--%>			
				<jsp:include page="/back-endTemplate/footer.jsp" flush="true" />
<%--=================================jQuery===============================================--%>
			</div>
		</div>
	</div>
</body>
</html>