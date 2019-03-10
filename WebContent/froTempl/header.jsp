<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cust.model.CustVO" %>
<jsp:useBean id="custVO" scope="session" class="com.cust.model.CustVO"/>
<html>
<head>
	<link rel="stylesheet"
	href="<%=request.getContextPath()%>/froTempl/templ/style.css">
	<!-- ##### Footer Area Start ##### -->

    <!-- ##### All Javascript Script ##### -->

</head>
<body onload="connect();" onunload="disconnect();">
	<!-- jQuery-2.2.4 js -->
    <script src="<%=request.getContextPath()%>/froTempl/templ/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="<%=request.getContextPath()%>/froTempl/templ/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="<%=request.getContextPath()%>/froTempl/templ/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="<%=request.getContextPath()%>/froTempl/templ/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="<%=request.getContextPath()%>/froTempl/templ/js/active.js"></script>
	<!-- ##### Header Area Start ##### -->
	<header class="header-area">
	    <!-- Navbar Area -->
	    <div class="pixel-main-menu" id="sticker">
	        <div class="classy-nav-container breakpoint-off">
	            <div class="container-fluid">
	                <!-- Menu -->
	                <nav class="classy-navbar justify-content-between" id="pixelNav">
	
	                    <!-- Nav brand -->
	                    <a href="index.html" class="nav-brand">
	
	                    <!-- Navbar Toggler -->
	                    <div class="classy-navbar-toggler">
	                        <span class="navbarToggler"><span></span><span></span><span></span></span>
	                    </div>
	
	                    <!-- Menu -->
	                    <div class="classy-menu">
	
	                        <!-- Close Button -->
	                        <div class="classycloseIcon">
	                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
	                        </div>
	
	                        <!-- Nav Start -->
	                        <div class="classynav">
	                            <ul>
	                                <li><a href="index.html">Home</a></li>
	                                <li><a href="about.html">About</a></li>
	                                <li><a href="services.html">Services</a></li>
	                                <li><a href="portfolio.html">Pages</a>
	                                    <ul class="dropdown">
	                                        <li><a href="index.html">Home</a></li>
	                                        <li><a href="about.html">About Us</a></li>
	                                        <li><a href="services.html">Services</a>
	                                            <ul class="dropdown">
	                                                <li><a href="index.html">Home</a></li>
	                                                <li><a href="about.html">About Us</a></li>
	                                                <li><a href="services.html">Services</a></li>
	                                                <li><a href="portfolio.html">Portfolio</a>
	                                                    <ul class="dropdown">
	                                                        <li><a href="index.html">Home</a></li>
	                                                        <li><a href="about.html">About Us</a></li>
	                                                        <li><a href="services.html">Services</a></li>
	                                                        <li><a href="portfolio.html">Portfolio</a></li>
	                                                        <li><a href="contact.html">Contact</a></li>
	                                                        <li><a href="elements.html">Elements</a></li>
	                                                    </ul>
	                                                </li>
	                                                <li><a href="contact.html">Contact</a></li>
	                                                <li><a href="elements.html">Elements</a></li>
	                                            </ul>
	                                        </li>
	                                        <li><a href="portfolio.html">Portfolio</a></li>
	                                        <li><a href="contact.html">Contact</a></li>
	                                        <li><a href="elements.html">Elements</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#">Mega</a>
	                                    <div class="megamenu">
	                                        <ul class="single-mega cn-col-4">
	                                            <li><a href="index.html">Home</a></li>
	                                            <li><a href="about.html">About Us</a></li>
	                                            <li><a href="services.html">Services</a></li>
	                                            <li><a href="portfolio.html">Portfolio</a></li>
	                                            <li><a href="contact.html">Contact</a></li>
	                                            <li><a href="elements.html">Elements</a></li>
	                                        </ul>
	                                        <ul class="single-mega cn-col-4">
	                                            <li><a href="index.html">Home</a></li>
	                                            <li><a href="about.html">About Us</a></li>
	                                            <li><a href="services.html">Services</a></li>
	                                            <li><a href="portfolio.html">Portfolio</a></li>
	                                            <li><a href="contact.html">Contact</a></li>
	                                            <li><a href="elements.html">Elements</a></li>
	                                        </ul>
	                                        <ul class="single-mega cn-col-4">
	                                            <li><a href="index.html">Home</a></li>
	                                            <li><a href="about.html">About Us</a></li>
	                                        </ul>
	                                        <ul class="single-mega cn-col-4">
	                                            <li><a href="index.html">Home</a></li>
	                                            <li><a href="about.html">About Us</a></li>

	                                        </ul>
	                                    </div>
	                                </li>
	                                <li><a href="contact.html">Contact</a></li>
	                            </ul>
	
	                            <!-- Top Social Info -->
	                            <div class="top-social-info ml-5">
	                                <a href="#"><i class="fa fa-facebook"></i></a>
	                                <a href="#"><i class="fa fa-dribbble"></i></a>
	                            </div>
	                        </div>
	                        <!-- Nav End -->
	                    </div>
	                </nav>
	            </div>
	        </div>
	    </div>
	</header>
	<div role="alert" aria-live="assertive" aria-atomic="true" class="toast" data-autohide="false">
	  <div class="toast-header">
	    <img src="..." class="rounded mr-2" alt="...">
	    <strong class="mr-auto">Bootstrap</strong>
	    <small>11 mins ago</small>
	    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
	      <span aria-hidden="true">&times;</span>
	    </button>
	  </div>
	  <div id="broadcastRcver" class="toast-body">
	  </div>
	</div>

	<div id="statusOutput"></div>


</body>
<script>

	
		var MyPoint = "/BroadCastServer";
		var host = window.location.host;
		var webCtx = '<%=request.getContextPath()%>';
		var userID = '<%=custVO.getCust_ID()%>';
		var endPointURL = "ws://" + host + webCtx + "/" + MyPoint + "/" + userID;
	
		var statusOutput = document.getElementById("statusOutput");
		var webSocket;

		// 觸發connect()時註冊方法, 並建立WebSocket物件
		function connect() {
			//	建立 websocket 物件
			webSocket = new WebSocket(endPointURL);
	
			webSocket.onopen = function(event) {
				updateStatus("WebSocket 成功連線");
				
			};
	
			//	隨然我是在連線建立好時傳送訊息(ServerWebSocket), 依舊會觸發這個onmessage
	
			webSocket.onmessage = function(event) {
				var broadcastRcver = document.getElementById("broadcastRcver");
				broadcastRcver.innerText = broadcastRcver.innerText + event.data;
				$('#element').toast('show');
			};
	
			webSocket.onclose = function(event) {
	
			};
		}
	
		function sendMessage() {
	
		}
	
		function disconnect() {
			webSocket.close();
		}
	
		function updateStatus(newStatus) {
			statusOutput.innerHTML = newStatus;
		}
</script>
</html>