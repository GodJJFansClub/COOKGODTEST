<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.dish.model.*"%>

<%
  DishVO dishVO = (DishVO) request.getAttribute("dishVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

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


				<div class="col-lg-8 col-xlg-9 col-md-7">
					<div class="card">
						<div class="card-body">
							<FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/menu/menu.do" name="form1"
								enctype="multipart/form-data"
								class="form-horizontal form-material">

								<div class="form-group">
									<label class="col-md-12">套餐名稱:</label>
									<div class="col-md-12">
										<input type="text" name="menu_name"
											value="${menuVO==null? '': menuVO.menu_name}" />
									</div>
								</div>
								<div class="form-group">
									<label for="example-email" class="col-md-12">套餐照片:</label>
									<div class="col-md-12">
										<img id="preview_progressbarTW_img"
											src="<%=request.getContextPath()%>/images/null2.jpg"
											width="300" height="200" /> <br> <input type="file"
											name="menu_pic" id="progressbarTWInput" /> <br>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-12">套餐簡介:</label>
									<div class="col-md-12">
										<input type="textarea" name="menu_resume"
											value="${menuVO==null? '':menuVO.menu_resume}"
											placeholder="請輸入簡介">
										<script>CKEDITOR.replace('menu_resume');</script>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-12">套餐價錢:</label>
									<div class="col-md-12">
										<input type="number" name="menu_price"
											value="${menuVO==null? '': menuVO.menu_price}" />
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-12">
										<button class="btn btn-success" type="submit">送出新增</button>
										<br> <input type="hidden" name="action" value="insert">
										<img src="<%=request.getContextPath()%>/images/x.png"
											height="20" width="20" onClick="idwrite(this)">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
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

				<br>

				<%--=================================工作區================================================--%>
				<jsp:include page="/back-endTemplate/footer.jsp" flush="true" />
				<%--=================================jQuery===============================================--%>
			</div>
		</div>
	</div>
</body>
</html>