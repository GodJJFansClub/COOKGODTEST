<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.chef.model.*"%>
<%@ page import="com.cust.model.*"%>
<jsp:useBean id="custSvc" class="com.cust.model.CustService"/>

<%	
	ChefService chefSvc = new ChefService();
	String chef_ID = request.getParameter("chef_ID");
	ChefVO chefVO = chefSvc.getOneByChefID(chef_ID);
	pageContext.setAttribute("chefVO",chefVO);
%>

<html>
<head>
<title>主廚檔案!</title>
<style type="text/css">
	#chef_name{
		padding:10px;
	}
	#chef_resume{
		padding:10px;
		font-size:16px;
		font-family: Microsoft JhengHei;
	}
</style>
</head>
<body>
	<jsp:include page="/froTempl/header.jsp" flush="true" />
	<jsp:include page="/froTempl/headerCookGod.jsp" flush="true" />
	<section class="contact-area section-padding-100">
		<!-- ##### Contact Area Start #####-->
		<div class="container">
			<div class="header" style="height:100px;"></div>
	  		<div class="row">
	  			<div class="col-1"></div>
		  		<div class="col-4" style="border:18px groove #EC7063;">
			  		<c:if test="${not empty custVO.cust_pic}"><img src="<%=request.getContextPath()%>/cust/cust.do?cust_ID=${custVO.cust_ID}" style="display:block; margin:auto;width:300px;height:400px;"></c:if>
					<c:if test="${empty custVO.cust_pic}"><img src="<%=request.getContextPath()%>/images/noimage.jpg" style="display:block; margin:auto;width:300px;height:400px;"></c:if>
		  		</div>
		  		<div class="col-6">
			  		<div id="chef_name"><h2 style="font-family: Microsoft JhengHei;">${custSvc.getOneCust(chefVO.chef_ID).cust_name}</h2></div>	  		
			  		<div id="chef_resume">${chefVO.chef_resume}</div>
			  		<div id="chef_avg_rate"></div>	  		
		  		</div>
		  		<div class="col-1"></div>
	  		</div>
	  		<div class="footer">
	  			<div class="container-fliud">
	  				<div class="row">
	  					<div class="col-4"></div>
	  					<div class="col-4"></div>
	  					<div class="col-4"></div>
	  				</div>
	  			</div>
	  		</div>
	  	</div>
	    <!-- ##### Contact Area End #####-->
	</section>
	<jsp:include page="/froTempl/footer.jsp" flush="true" />
</body>
</html>