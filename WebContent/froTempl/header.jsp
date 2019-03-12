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
	<!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <%--<header class="header-area"> --%>
    <header >
        <!-- Navbar Area -->
        <div class="pixel-main-menu" id="sticker">
            <div class="classy-nav-container breakpoint-off">
                <div class="container-fluid">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="pixelNav">

                        <!-- Nav brand -->
                        <a href="index.html" class="nav-brand"><img src="img/core-img/logo.png" alt=""></a>

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
                                        </div>
                                    </li>
                                    <li><a href="contact.html">Contact</a></li>
                                </ul>

                                <!-- Top Social Info -->
                                <div class="top-social-info ml-5">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-dribbble"></i></a>
                                    <a href="#"><i class="fa fa-flickr"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-linkedin"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->

	<div id="statusOutput"></div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        	收到通知訊息
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>

</body>
<script>

	
		var MyPoint = "/BroadcastWebSocket";
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
				$('#myModal').modal('show');
				updateStatus("收到新的訊息");
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