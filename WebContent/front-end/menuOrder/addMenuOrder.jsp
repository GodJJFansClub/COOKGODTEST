<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.menuOrder.model.*"%>

<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<title>Hello, Bootstrap!</title>
</head>
<body>
	<div class="card"
		style="width: 32rem; background-color: #D4E6F1; margin: 10px;">
		<div class="card-body text-center">
			<h5 class="card-title">新增套餐訂單_addMenuOrder.jsp</h5>
			<a href="index.jsp" class="card-link">回首頁</a>
		</div>
	</div>
	<%--Error Message --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red;font-size:20px;">Error:</font>
		<ul>
		    <c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<form method = "post" action = "menuOrder.do" name = "insertMenuOrderForm">						
		<table>
			<tr>
				<td>預約日期:</td>
				<td><input name="menu_od_book" id="book_time" type="text"/></td><td>${errMsgs.menu_od_book}</td>
			</tr>
			<jsp:useBean id="custSvc" scope="page" class="com.cust.model.CustService" />
			<tr>
				<td>顧客編號:<font color=red><b>*</b></font></td>
				<td><select size="1" name="cust_ID">
					<c:forEach var="custVO" items="${custSvc.all}">
						<option value="${custVO.cust_ID}" ${(menuOrderVO.cust_ID==custVO.cust_ID)? 'selected':'' } >${custVO.cust_ID}
					</c:forEach>
				</select></td>
			</tr>
			<jsp:useBean id="chefSvc" scope="page" class="com.chef.model.ChefService" />
			<tr>
				<td>主廚編號:<font color=red><b>*</b></font></td>
				<td><select size="1" name="chef_ID">
					<c:forEach var="chefVO" items="${chefSvc.all}">
						<option value="${chefVO.chef_ID}" ${(menuOrderVO.chef_ID==chefVO.chef_ID)? 'selected':'' } >${chefVO.chef_ID}
					</c:forEach>
				</select></td>
			</tr>
			<jsp:useBean id="menuSvc" scope="page" class="com.menu.model.MenuService" />
			<tr>
				<td>套餐編號:<font color=red><b>*</b></font></td>
				<td><select size="1" name="menu_ID">
					<c:forEach var="menuVO" items="${menuSvc.all}">
						<option value="${menuVO.menu_ID}" ${(menuOrderVO.menu_ID==menuVO.menu_ID)? 'selected':'' } >${menuVO.menu_ID}
					</c:forEach>
				</select></td>
			</tr>
		</table>
		<input type="hidden" name="action" value="insert">
		<input type="submit" value="新增訂單">		
	</form>
	
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
	</script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"	crossorigin="anonymous">
	</script>
	<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous">
	</script>
</body>

<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->
<% 
  java.sql.Timestamp menu_od_book = null;
  try {
	    menu_od_book = java.sql.Timestamp.valueOf(request.getParameter("menu_od_book").trim());
   } catch (Exception e) {
	    menu_od_book = null;
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#book_time').datetimepicker({
 	       theme: '',              //theme: 'dark',
	       timepicker:true,       //timepicker:true,
	       step: 30,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d H:i:s' ,         //format:'Y-m-d H:i:s',
		   //value: '<%=menu_od_book%>' , // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           minDate:               '-1969-12-25', // 去除今日(不含)之前
           maxDate:               '+1970-04-01'  // 去除今日(不含)之後
        });
</script>
</html>