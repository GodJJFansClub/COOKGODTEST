<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.foodMall.model.*" %>
<%@ page import="java.util.Map" %>
<%
	FoodMallVO foodMallVO = (FoodMallVO) request.getAttribute("foodMallVO");
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>新增食材商品</title>
	<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<style>
		table#table-1 {
			background-color: #CCCCFF;
		    border: 2px solid black;
		    text-align: center;
		}
		table#table-1 h4 {
		    color: red;
		    display: block;
		    margin-bottom: 1px;
		}
		h4 {
		    color: blue;
		    display: inline;
		}
	</style>
	<style>
		table {
			width: 450px;
			background-color: white;
			margin-top: 1px;
			margin-bottom: 1px;
		}
		table, th, td {
		    border: 0px solid #CCCCFF;
		}
		th, td {
		    padding: 1px;
		}
	</style>
</head>
<body>
	<table id="table-1">
		<tr><td>
			 <h3>食材商城新增 - addFoodMall.jsp</h3></td><td>
			 <h4><a href="<%=request.getContextPath()%>/front-end/foodSupManaMall/select_page.jsp">回首頁</a></h4>
		</td></tr>
	</table>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<form method="post" action="<%=request.getContextPath()%>/foodSupManaMall/foodSupManaMall.do" name="form1" enctype="multipart/form-data">
		<table>
		<tr>
			<td>食材商城名稱:</td>
			<td><input type="TEXT" name="food_m_name" size="45" 
				 value="<%= (foodMallVO==null)? "蔬果" : foodMallVO.getFood_m_name()%>" /></td>
		</tr>
		<tr>
			<td>商品狀態:</td>
			<td>
			<select size="1" name="food_m_status">
				<c:forEach var="statusStr" items="${statusMapStr}">
					<option value="${statusStr.key}" ${(foodMallVO.food_m_status == statusStr.key)?'selected':''} >${statusStr.value}
				</c:forEach>
			</select>

		</tr>
		<tr>
			<td>商品價格:</td>
			<td><input type="TEXT" name="food_m_price" size="45"
				 value="<%= (foodMallVO==null)? "10000" : foodMallVO.getFood_m_price()%>" /></td>
		</tr>
		<tr>
			<td>單位:</td>
			<td>
				<select size="1" name="food_m_unit">
					<c:forEach var="foodUnit" items="${foodUnitMap}">
						<option value="${foodUnit.key}" ${(foodMallVO.food_m_unit == foodUnit.key)? 'selected':'' } >${foodUnit.value}
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>產地:</td>
			<td><input type="TEXT" name="food_m_place" size="45"
				 value="<%= (foodMallVO==null)? "台灣" : foodMallVO.getFood_m_place()%>" /></td>
		</tr>
	
		<jsp:useBean id="foodSvc" scope="page" class="com.food.model.FoodService" />
		<tr>
			<td>食材:<font color=red><b>*</b></font></td>
			<td>
				<select size="1" name="food_ID">
					<c:forEach var="foodVO" items="${foodSvc.all}">
						<option value="${foodVO.food_ID}" ${(foodMallVO.food_ID == foodVO.food_ID)? 'selected':'' } >${foodVO.food_name}
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>食材商品照片:</td>
			<td><input type="file" name="food_m_pic" 
				 value="C:/XXX/XXX" /></td>
		</tr>
		<tr>
			<td>介紹:</td>
			<td>
				<textarea name="food_m_resume">
					<%= (foodMallVO==null)? "請介紹" : foodMallVO.getFood_m_resume()%>
				</textarea>
			</td>
		</tr>
		</table>
		<input type="hidden" name="food_sup_ID" value="${foodSupVO.food_sup_ID}">
		<input type="hidden" name="action" value="insert">
		<input type="submit" value="送出">
	</form>
	<img id="preView">
	<script>
		$(document).ready(
			function(){
				$(":file").change(
					function(){
						// file : 提供檔案的metadata
						// 	ex : 名稱, 文件大小, mimetype...
						// files : 
						//	Returns a FileList object that represents the file or 
						//  files selected with the file upload button
						if(this.files && this.files[0]){
							let reader = new FileReader();
							// 替reader註冊事件, 當reader載入完畢時,
							// 將img的屬性設為
							reader.onload = function(e){
								$('#preView').attr('src', e.target.result);
							}
							reader.readAsDataURL(this.files[0]);
						}
					}
				);
			}
		);
	</script>
	
</body>
</html>