<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="foodSupSvc" class="com.foodSup.model.FoodSupService"/>
<jsp:useBean id="foodSvc" class="com.food.model.FoodService"/>
<html>
<head>
</head>
<body>
	<jsp:include page="/froTempl/header.jsp" flush="true" />

	 <!-- ##### Contact Area Start #####-->
    <section class="contact-area section-padding-100">
    
    	<div>
    		食材供應商 : ${foodSupSvc.getOneFoodSup(foodMallVO.food_sup_ID).food_sup_name}
    	</div>
    	<div>
    		標題 : ${foodMallVO.food_m_name}
    	</div>
    	<div>
    		食材名 : ${foodSvc.getOneFood(foodMallVO.food_sup_ID).food_name}
    	</div>
    	<div>
    		價格 : ${foodMallVO.food_m_price}
    	</div>
    	<div>
    		單位 : ${foodMallVO.food_m_unit}
    	</div>
    	<div>
    		產地 : ${foodMallVO.food_m_place}
    	</div>
    	<div>
    		<img src="<%=request.getContextPath()%>/foodMall/foodMall.do?food_sup_ID=${foodMallVO.food_sup_ID}&food_ID=${foodMallVO.food_ID}">
    	</div>
    	<div>
    		評價 : ${foodMallVO.food_m_rate}
    	</div>
    </section>
    <!-- ##### Contact Area End #####-->

	<jsp:include page="/froTempl/footer.jsp" flush="true" />
</body>
</html>