<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cust.model.CustVO" %>
<%@ page import="com.ad.model.AdVO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Pixel - Digital Agency HTML Template</title>

    <!-- Favicon -->
    <link rel="icon" href="<%=request.getContextPath()%>/froTempl/temp/img/core-img/favicon.ico">
	
    <!-- Stylesheet -->
    <link rel="stylesheet"
	href="<%=request.getContextPath()%>/froTempl/temp/style.css">
</head>

<body>
   <jsp:include page="/froTempl/header.jsp" flush="true" />

    <!-- ##### Hero Area Start ##### -->
    <section class="hero-area">
        <div class="hero-slideshow owl-carousel">

            <!-- Single Slide -->
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

            <!-- Single Slide -->
            <div class="single-slide">
                <!-- Background Image-->
                <div class="slide-bg-img bg-img" style="background-image: url(<%=request.getContextPath()%>/froTempl/temp/img/bg-img/2.jpg);"></div>
                <!-- Welcome Text -->
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12 col-lg-9">
                            <div class="welcome-text">
                                <h2 data-animation="fadeInUp" data-delay="300ms"><span>Creative Agency</span><br>of the year 2019</h2>
                                <h4 data-animation="fadeInUp" data-delay="500ms">Visual Identity by John Doe Client: <span>Lorem ipsum</span></h4>
                                <a href="#" class="btn pixel-btn mt-50" data-animation="fadeInUp" data-delay="700ms">View Project</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
             <!-- Single Slide 廣告1 -->
            <div class="single-slide">
                <!-- Background Image-->
                <div class="slide-bg-img bg-img"  style="background-image: url(<%=request.getContextPath()%>/froTempl/temp/img/bg-img/1.jpg);"></div>
                <!-- Welcome Text -->
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12 col-lg-9">
                            <div id="ad" class="welcome-text">
                                <h2 data-animation="fadeInUp" data-delay="300ms"><span>Digital Agency</span><br>of the year 2019</h2>
                                <h4 data-animation="fadeInUp" data-delay="500ms">Visual Identity by John Doe Client: <span>Lorem ipsum</span></h4>
                                <a href="#" class="btn pixel-btn mt-50" data-animation="fadeInUp" data-delay="700ms">View Project</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- ##### Hero Area End ##### -->

    <!-- ##### Top Catagory Area Start ##### -->
    <div class="top-catagory-area d-flex flex-wrap">
        <!-- Single Catagory -->
        <div class="single-catagory bg-img d-flex align-items-center justify-content-center jarallax" style="background-image: url(<%=request.getContextPath()%>/froTempl/temp/img/bg-img/3.jpg);">
            <a href="#">Agency</a>
        </div>
        <!-- Single Catagory -->
        <div class="single-catagory bg-img d-flex align-items-center justify-content-center jarallax" style="background-image: url(<%=request.getContextPath()%>/froTempl/temp/img/bg-img/4.jpg);">
            <a href="#">What We Do?</a>
        </div>
    </div>
    <!-- ##### Top Catagory Area End ##### -->

    <!-- ##### Newsletter Area Start ###### -->
    <section class="nl-area section-padding-100-0">
        <div class="container">
            <div class="row align-items-end">
                <div class="col-12 col-md-9">
                    <div class="nl-form mb-100">
                        <h4>Stay in touch with us</h4>
                        <form action="#" method="post">
                            <input type="email" name="nl-email" id="nlEmail" placeholder="Email Address ...">
                            <button type="submit" class="d-none"></button>
                        </form>
                    </div>
                </div>
                <div class="col-12 col-md-3">
                    <div class="view-projects-btn text-right mb-100">
                        <a href="#" class="btn pixel-btn">View Project</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Newsletter Area End ###### -->

    <!-- ##### Portfolio Area Start ###### -->
    <div class="pixel-portfolio-area section-padding-100-0">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms">
                        <h2>Made by pixel</h2>
                        <img src="img/core-img/x.png" alt="">
                    </div>
                </div>
            </div>
        </div>

        <!-- Portfolio Menu -->
        <div class="pixel-projects-menu wow fadeInUp" data-wow-delay="200ms">
            <div class="text-center portfolio-menu">
                <button class="btn active" data-filter="*">All Projects</button>
                <button class="btn" data-filter=".visual">Visual</button>
                <button class="btn" data-filter=".add">Advertising</button>
                <button class="btn" data-filter=".web">Web Development</button>
            </div>
        </div>

        <div class="pixel-portfolio">

            <!-- Single gallery Item -->
            <div class="single_gallery_item visual wow fadeInUp" data-wow-delay="0.2s">
                <img src="img/bg-img/5.jpg" alt="">
                <div class="hover-content text-center d-flex align-items-center justify-content-center">
                    <div class="hover-text">
                        <a href="img/bg-img/5.jpg" class="zoom-img"><i class="fa fa-eye" aria-hidden="true"></i></a>
                        <h4>Branding Identity</h4>
                    </div>
                </div>
            </div>

            <!-- Single gallery Item -->
            <div class="single_gallery_item add wow fadeInUp" data-wow-delay="0.4s">
                <img src="img/bg-img/6.jpg" alt="">
                <div class="hover-content text-center d-flex align-items-center justify-content-center">
                    <div class="hover-text">
                        <a href="img/bg-img/5.jpg" class="zoom-img"><i class="fa fa-eye" aria-hidden="true"></i></a>
                        <h4>Branding Identity</h4>
                    </div>
                </div>
            </div>

            <!-- Single gallery Item -->
            <div class="single_gallery_item web wow fadeInUp" data-wow-delay="0.6s">
                <img src="img/bg-img/7.jpg" alt="">
                <div class="hover-content text-center d-flex align-items-center justify-content-center">
                    <div class="hover-text">
                        <a href="img/bg-img/5.jpg" class="zoom-img"><i class="fa fa-eye" aria-hidden="true"></i></a>
                        <h4>Branding Identity</h4>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- ##### Portfolio Area End ###### -->

    <!-- ##### Contact Area Start #####-->
    <section class="contact-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms">
                        <h2>Get In Touch</h2>
                        <img src="img/core-img/x.png" alt="">
                    </div>
                </div>
            </div>


            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <!-- Contact Form -->
                    <div class="contact-form-area text-center">
                        <form action="#" method="post">
                            <input type="text" name="name" class="form-control wow fadeInUp" data-wow-delay="100ms" placeholder="Name">
                            <input type="email" name="email" class="form-control wow fadeInUp" data-wow-delay="300ms" placeholder="E-mail">
                            <input type="text" name="subject" class="form-control wow fadeInUp" data-wow-delay="500ms" placeholder="Subject">
                            <textarea name="message" class="form-control wow fadeInUp" data-wow-delay="700ms" placeholder="Message"></textarea>
                            <button type="submit" class="btn pixel-btn wow fadeInUp" data-wow-delay="900ms">Send Message</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- ##### Contact Area End #####-->



    <jsp:include page="/froTempl/footer.jsp" flush="true" />
</body>
</html>