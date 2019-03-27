<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cust.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>

<head>
<title>CA106G3</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content=" Master  Login Form Widget Tab Form,Login Forms,Sign up Forms,Registration Forms,News letter Forms,Elements"/>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<link href="<%=request.getContextPath()%>/back-end/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="//fonts.googleapis.com/css?family=Cormorant+SC:300,400,500,600,700" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

<style>
body{
text-align: center;
background: url("<%=request.getContextPath()%>/back-end/Crab.jpg") 0px 0px no-repeat;
background-size:cover;
background-attachment: fixed;
}
.padding-all{
padding:100px;
}

</style>
</head>

<body>
	<div class="padding-all">
		<div class="header">
			<font style="color:white;font-weight:bold;font-family: Microsoft JhengHei;font-size:80px;">食神來了</font>
		</div>

		<div class="design-w3l">
			<div class="mail-form-agile">
				<form  action="<%=request.getContextPath()%>/back-end/login.do" method="post" >
					<input type="text" name="account" placeholder="請輸入帳號"  style="font-family: Microsoft JhengHei;font-weight:bold; font-size:25px" required="" autocomplete="off"/>
					<input type="password"  name="password" class="padding" style="font-family: Microsoft JhengHei;font-weight:bold; font-size:25px" placeholder="請輸入密碼" required=""/>
					<input type="submit" value="登入">
				</form>
			</div>
		  <div class="clear"> </div>
		</div>
		
	</div>
</body>
</html>