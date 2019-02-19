<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cust.model.*"%>

<%
  CustVO custVO = (CustVO) request.getAttribute("custVO"); //CustServlet.java (Concroller) 存入req的custVO物件 (包括幫忙取出的custVO, 也包括輸入資料錯誤時的custVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>員工資料修改 - update_cust_input.jsp</title>

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
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>員工資料修改 - update_cust_input.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="cust.do" name="form1">
<table>
	<tr>
				<td>會員帳號:</td>
				<td><input type="TEXT" name="cust_acc" size="45"
					value="<%=custVO.getCust_ID()%>" /></td>
			</tr>
		
			<tr>
				<td>會員密碼:</td>
				<td><input type="TEXT" name="cust_pwd" size="45"
					value="<%=custVO.getCust_pwd()%>" /></td>
			</tr>
			
			<tr>
				<td>會員姓名:</td>
				<td><input type="TEXT" name="cust_name" size="45"
					value="<%=custVO.getCust_name()%>" /></td>
			</tr>
			
			<tr>
				<td>會員身分證字號:</td>
				<td><input type="TEXT" name="cust_pid" size="45"
					value="<%=custVO.getCust_pid()%>" /></td>
			</tr>
			
			<tr>
				<td>會員性別:</td>
				<td><input type="text" name="cust_sex" size="45"
					value="<%=custVO.getCust_sex()%>" /></td>
			</tr>
			
			<tr>
				<td>會員生日:</td>
				<td><input type="date" name="cust_brd" size="45"
					/></td>
			</tr>
			
			<tr>
				<td>會員電話:</td>
				<td><input type="TEXT" name="cust_tel" size="45"
					value="<%=custVO.getCust_tel()%>" /></td>
			</tr>
			
			<tr>
				<td>會員地址:</td>
				<td><input type="TEXT" name="cust_addr" size="45"
					value="<%=custVO.getCust_addr()%>" /></td>
			</tr>
			
			<tr>
				<td>會員信箱:</td>
				<td><input type="TEXT" name="cust_mail" size="45"
					value="<%=custVO.getCust_mail()%>" /></td>
			</tr>
			
			<tr>
				<td>會員暱稱:</td>
				<td><input type="TEXT" name="cust_niname" size="45"
					value="<%=custVO.getCust_niname()%>" /></td>
			</tr>
			
			<tr>
				<td>會員大頭照:</td>
				<td><input type="file" name="cust_pic" size="45"
					 /></td>
			</tr>
			

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="custno" value="<%=custVO.getCust_ID()%>">
<input type="submit" value="送出修改"></FORM>
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

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
        $('#f_date1').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:false,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '<%=custVO.getCust_brd()%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
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
</html>