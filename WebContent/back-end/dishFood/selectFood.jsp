<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.dishFood.model.*,com.food.model.*"%>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Set" %>

<jsp:useBean id="dishFoodSvc" scope="page" class="com.dishFood.model.DishFoodService" />
<jsp:useBean id="foodSvc" scope="page" class="com.food.model.FoodService" />
<jsp:useBean id="dishSvc" scope="page" class="com.dish.model.DishService" />
<jsp:useBean id="gson" class="com.google.gson.Gson"/>


<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>文章新增 - addForumArt.jsp</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<style>
	
</style>

</head>
<body bgcolor='white'>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	 <script src="<%=request.getContextPath()%>/back-endTemplate/assets/libs/jquery/dist/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
		crossorigin="anonymous"></script>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-7">
				<table id="table-1" style="background-color:blue;">
					<tr>
						<td>
							<h3>菜色食材新增 - selectFood.jsp</h3>
						</td>
						<td>
							<h4>
								<a href="<%=request.getContextPath()%>/back-end/dish/select_page.jsp">回首頁</a>
							</h4>
						</td>
					</tr>
				</table>

				<h3>資料新增:</h3>

				<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
				<FORM id="chBoxForm" METHOD="post"	ACTION="<%=request.getContextPath()%>/dishFood/dishFood.do">
					<table>
						<tr>
							
							<td><h3>菜色名稱:<font color=red><b>*</b></font></h3></td>
							<td><a href="<%=request.getContextPath()%>dish/dish.do?dish_ID=${dishVO.dish_ID}&action=getDish"></a><h3>${dishVO.dish_name}</h3></td>
							
						</tr>
					</table>
						
					<h3>選擇食材:</h3>	
						<div class="container">
							<div class="row">
							<c:forEach var="food_type" items="${foodTypeMap}">
								<div class="col-sm ${food_type.key}">${food_type.value}</div>
							</c:forEach>
							</div>
						</div>
							
						<div id="foodList" class="container">
							
						</div>
						<c:choose>
						
						<c:when test="${dishFoodList.size()>0}">
								<input id="addMoreFAction" type="hidden" name="action" value="InputFood" >
								<button type="button" id="incDishFood">添加</button>
						</c:when>
						
						<c:otherwise>
								<input type="hidden" name="action" value="completeNewdishes" >
								<input type="submit" name="Sendout" value="送出新增"><br>
						</c:otherwise>
						
						</c:choose>
						
				</FORM>
				
			</div>
			<div class="col-5" style="backgoung-color:gray;"><br>
				<%if (request.getAttribute("dishFoodList")!=null){%>
       				<jsp:include page="transmitFood.jsp" />
       				<script>
       					<%List<DishFoodVO> dishFoodList = (List<DishFoodVO>) request.getAttribute("dishFoodList");%>
       					$(document).ready(function( ){
       						
       						firremove();
       						$("#incDishFood").click(function(){
       							
       							<%--	let name = $(":checked").next();
       								console.log(name);
       							$.ajax({
       								type:"post",
       								url:"<%=request.getContextPath()%>/dishFood/dishFood.do",
       								data:$(this).parent("FORM").serialize(),
       								dataType:"json",
       								success:function(data){
       									console.log(data);
       								},
       								error:function(data){
       									
       								}
       				
									});--%>
									let dishFoodForm = $("#dishFoodForm").clone();
									dishFoodForm.find("#dishAction").remove();
									
									console.log(dishFoodForm);
									let chBoxForm = $("#chBoxForm");
									chBoxForm.find("select").remove();
									console.log(chBoxForm);
									let midForm = chBoxForm.append(dishFoodForm.find(":input"));
									console.log(midForm);
									midForm.submit();
									  
									
							  });
							  
							  

						});

						function firremove() {

						let foodJsonArr =<%=gson.toJson(dishFoodList)%>;
   						console.log(foodJsonArr);
   						let FoodIDArr = $("[type='checkbox'][name='food_ID']");
	   						jQuery.each(FoodIDArr,function(){
	   							
	   							let  len = foodJsonArr.length;
	   							for(let i =0;i<len;i++){
	   								if($(this).val()=== foodJsonArr[i].food_ID){
	   									$(this).next().remove();
	   									$(this).remove();
	   								}	
	   									
	   							}
	   										
	   						});
       					}
       				
						
       				</script>
				<%} %>
			</div>
			
		</div>
	</div>

	<script>
		<%	
			Map<String, String> foodTypeMap = (Map<String, String>)application.getAttribute("foodTypeMap");
			Set<String> food_type_IDs = foodTypeMap.keySet();
			List<Set<FoodVO>> foodCatogry = new ArrayList<>();
			
			
			for(String foodKey:food_type_IDs){
				foodCatogry.add(foodSvc.getFoodsByFood_type_ID(foodKey));
			}
			
		%>
		let foodJsonObj = <%=gson.toJson(foodCatogry)%>;
		let maxLength = 0;
		let divE = document.createElement('div');
		divE.setAttribute("class", "row");
		let divCEArr = new Array(foodJsonObj.length);
		
		jQuery.each(foodJsonObj,function(foodProper){
			if(foodJsonObj[foodProper].length > maxLength){
				maxLength = foodJsonObj[foodProper].length;
			}
			divCEArr[foodProper] = document.createElement('div');
			divCEArr[foodProper].setAttribute("class", "col");
			divE.appendChild(divCEArr[foodProper]);
		});
		console.log(foodJsonObj);
		let count = 0;
		for(let i = 0; i < maxLength; i++){
			
			
			
			
			jQuery.each(foodJsonObj,function(foodProper){
				if(i < foodJsonObj[foodProper].length){
					let chE = document.createElement('input');
					chE.setAttribute("value", foodJsonObj[foodProper][i].food_ID);
					chE.setAttribute("type", "checkbox");
					chE.setAttribute("name", "food_ID");
					chE.setAttribute("id","Food"+count++);
					divCEArr[foodProper].appendChild(chE);
					let pEle = document.createElement("p");
					pEle.appendChild(document.createTextNode(foodJsonObj[foodProper][i].food_name));
					divCEArr[foodProper].appendChild(pEle);
				}
			});
			
		}
		$("#foodList").append(divE);
	</script>
	

	
</body>
</html>