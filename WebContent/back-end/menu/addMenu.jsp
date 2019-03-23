<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.menu.model.*"%>

<%
	MenuVO menuVO = (MenuVO) request.getAttribute("menuVO");
%>

<html>
<head>

<script 
  src="https://code.jquery.com/jquery-3.3.1.min.js"
   integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" 
   crossorigin="anonymous"></script> 

<title>套餐資料新增 - addMenu</title>
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
	width: 800px;
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
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<jsp:include page="/back-endTemplate/header.jsp" flush="true" />
		<aside class="left-sidebar" data-sidebarbg="skin5">
			<%--==============<jsp:include page="/back-end/XXXX/sidebar.jsp" flush="true" />=================================--%>

		</aside>
		<div class="page-wrapper">
			<div class="page-breadcrumb">
				<%--=================================工作區================================================--%>
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
				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/menu/menu.do" name="form1"
					enctype="multipart/form-data">

					<table style="border-collapse:separate; border-spacing:40px 10px;" border="1">
						<tr>
							<td>套餐名稱:</td>
							<td><input type="text" name="menu_name"
								value="${menuVO==null? '': menuVO.menu_name}" /></td>
						</tr>

						
						<tr>
							<td>套餐照片:</td>
							<td><img id="preview_progressbarTW_img" src="<%=request.getContextPath()%>/images/null2.jpg"  width="300" height="200"/>
							<input type="file" name="menu_pic"  id="progressbarTWInput" value="<%= (menuVO==null)? "請上傳照片": menuVO.getMenu_pic()%>" />
							<br></td>
						</tr>
						

						<tr>
							<td>套餐簡介:</td>
							<td>
							<script src="<%=request.getContextPath() %>/publibrary/ckeditor4/ckeditor.js" ></script>
							<textarea rows="20" cols="40" name="menu_resume" ></textarea>
							<script>CKEDITOR.replace('menu_resume');</script></td>	
								
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
    	  form1.menu_name.value="六六大順"
    	  form1.menu_price.value="6666"     	 
      }
</script>


					<div id="localImag">
						<img id="preview" width=-1 height=-1 style="display: none" />
					</div>
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