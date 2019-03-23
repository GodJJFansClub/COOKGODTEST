<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.menu.model.*"%>

<%
	MenuVO menuVO = (MenuVO) request.getAttribute("menuVO");
%>

<html>
<head>
<title>新增套餐</title>

</head>
<body>
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<jsp:include page="/back-endTemplate/header.jsp" flush="true" />
		<jsp:include page="/back-end/sideBar/dishFoodMana.jsp" flush="true" />
		<div class="page-wrapper">
			<div class="page-breadcrumb">
				<%--=================================工作區================================================--%>
				

				<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/menu/menu.do" name="form1"
					enctype="multipart/form-data">

					<table style="border-collapse:separate; border-spacing:0px 10px;" >
						<tr>
							<td>套餐名稱:</td>
							<td><input type="text" name="menu_name"
								value="${menuVO==null? '': menuVO.menu_name}" /></td>
						</tr>
						
						<tr>
							<td>套餐照片:</td>
							<td>
							<img id="preview_progressbarTW_img" src="<%=request.getContextPath()%>/images/null2.jpg"  width="300" height="200"/>
							<br>
							<input type="file" name="menu_pic" id="progressbarTWInput" />
							<br>
							</td>
						</tr>

						<tr>
							<td>套餐簡介:</td>
							<td><input type="textarea" name="menu_resume"
								value="${menuVO==null? '':menuVO.menu_resume}"
								placeholder="請輸入簡介"><script>CKEDITOR.replace('menu_resume');</script><br></td>
						</tr>

						
						<tr>
							<td>套餐價錢:</td>
							<td><input type="number" name="menu_price"
								value="${menuVO==null? '': menuVO.menu_price}" /></td>
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
    	  form1.menu_name.value="六六六大順"
    	  form1.menu_price.value="6666"     	 
      }
</script>	
					
					
					<input type="hidden" name="action" value="insert"> <input
						type="submit" value="送出新增"><br>
						<img src="<%=request.getContextPath()%>/images/x.png" height="20" width="20" onClick="idwrite(this)">
				</FORM>

				<%--=================================工作區================================================--%>
				<jsp:include page="/back-endTemplate/footer.jsp" flush="true" />
				<%--=================================jQuery===============================================--%>
			</div>
		</div>
	</div>
</body>
</html>