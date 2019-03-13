<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cust.model.CustVO" %>
<jsp:useBean id="foodMallSvc" class="com.foodMall.model.FoodMallService"/>
<jsp:useBean id="foodSvc" class="com.food.model.FoodService"/>
<jsp:useBean id="foodSupSvc" class="com.foodSup.model.FoodSupService" />
<jsp:useBean id="festMenuSvc" class="com.festMenu.model.FestMenuService"/>
<jsp:useBean id="checkType" class="com.mall.controller.CheckType"/>
<% 	CustVO custVO = new CustVO();
	custVO.setCust_ID("C00001");
	session.setAttribute("custVO", custVO); %>
<html>
<head>
</head>
<body>
	
		<jsp:include page="/froTempl/header.jsp" flush="true" />
		<section class="contact-area section-padding-100">
		<div class="container">
			<a href='<%=request.getContextPath()%>/front-end/festMenu/listFestMall.jsp'>節慶主題料理</a>
			<p>
			<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseShoppingCart" aria-expanded="false" aria-controls="collapseShoppingCart">
				購物車
			</button>
			</p>
			<div class="collapse" id="collapseShoppingCart">
				<div class="card card-body">
				<table class="table">
				   <thead class="thead-dark">
					 <tr>
					    <th scope="col">標題</th>
					    <th scope="col">數量</th>
					    <th scope="col">小計</th>
					    <th scope="col">
					    	<form action="<%=request.getContextPath()%>/mall/mall.do" method="POST">
					    		<input type="hidden" name="action" value="CHECKOUTFOODMALL">
					    		<input type="submit" value="結帳" class="btn btn-dark">
					    	</form>
					    </th>
					  </tr>
				   </thead>
				   <tbody id="shopCartList">
				   <c:forEach var="shopItem" items="${shoppingCart}">
				      <tr class="shopItemT">
				      <c:if test="${checkType.getIsFOD(shopItem)}">
						  <td>${foodMallSvc.getOneFoodMall(shopItem.food_sup_ID, shopItem.food_ID).food_m_name}</td>
						  <td>${shopItem.food_od_qty}</td>
						  <td>${shopItem.food_od_stotal}</td>
						  <td>
						  	<form>
							  	<input type="hidden" name="food_sup_ID" value="${shopItem.food_sup_ID}">
							    <input type="hidden" name="food_ID" value="${shopItem.food_ID}">
							    <input type="hidden" name="action" value="delCartItem">
							  	<button id="btnDel" type="button" class="btn btn-dark shoppingCartItemDel">刪除</button>
						  	</form>
						  </td>
					  </c:if>
					  <c:if test="${!checkType.getIsFOD(shopItem)}">
						  <td>${festMenuSvc.getOneFestMenu(shopItem.fest_m_ID).fest_m_name}</td>
						  <td>${shopItem.fest_or_qty}</td>
						  <td>${shopItem.fest_or_stotal}</td>
						  <td>
						  	<form>
							    <input type="hidden" name="fest_m_ID" value="${shopItem.fest_m_ID}">
							    <input type="hidden" name="action" value="delCartItem">
							  	<button id="btnDel" type="button" class="btn btn-dark shoppingCartItemDel">刪除</button>
						  	</form>
						  </td>
					  </c:if>
					  </tr>
					</c:forEach>
						  <tr id="copyShopIF" style="display:none">
						  <td></td>
						  <td></td>
						  <td></td>
						  <td>
						  	<form>
							  	<input type="hidden">
							    <input type="hidden">
							    <input type="hidden" name="action" value="delCartItem">
							  	<button type="button" class="btn btn-dark shoppingCartItemDel">刪除</button>
						  	</form>
						  </td>	
						  </tr>
					</tbody>
				</table>
				</div>
			</div>
			<div class="row">
				<c:forEach var="foodMallVO" items='${foodMallSvc.getAllStatus("p4")}' varStatus="s">
					<div class="col-3">
						<div id="foodMCard${s.index}" class="card foodMCard listOneMall">
				  			<img src="<%=request.getContextPath()%>/foodMall/foodMall.do?food_sup_ID=${foodMallVO.food_sup_ID}&food_ID=${foodMallVO.food_ID}" class="card-img-top">
				  			<div class="card-body">
				    			<p class="card-text shopUse food_m_name">
				    				${foodMallVO.food_m_name}
				    			</p>
				    			<p class="card-text shopUse food_name">
				    				${foodSvc.getOneFood(foodMallVO.food_ID).food_name}
				    			</p>
				    			<p class="card-text shopUse food_sup_name">
				    				${foodSupSvc.getOneFoodSup(foodMallVO.food_sup_ID).food_sup_name}
				    			</p>
				    			<p class="card-text">
				    				${foodMallVO.food_m_price}
				    			</p>
				    			<form action="<%=request.getContextPath()%>/mall/mall.do" method="POST">
				    				<button type="button" name="foodMBtn" class="btn btn-primary">加入購物車</button>
				    				<input type="hidden" name="food_ID" value="${foodMallVO.food_ID}">
				    				<input type="hidden" name="food_sup_ID" value="${foodMallVO.food_sup_ID}">	
				    				<input type="number"   name="food_od_qty" min="1" max="20" size="3" value="1">
				    			</form>
				    			<p class="card-text errorMsgs"></p>
				  			</div>
						</div>
	            	</div>
				</c:forEach>
	         </div>
	    </div>
	</section>
	<jsp:include page="/froTempl/footer.jsp" flush="true" />
	<script>
		
		$(document).ready(function(){
			$(".foodMCard").click(function(eventData){
				
				if(eventData.target.name === "foodMBtn"){
					let foodMNames = getfoodMNames($(this).find(".shopUse"));
					
					$.ajax({
						 type:"POST",
						 url: "<%=request.getContextPath()%>/mall/mall.do",
						 data: crtQryStrFoodM( $(this).attr("id") , "addFoodMShoppingCart", $(this).find("form").serializeArray()),
						 dataType: "json",
						 success: function (data){
							 
							 if(data["foodMCardID"]){
								 $("#"+data["foodMCardID"]).find(".errorMsgs").text(data["cartErrorMsgs"]);	 
							 }else{
								 
								 cartItem(foodMNames, data);
							 }
							 
					     },
			             error: function(errdata){
			            	alert("ajax 錯誤");
			            	console.log(errdata);
			             }
			         });
				}
			});
			// 顯示商品詳情
			$(".listOneMall").click(function(evt){
				let mallForm = $(this).find("form");
				if(evt.target.name !== "foodMBtn"){
					let action = document.createElement("input");
					action.setAttribute("type","hidden");
					action.setAttribute("name","action");
					action.setAttribute("value","getOneDisplayFoodMall");
					mallForm.append(action);
					mallForm.submit();
				}
			});
			
			$(".delFromCart").click(function(eventData){
				console.log($(this).parent());
			});
		});
		// 產生查詢字串
		function crtQryStrFoodM( foodMCardID , action, foodMArr){
			
			let queryString = { "foodMCardID":foodMCardID , "action":action };
			let foodMArrLen = foodMArr.length;
			for(let i = 0; i < foodMArrLen; i++){
				queryString[foodMArr[i].name] = foodMArr[i].value;
			}
			
			return queryString;
		}
		// 懶得在伺服器再查詢, 所以透過此方法再加入購物商時取得對應的食材名, 標題名, 供應商名
		// 並暫存到記憶體中, 等伺服器回應時就可以一起加入到購物車
		function getfoodMNames(shopUseClass){
			
			let shopUseClassLen = shopUseClass.length;
			let foodMNames = {};
			
			for(let i = 0; i < shopUseClassLen; i++){
				foodMNames[shopUseClass[i].className.split(" ",3)[2]] = shopUseClass[i].innerText;
			}
			
			return foodMNames;
		}
		// 新增或更改已在購物車的商品
		function cartItem(foodMNames, data){
			
			let shopCartTrs = $("#shopCartList>tr");
			let shopCartLen = shopCartTrs.length;
			let food_sup_ID = data.food_sup_ID;
			let food_ID = data.food_ID;
			let isNewCartItem = true;
			
			jQuery.each( shopCartTrs, function(i, val){
				let inputArr = $(this).find("form").serializeArray();
				if(food_sup_ID === inputArr[0].value 
						&& inputArr[1].value === data.food_ID){
					$(this).children("td:eq(1)").text(data.food_od_qty);
					$(this).children("td:eq(2)").text(data.food_od_stotal);
					isNewCartItem = false;
					return;
				}
			});
			
			if(isNewCartItem){
				let shopCartItem = $("#copyShopIF").clone();
				shopCartItem.children("td:eq(0)").text(foodMNames.food_m_name);
				shopCartItem.children("td:eq(1)").text(data.food_od_qty);
				shopCartItem.children("td:eq(2)").text(data.food_od_stotal);
				shopCartItem.find(":input:eq(0)").attr('name', "food_sup_ID");
				shopCartItem.find(":input:eq(0)").attr('value', data.food_sup_ID);
				shopCartItem.find(":input:eq(1)").attr('name', "food_ID");
				shopCartItem.find(":input:eq(1)").attr('value', data.food_ID);
				shopCartItem.removeAttr('style');
				shopCartItem.removeAttr('id');
				$("#shopCartList").append(shopCartItem);
				
			}
			
			
		}
		// 發送刪除訊息
		function sendDelMsg(){
			$.ajax({
				 type:"POST",
				 url: "<%=request.getContextPath()%>/mall/mall.do",
				 data: crtQryStrFoodM( $(this).attr("id") , "addFoodMShoppingCart", $(this).find("form").serializeArray()),
				 dataType: "json",
				 success: function (data){
					 
					 if(data["foodMCardID"]){
						 ;	 
					 }else{
						delShoppingCartItem();
					 }
					 
			     },
	             error: function(errdata){
	            	alert("ajax 錯誤");
	            	console.log(errdata);
	             }
	         });
		}
		// 刪除購物車商品
		function delShoppingCartItem(){
			
		}
	</script>
</body>
</html>