<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cust.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=Big5">
<title>前台login</title>
</head>
<body>
	<jsp:include page="/froTempl/header.jsp" flush="true" />

	<!-- ##### Contact Area Start #####-->
	<section class="contact-area section-padding-100">
	<br>
	<br>
		<center>
			<form action="<%=request.getContextPath()%>/front-end/login.do"
				method="post">

				<table border=1>
					<tr>
						<td colspan=2>
							<p align=center>
								<b>前台登入</b>:
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
						<input type="hidden" name="action" value="cust">
						<input type=submit value="ok">

						</td>
					</tr>
				</table>
			</form>
		</center>
	</section>
	<!-- ##### Contact Area End #####-->

	<jsp:include page="/froTempl/footer.jsp" flush="true" />
</body>
</html>