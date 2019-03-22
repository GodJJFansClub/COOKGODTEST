<%@page import="com.cust.model.CustVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
</head>
<body>
	<jsp:include page="/froTempl/header.jsp" flush="true" />
	<section class="contact-area section-padding-100">
	<%-- 錯誤列表 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
	</c:if>
		<div class="row">
			<div class="col-12">
				<div class="card card-body">
					<h4 class="card-title">結帳</h4>
					<form class="form-horizontal m-t-30" method="post" action="<%=request.getContextPath()%>/foodOrder/foodOrder.do">
						<div class="form-group">
						<label>收件人姓名</label>
						<input type="text" class="form-control" name="food_or_name"
											value="${empty foodOrderVO ? '': foodOrderVO.food_or_name}">
						</div>
						<div class="form-group">
							<label>收件地址</label>
							<input  id="addr" name="food_or_addr" class="form-control"
									type="text" value="${empty foodOrderVO ? '': foodOrderVO.food_or_addr}">
						</div>
						<div class="form-group">
							<label>收件人電話</label>
							<input type="text" name="food_or_tel" class="form-control" placeholder="09XXXXXXXX"
									value="${empty foodOrderVO ? '':foodOrderVO.food_or_tel}">
						</div>
						<div class="form-group">
							<label>卡號</label>
							<input type="number" name="credNum" class="form-control"
									value="${empty credName ? '':credName}">
						</div>
						<div class="form-group">
							<label>安全碼</label>
							<input type="number" name="credSaf" class="form-control"
									value="${empty credSaf ? '':credSaf}">
						</div>
						<div class="form-group">
							<label>到期日</label>
							<input type="text" id="credEnd" name="credEnd" class="form-control"
									value="${empty credEnd ? '':credEnd}">
						</div>
						<div class="form-group">
							<label>持卡人姓名</label>
							<input type="text" name="credName" class="form-control"
								size="10"	value="${empty credName ? '':credName}">
						</div>
							<input type="hidden" name="cust_ID" value="${custVO.cust_ID}">
							<input type="hidden" name="action" value="insertOrODs">
							<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
							<input class="btn btn-success" type="submit" value="結帳">
					</form>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/froTempl/footer.jsp" flush="true" />
	<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#credEnd').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:false,       //timepicker:true,
 	       step: 60,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '<%=request.getAttribute("credEnd")%>', // value:   new Date(),
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	//startDate:	            '2017/07/10',  // 起始日
	minDate:               '-1970-01-01', // 去除今日(不含)之前
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});

	// ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

	//      1.以下為某一天之前的日期無法選擇
	//      var somedate1 = new Date('2017-06-15');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() <  somedate1.getYear() || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});

	//      2.以下為某一天之後的日期無法選擇
	//      var somedate2 = new Date('2017-06-15');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() >  somedate2.getYear() || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});

	//      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
	//      var somedate1 = new Date('2017-06-15');
	//      var somedate2 = new Date('2017-06-25');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() <  somedate1.getYear() || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	//		             ||
	//		            date.getYear() >  somedate2.getYear() || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});
</script>
</body>
</html>