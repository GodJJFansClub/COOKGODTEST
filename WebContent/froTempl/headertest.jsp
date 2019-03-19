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
        <div class="hero-slideshow owl-carousel">

            
             <!-- Single Slide-->
             <div class="single-slide">
                <!-- Background Image-->
                <div class="slide-bg-img bg-img" style="background-image: url(<%=request.getContextPath()%>/froTempl/temp/img/bg-img/1.jpg);"></div>
                <!-- Welcome Text -->
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12 col-lg-9">
                            <div class="welcome-text">
                                <h2 data-animation="fadeInUp" data-delay="300ms"><span>Digital Agency</span><br>of the year 2019</h2>
                                <h4 data-animation="fadeInUp" data-delay="500ms">Visual Identity by John Doe Client: <span>Lorem ipsum</span></h4>
                                <a href="#" class="btn pixel-btn mt-50" data-animation="fadeInUp" data-delay="700ms">View Project</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
            <!-- Single Slide 廣告1-->
            <div class="single-slide">
                <!-- Background Image-->
                <div class="slide-bg-img bg-img" style="background-image: url(<%=request.getContextPath()%>/ad/ad.do?ad_ID=${adVO.ad_ID});"></div>
                <!-- Welcome Text -->
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12 col-lg-9">
                            <div class="welcome-text">
                                <h2 data-animation="fadeInUp" data-delay="300ms"><span>Digital Agency</span><br>of the year 2019</h2>
                                <h4 data-animation="fadeInUp" data-delay="500ms">Visual Identity by John Doe Client: <span>${adVO.ad_con}</span></h4>
                                <a href="#" class="btn pixel-btn mt-50" data-animation="fadeInUp" data-delay="700ms">View Project</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Slide 廣告2-->
            <div class="single-slide">
                <!-- Background Image-->
                <div class="slide-bg-img bg-img" style="background-image: url(<%=request.getContextPath()%>/ad/ad.do?ad_ID=${adVO.ad_ID});"></div>
                <!-- Welcome Text -->
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12 col-lg-9">
                            <div class="welcome-text">
                                <h2 data-animation="fadeInUp" data-delay="300ms"><span>Creative Agency</span><br>of the year 2019</h2>
                                <h4 data-animation="fadeInUp" data-delay="500ms">Visual Identity by John Doe Client: <span>${adVO.ad_con}</span></h4>
                                <a href="#" class="btn pixel-btn mt-50" data-animation="fadeInUp" data-delay="700ms">View Project</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
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