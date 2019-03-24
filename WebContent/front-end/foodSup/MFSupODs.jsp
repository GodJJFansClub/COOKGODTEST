<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="foodSupSvc" class="com.foodSup.model.FoodSupService"/>
<jsp:useBean id="foodMallSvc" class="com.foodMall.model.FoodMallService"/>
<jsp:useBean id="foodSvc" class="com.food.model.FoodService"/>
<jsp:useBean id="foodOrService" class="com.foodOrder.model.FoodOrderService"/>
<html>
<head>
<style>

/* :: 12.0 Blog Area CSS */
.breadcrumb-area1 {
	position: relative;
	z-index: 1;
	width: 100%;
	height: 380px;
	padding: 0 35px;
}

@media only screen and (min-width: 992px) and (max-width: 1199px) {
	.breadcrumb-area1 {
		height: 300px;
	}
}

@media only screen and (min-width: 768px) and (max-width: 991px) {
	.breadcrumb-area1 {
		height: 280px;
	}
}

@media only screen and (max-width: 767px) {
	.breadcrumb-area1 {
		height: 250px;
	}
}

.breadcrumb-area1::after {
	content: '';
	position: absolute;
	width: 100%;
	height: 100%;
	z-index: -1;
	top: 0;
	left: 0;
	background-color: rgba(163, 163, 163, 0.3);
}

.breadcrumb-area1 .breadcrumb-content {
	text-align: center;
}

.breadcrumb-area1 .breadcrumb-content h2 {
	color: #ffffff;
	font-size: 60px;
	font-weight: 600;
	text-transform: capitalize;
	margin-bottom: 0;
	display: inline-block;
}

@media only screen and (min-width: 992px) and (max-width: 1199px) {
	.breadcrumb-area1 .breadcrumb-content h2 {
		font-size: 42px;
	}
}

@media only screen and (min-width: 768px) and (max-width: 991px) {
	.breadcrumb-area1 .breadcrumb-content h2 {
		font-size: 36px;
	}
}

@media only screen and (max-width: 767px) {
	.breadcrumb-area1 .breadcrumb-content h2 {
		font-size: 24px;
	}
}
</style>

</head>
<body>
	<jsp:include page="/froTempl/header.jsp" flush="true" />
	<!-- ##### Breadcrumb Area Start ##### -->
	<br>
	<br>
	<br>
	<br>
	<section class="breadcrumb-area1 bg-img bg-overlay jarallax"
		style="background-image: url(<%=request.getContextPath()%>/froTempl/temp/img/bg-img/foodSupPic.jpg);">
		<div class="container-fluid h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<div class="breadcrumb-content">
						<h2 style="font-weight: bold">食材供應商專區-訂單管理</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ##### Breadcrumb Area End ##### -->
    <table class="table table-striped">
	  <thead>
	    <tr>
	      <th scope="col">訂單編號</th>
	      <th scope="col">標題</th>
	      <th scope="col">食材名稱</th>
	      <th scope="col">數量</th>
	      <th scope="col">小計</th>
	      <th scope="col">評價</th>
	      <th scope="col">狀態</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:forEach var="foodODVO" items="${foodSupSvc.getFoodODByFood_sup_ID(foodSupVO.food_sup_ID)}" varStatus="foodODIn">
	    <tr>
	      <td>${foodODVO.food_or_ID}</td>
	      <td>${foodMallSvc.getOneFoodMall(foodSupVO.food_sup_ID, foodODVO.food_ID).food_m_name}</td>
	      <td>${foodSvc.getOneFood(foodODVO.food_ID).food_name}</td>
	      <td>${foodODVO.food_od_qty}</td>
	      <td>${foodODVO.food_od_stotal}</td>
	      <td>${foodODVO.food_od_rate}</td>
	      <td>
	      	<form action="<%=request.getContextPath()%>/foodOrDetail/foodOrDetail.do" method="post">
	      		<input type="hidden" name="food_or_ID" value="${foodODVO.food_or_ID}">
	      		<input type="hidden" name="food_sup_ID" value="${foodSupVO.food_sup_ID}">
	      		<input type="hidden" name="food_ID" value="${foodODVO.food_ID}">
	      		<input type="hidden" name="food_od_status" value="${(foodODVO.food_od_status eq 'd0')?'d1':''}">
	      		<input type="hidden" name="action" value="fsUpdateFoodODstatus">
	      		<button type="button" id="checkSBtn${foodODIn.index}" class="checkToSend" ${(foodODVO.food_od_status eq 'd0')?'':'disabled'}>
	      			<c:choose>
	      				<c:when test="${foodODVO.food_od_status eq 'd2'}">
	      					 已到食材中心
	      				</c:when>
	      				<c:otherwise>
	      					${foodODStatusMap[foodODVO.food_od_status]}
	      				</c:otherwise>
	      			</c:choose>
	      		</button>
	      	</form>
	      </td>
	    </tr>
	    </c:forEach>
	</table>
    
    
    <!-- ##### Contact Area End #####-->
	<script>
		$(document).ready(function(){
			$(".checkToSend").click(function(even){
				let btnID = even.target.id;
				$.ajax({
					type:"POST",
					url:"<%=request.getContextPath()%>/foodOrDetail/foodOrDetail.do",
					data:$(this).parent("form").serialize(),
					dataType:"json",
					success: function(data){
						console.log(data.food_od_status);
						if(data.food_od_status==="d1"){
							$("#"+btnID).attr('disabled','true');
							$("#"+btnID).text("已出貨");
						}
					},
					error:function(errdata){
						alert("ajax 錯誤" + errdata);
						console.log(errdata);
					}
				});
			});	
		});
		
		
		
	</script>
</div>
								</div>
							</div>

						</div>
		</section>
		<!-- ##### Contact Area End #####-->



	</section>
	<jsp:include page="/froTempl/footer.jsp" flush="true" />
</body>
</html>