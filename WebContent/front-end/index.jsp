<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cust.model.CustVO,com.ad.model.AdVO,com.chef.model.ChefVO,com.menu.model.*,com.foodMall.model.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="adSvc" class="com.ad.model.AdService"/>
<jsp:useBean id="chefSvc" class="com.chef.model.ChefService"/>
<jsp:useBean id="custSvc" class="com.cust.model.CustService"/>
<jsp:useBean id="menuSvc" class="com.menu.model.MenuService"/>
<jsp:useBean id="foodMallSvc" class="com.foodMall.model.FoodMallService"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta HTTP-EQUIV="Refresh" content="20">
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
		<div id="adWall" class="hero-slideshow owl-carousel">


			<!-- Single Slide-->
			<div class="single-slide">
				<!-- Background Image-->
				<div class="slide-bg-img bg-img"
					style="background-image: url(<%=request.getContextPath()%>/froTempl/temp/img/bg-img/1.jpg);"></div>
				<!-- Welcome Text -->
				<div class="container h-100">
					<div class="row h-100 align-items-center">
						<div class="col-12 col-lg-9">
							<div class="welcome-text">
								<h2 data-animation="fadeInUp" data-delay="300ms">
									<span>Hungry?</span><br>Ready to Order
								</h2>
								<h4 data-animation="fadeInUp" data-delay="500ms">
									See the Cook God<span></span>
								</h4>
								
							</div>
						</div>
					</div>
				</div>
			</div>  
			<div class="single-slide">
				<!-- Background Image-->
				<div class="slide-bg-img bg-img"
					style="background-image: url(<%=request.getContextPath()%>/froTempl/temp/img/bg-img/F4_2.png);"></div>
				<!-- Welcome Text -->
				<div class="container h-100">
					<div class="row h-100 align-items-center">
						<div class="col-12 col-lg-9">
							<div class="welcome-text">
								<h2 data-animation="fadeInUp" data-delay="300ms">
									<span style="color:black; font-weight:bold; font-family: Microsoft JhengHei;">嚴選四大廚神</span><br>
								</h2>
								<h3 data-animation="fadeInUp" data-delay="500ms">
									<span style="color:black; font-family: Microsoft JhengHei;" >為您服務</span>
								</h3>
							</div>
						</div>
					</div>
				</div>
			</div>  
		<c:forEach var="adVO" items="${adSvc.allNowAd}">	
			<!-- Single Slide -->
            <div class="single-slide">
                <!-- Background Image-->
                <div class="slide-bg-img bg-img" style="background-image:url(<%=request.getContextPath()%>/ad/ad.do?ad_ID=${adVO.ad_ID});"></div>
                <!-- Welcome Text -->
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12 col-lg-9">
                            <div class="welcome-text">
                                <h2 data-animation="fadeInUp" data-delay="300ms"><span>${adVO.ad_title}</span><br>In Cook God</h2>
                                <h4 data-animation="fadeInUp" data-delay="500ms">${adVO.ad_con}<span></span></h4>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
		</c:forEach>
			
		</div>
	</section>

	

	<!-- ##### Hero Area End ##### -->
	
	
	 <!-- ##### Top Catagory Area Start ##### -->
    <div class="top-catagory-area d-flex flex-wrap">
        <!-- Single Catagory -->
        <div class="single-catagory bg-img d-flex align-items-center justify-content-center jarallax" style="background-image: url(<%=request.getContextPath()%>/froTempl/temp/img/bg-img/F4_2.png);">
            <a href="<%=request.getContextPath()%>/front-end/chef/listAllChef.jsp" style="font-weight:bold"><font color='#000000' onmouseout="this.style.color ='#000000';" onmouseover="this.style.color ='#FF7B0F';" style="color:black; font-weight:bold; font-family: Microsoft JhengHei;">瀏覽主廚</font></a>
            
        </div>
        <!-- Single Catagory -->
        <div class="single-catagory bg-img d-flex align-items-center justify-content-center jarallax" style="background-image: url(<%=request.getContextPath()%>/froTempl/temp/img/bg-img/4.jpg);">
            <a href="<%=request.getContextPath()%>/front-end/chef/menu/menu.jsp" style="font-weight:bold;"><font color='#000000' onmouseout="this.style.color ='#000000';" onmouseover="this.style.color ='#FF7B0F';" style="color:black; font-weight:bold; font-family: Microsoft JhengHei;">嚴選套餐</font></a>
        </div>
    </div>
    <!-- ##### Top Catagory Area End ##### -->
    
     <!-- ##### Cool Facts Area Start ##### -->
    <section class="pixel-cool-facts-area bg-gray section-padding-100-0">
        <div class="container-fluid">
            <div class="row">

                <!-- Single Cool Facts -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact mb-100">
                        <div class="scf-icon">
                            <img src="<%=request.getContextPath()%>/froTempl/temp/img/core-img/m1.png" alt="">
                        </div>
                        <div class="scf-text">
                            <h2><span class="counter">${chefSvc.selectChefTotal}</span></h2>
                            <h6>嚴選主廚</h6>
                        </div>
                    </div>
                </div>

                <!-- Single Cool Facts -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact mb-100">
                        <div class="scf-icon">
                            <img src="<%=request.getContextPath()%>/froTempl/temp/img/core-img/m5.png" alt="">
                        </div>
                        <div class="scf-text">
                            <h2><span class="counter">${custSvc.selectCustTotal}</span></h2>
                            <h6>食神的顧客</h6>
                        </div>
                    </div>
                </div>

                <!-- Single Cool Facts -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact mb-100">
                        <div class="scf-icon">
                            <img src="<%=request.getContextPath()%>/froTempl/temp/img/core-img/m6.png" alt="">
                        </div>
                        <div class="scf-text">
                            <h2><span class="counter">${menuSvc.selectMenuTotal}</span></h2>
                            <h6>嚴選套餐</h6>
                        </div>
                    </div>
                </div>

                <!-- Single Cool Facts -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact mb-100">
                        <div class="scf-icon">
                            <img src="<%=request.getContextPath()%>/froTempl/temp/img/core-img/m7.png" alt="">
                        </div>
                        <div class="scf-text">
                            <h2><span class="counter">${foodMallSvc.selectFoodMallTotal}</span></h2>
                            <h6>嚴選食材</h6>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- ##### Cool Facts Area End ##### -->
    
     <!-- ##### Portfolio Area Start ###### -->
    <div class="pixel-portfolio-area section-padding-100-0">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms">
                        <h2 style="font-weight:bold">嚴選食材</h2>
                        <img src="<%=request.getContextPath()%>/froTempl/temp/img/core-img/x.png" alt="">
                    </div>
                </div>
            </div>
        </div>

        <!-- Portfolio Menu -->
       
        <div class="pixel-portfolio">

            <!-- Single gallery Item -->
            <div class="single_gallery_item visual wow fadeInUp" data-wow-delay="0.2s">
                <img src="<%=request.getContextPath()%>/froTempl/temp/img/bg-img/5.jpg" alt="">
                <div class="hover-content text-center d-flex align-items-center justify-content-center">
                    <div class="hover-text">
                        <a href="<%=request.getContextPath()%>/froTempl/temp/img/bg-img/5.jpg" class="zoom-img"><i class="fa fa-eye" aria-hidden="true"></i></a>
                        <h4>Branding Identity</h4>
                    </div>
                </div>
            </div>

            <!-- Single gallery Item -->
            <div class="single_gallery_item add wow fadeInUp" data-wow-delay="0.4s">
                <img src="<%=request.getContextPath()%>/froTempl/temp/img/bg-img/6.jpg" alt="">
                <div class="hover-content text-center d-flex align-items-center justify-content-center">
                    <div class="hover-text">
                        <a href="<%=request.getContextPath()%>/froTempl/temp/img/bg-img/5.jpg" class="zoom-img"><i class="fa fa-eye" aria-hidden="true"></i></a>
                        <h4>Branding Identity</h4>
                    </div>
                </div>
            </div>

            <!-- Single gallery Item -->
            <div class="single_gallery_item web wow fadeInUp" data-wow-delay="0.6s">
                <img src="<%=request.getContextPath()%>/froTempl/temp/img/bg-img/7.jpg" alt="">
                <div class="hover-content text-center d-flex align-items-center justify-content-center">
                    <div class="hover-text">
                        <a href="<%=request.getContextPath()%>/froTempl/temp/img/bg-img/5.jpg" class="zoom-img"><i class="fa fa-eye" aria-hidden="true"></i></a>
                        <h4>Branding Identity</h4>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- ##### Portfolio Area End ###### -->
	
	<jsp:include page="/froTempl/footer.jsp" flush="true" />
	<script>
	    var MyPoint = "/WebSocketForServlet";
		var host = window.location.host;
		var webCtx = '<%=request.getContextPath()%>';
		var endPointURL = "ws://" + host + webCtx + "/" + MyPoint;

		var adWebSocket;
		$(document).ready(function() {
			//adWSconnect();
			$('#adWall').owlCarousel({
	            items: 1,
	            loop: true,
	            nav: true,
	            navText: ['Prev', 'Next'],
	            dots: false,
	            autoplay: true,
	            autoplayTimeout: 10000,
	            smartSpeed: 500,
	            animateIn: 'fadeIn',
	            animateOut: 'fadeOut'
	        });
		});
		// 觸發connect()時註冊方法, 並建立WebSocket物件

		
	</script>
</body>
</html>