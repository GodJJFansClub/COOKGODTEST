<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="foodMallSvc" class="com.foodMall.model.FoodMallService"/>
<jsp:useBean id="foodSvc" class="com.food.model.FoodService"/>
<jsp:useBean id="foodSupSvc" class="com.foodSup.model.FoodSupService" />
<html>
<head>
</head>
<body>
	<jsp:include page="/froTempl/header.jsp" flush="true" />
		<div class="container">
				<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
				    Button with data-target
				 </button>
				<div class="collapse" id="collapseExample" >
				<div class="card card-body">
				  <c:forEach var="shopItem" items="${shoppingCart}" >
				  	
					  
					    <span class="input-group-text">${foodSupSvc.getOneFoodSup(shopItem.food_sup_ID).food_sup_name}</span>
					    <span class="input-group-text">${foodSvc.getOneFood(shopItem.food_ID).food_name}</span>
					    <span class="input-group-text">${shopItem.food_od_stotal}</span>
					    <span class="input-group-text">${shopItem.food_od_qty}</span>
					    
					    	
					    	<input type="hidden" name="food_sup_ID" value="${shopItem.food_sup_ID}">
					    	<input type="hidden" name="food_ID" value="${shopItem.food_ID}">
					    	<input type="hidden" name="action" value="delCartItem">
					</c:forEach>
					  </div>
					
				  
				 </div> 
				<p>
			  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
				    Button with data-target
				  </button>
				</p>
				<div class="collapse" id="collapseExample">
				  <div class="card card-body">
				    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
				  </div>
				</div>
			<div class="row">
				<c:forEach var="foodMallVO" items="${foodMallSvc.all}" varStatus="s">
					<div class="col-3">
						<div id="foodMCard${s.index}" class="card foodMCard">
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
				    			<form>
				    				<button type="button" name="foodMBtn" class="btn btn-primary">加入購物車</button>
				    				<input type="hidden" name="food_ID" value="${foodMallVO.food_ID}">
				    				<input type="hidden" name="food_sup_ID" value="${foodMallVO.food_sup_ID}">
				    				<input type="hidden" name="food_m_price" value="${foodMallVO.food_m_price}">
				    				<input type="number"   name="food_od_qty" min="1" max="20" size="3" value="1">
				    			</form>
				    			<p class="card-text errorMsgs"></p>
				  			</div>
						</div>
	            	</div>
				</c:forEach>
	         </div>
	    </div>
	    <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-end">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                       <a class="page-link" href="#" aria-label="Next">
                           <span aria-hidden="true">&raquo;</span>
                       </a>
                </li>
             </ul>
        </nav>
	<jsp:include page="/froTempl/footer.jsp" flush="true" />
	<script>
		$(document).ready(function(){
			$(".foodMCard").click(function(eventData){
				if(eventData.target.name == "foodMBtn"){
					let foodMNames = getfoodMNames($(this).find(".shopUse"));
					
					$.ajax({
						 type:"POST",
						 url: "<%=request.getContextPath()%>/mall/mall.do",
						 data: crtQryStrFoodM( $(this).attr("id") , "addFoodMShoppingCart", $(this).find("form").serializeArray()),
						 dataType: "json",
						 success: function (data){
							 console.log(data);
							 if($("#"+data["foodMCardID"])){
								 $("#"+data["foodMCardID"]).find(".errorMsgs").text(data["efood_od_qty"]);	 
							 }else{
								 cartItem( $("#mallShoppingCart"), foodMNames);
							 }
							 
					     },
			             error: function(errdata){
			            	alert("ajax 錯誤");
			            	console.log(errdata);
			             }
			         });
				}
			});
			
			$(".delFromCart").click(function(eventData){
				console.log($(this).parent());
			});
		});
		
		function crtQryStrFoodM( foodMCardID , action, foodMArr){
			
			let queryString = { "foodMCardID":foodMCardID , "action":action };
			let foodMArrLen = foodMArr.length;
			for(let i = 0; i < foodMArrLen; i++){
				queryString[foodMArr[i].name] = foodMArr[i].value;
			}
			
			return queryString;
		}
		
		function getfoodMNames(shopUseClass){
			
			console.log(shopUseClass);
			let shopUseClassLen = shopUseClass.length;
			let foodMNames = {};
			
			for(let i = 0; i < shopUseClassLen; i++){
				foodMNames[shopUseClass[i].className.split(" ",3)[2]] = shopUseClass[i].innerText;
			}
			
			return foodMNames;
		}
		
		//function cartItem( $("#mallShoppingCart"), foodMNames){
			
		//}
		
	</script>
</body>
</html>