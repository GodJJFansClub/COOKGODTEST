<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cust.model.CustVO"%>
<%@ page import="com.ad.model.AdVO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>Pixel - Digital Agency HTML Template</title>

<!-- Favicon -->
<link rel="icon"
	href="<%=request.getContextPath()%>/froTempl/temp/img/core-img/favicon.ico">

<!-- Stylesheet -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/froTempl/temp/style.css">
</head>

<body>
	<jsp:include page="/froTempl/header.jsp" flush="true" />


	<!-- ##### Hero Area Start ##### -->
	<section class="hero-area">
		<div id="adWallBro" class="carousel slide" data-ride="carousel">
		  <ol id="adWallOl" class="carousel-indicators">
		    <li data-target="#adWallBro" data-slide-to="0" class="active"></li>
		    <li data-target="#adWallBro" data-slide-to="1"></li>
		  </ol>
		  <div id="adWallDivs" class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="<%=request.getContextPath()%>/froTempl/temp/img/bg-img/1.jpg" class="d-block w-100" height=300 alt="">
		    </div>
		    <div class="carousel-item">
		      <img src="<%=request.getContextPath()%>/froTempl/temp/img/bg-img/2.jpg" class="d-block w-100" height=300 alt="">
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#adWallBro" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#adWallBro" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
	</section>
	<div id="hiddenClone" style="display:none">
		<li id="cloneADLi" data-target="#adWallBro" data-slide-to=""></li>
		<div id="cloneADDiv" class="carousel-item">
			  <img src="" class="d-block w-100" height=300 alt="">
		</div>
	</div>
	
	<div id="convertHtml" style="display: none"></div>
	<!-- ##### Hero Area End ##### -->
	<jsp:include page="/froTempl/footer.jsp" flush="true" />
	<script>
	    var MyPoint = "/WebSocketForServlet";
		var host = window.location.host;
		var webCtx = '<%=request.getContextPath()%>';
		var endPointURL = "ws://" + host + webCtx + "/" + MyPoint;

		var adWebSocket;
		$(document).ready(function() {
			adWSconnect();
		});
		// 觸發connect()時註冊方法, 並建立WebSocket物件

		function adWSconnect() {
			//	建立 websocket 物件
			adWebSocket = new WebSocket(endPointURL);

			adWebSocket.onopen = function(event) {

			};

			//	隨然我是在連線建立好時傳送訊息(ServerWebSocket), 依舊會觸發這個onmessage

			adWebSocket.onmessage = function(event) {
				console.log(event);
				let adWallLi = $("#cloneADLi").clone();
				let adWallDiv = $("#cloneADDiv").clone();
				let adWallmsgs = JSON.parse(event.data);
				
				$("#convertHtml").html(adWallmsgs[3].adWall);
				let drowed =$("#convertHtml");
				adWallDiv.children("img").attr("src",drowed.find("img").attr("src"));
				adWallLi.attr("data-slide-to","2");
				
				$("#adWallOl").append(adWallLi);
				$("#adWallDivs").append(adWallDiv);
			};

		}
		function adWSsendMessage() {

		}
	</script>
</body>
</html>