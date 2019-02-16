<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<title>MenuOrder</title>
<body>

<div style="font-size:30px;width:500px;height:100px;background-color:#D4E6F1;text-align:center;">MenuOrder</div>

<%--Error Message--%>
<c:if test = "${not empty errorMsgs} }">
	<font style="color:red;font-size:30px;">Error</font>
	<ul>
	<c:forEach var="errMsgs" items="${errorMsgs}">
		<li style="color:red;">${errMsgs}</li>
	</c:forEach>
	</ul>
</c:if>
<ul>
	<li><a href='ListAllMenuOrder.jsp'>List_All_Menu_Oredr</a></li>
</ul>

</body>
</head>
</html>