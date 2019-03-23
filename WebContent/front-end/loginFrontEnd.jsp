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
	
	
	
	 <section class="contact-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms">
                        <h2>登入</h2>
                        <img src="<%=request.getContextPath()%>/froTempl/temp/img/core-img/x.png" alt="">
                    </div>
                </div>
            </div>


            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <!-- Contact Form -->
                    <div class="contact-form-area text-center">
                        <form action="<%=request.getContextPath()%>/front-end/login.do" method="post">
                           
                           <b>account:</b>
                            <input type=text name="account"  class="form-control wow fadeInUp" data-wow-delay="300ms" placeholder="請輸入帳號">
                            <b>password:</b>
                            <input  type=password name="password" class="form-control wow fadeInUp" data-wow-delay="500ms" placeholder="請輸入密碼">
                           
                          
                           <input type="hidden" name="action" value="cust">
                            
                            <button type="submit" class="btn pixel-btn wow fadeInUp" data-wow-delay="900ms">
                            Login</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- ##### Contact Area End #####-->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
	</section>
	<!-- ##### Contact Area End #####-->

	<jsp:include page="/froTempl/footer.jsp" flush="true" />
</body>
</html>