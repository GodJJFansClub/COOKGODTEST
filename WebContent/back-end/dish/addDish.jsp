<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.dish.model.*"%>

<%
  DishVO dishVO = (DishVO) request.getAttribute("dishVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>



</head>

<body>
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<jsp:include page="/back-endTemplate/header.jsp" flush="true"/>
		<jsp:include page="/back-end/sideBar/dishFoodMana.jsp" flush="true" />
		<div class="page-wrapper">
			<div class="page-breadcrumb">
<%--=================================工作區================================================--%>


<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/dish/dish.do" name="form1" enctype="multipart/form-data">
<table style="border-collapse:separate; border-spacing:10px 10px;" >
	
	<tr>
		<td>菜色名稱:</td>
		<td><input type="TEXT" name="dish_name" size="42"
			 value="<%= (dishVO==null)? "請輸入菜色名稱" : dishVO.getDish_name()%>" /><br></td>
	</tr>
	
	
	<tr>
	
   		<td>菜色照片:</td>
		<td>
		<img id="preview_progressbarTW_img" src="<%=request.getContextPath()%>/images/null2.jpg"  width="300" height="200"/>
		<br>
		<input type="file" name="dish_pic" size="43" id="progressbarTWInput" 
			 	value="<%= (dishVO==null)? "請輸入照片" : dishVO.getDish_pic()%>" />
		<br>
		</td>	 
	</tr>
	
	<tr>
		<td>菜色內容:</td>
		<td><script src="<%=request.getContextPath() %>/publibrary/ckeditor4/ckeditor.js" ></script>
		<textarea rows="20" cols="40" name="dish_resume" >
		</textarea>
		<script>CKEDITOR.replace('dish_resume');</script></td>
		
	</tr>
	<tr>
		<td>菜色價格:</td>
		<td><input type="TEXT" name="dish_price" size="43"
			 value="<%= (dishVO==null)? "請輸入菜色價格" : dishVO.getDish_price()%>" /></td>
	</tr>


</table>

<script>

$("#progressbarTWInput").change(function(){

  readURL(this);

});

 

function readURL(input){

  if(input.files && input.files[0]){

    var reader = new FileReader();

    reader.onload = function (e) {

       $("#preview_progressbarTW_img").attr('src', e.target.result);

    }

    reader.readAsDataURL(input.files[0]);

  }

}

</script>

<script>
      function idwrite(name){
    	  form1.dish_name.value="麒麟深海石斑"
    	  form1.dish_price.value="1580"     	 
      }
</script>


<br>
<input type="hidden"  name="dish_status" value="D0">
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
<img src="<%=request.getContextPath()%>/images/x.png" height="20" width="20" onClick="idwrite(this)">
<%--=================================工作區================================================--%>			
				<jsp:include page="/back-endTemplate/footer.jsp" flush="true" />
<%--=================================jQuery===============================================--%>
			</div>
		</div>
	</div>
</body>
</html>