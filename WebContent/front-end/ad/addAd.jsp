<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ad.model.*"%>

<%
	AdVO adVO = (AdVO) request.getAttribute("adVO");
	Integer i = (Integer)request.getAttribute("aaa");
%>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>廣告資料新增 - addAd.jsp</title>

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
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ad/ad.do"
		name="form1" enctype="multipart/form-data">

		<table>
			<tr>
				<td>廣告帳號:</td>
				<td><input type="TEXT" name="ad_acc" size="45"
					value="<%=(adVO == null) ? "Aa158556" : adVO.getAd_acc()%>" /></td>
			</tr>

			<tr>
				<td>廣告密碼:</td>
				<td><input type="password" name="ad_pwd" size="45"
					value="<%=(adVO == null) ? "Aa123456" : adVO.getAd_pwd()%>" /></td>
			</tr>

			<tr>
				<td>廣告姓名:</td>
				<td><input type="TEXT" name="ad_title" size="45"
					value="<%=(adVO == null) ? "teddy" : adVO.getAd_title()%>" /></td>
			</tr>

			<tr>
				<td>身分證字號:</td>
				<td><input type="TEXT" name="ad_pid" size="45"
					value="<%=(adVO == null) ? "a987654321" : adVO.getAd_pid()%>" /></td>
			</tr>

			<tr>
				<td>廣告性別:</td>
				<td> <input type="radio" name="ad_sex" size="10" value="M" 
				 ${adVO.ad_sex=='M'||adVO ==null ? 'checked':'' } />男 
					 <input type="radio" name="ad_sex" size="10" value="F"  
				${adVO.ad_sex=='F'||adVO ==null ? 'checked':'' }/>女
				</td>
			</tr>

			<tr>
				<td>廣告生日:</td>
				<td><input type="TEXT" name="ad_start" id="f_date1" size="45" /></td>
			</tr>

			<tr>
				<td>廣告電話:</td>
				<td><input type="TEXT" name="ad_tel" size="45"
					value="<%=(adVO == null) ? "09090909" : adVO.getAd_tel()%>" /></td>
			</tr>

			<tr>
				<td>廣告地址:</td>
				<td><div id="zipcode3">
					<div class="f3" data-role="county"></div>
					<div class="f4" data-role="district"></div></div>
					<input name="Address" type="text" class="f13 address form-control">
					</td>
			</tr>

			<tr>
				<td>廣告信箱:</td>
				<td><input type="TEXT" name="ad_mail" size="45"
					value="<%=(adVO == null) ? "gggccc@yahoo" : adVO.getAd_mail()%>" /></td>
			</tr>

			<tr>
				<td>廣告暱稱:</td>
				<td><input type="TEXT" name="ad_niname" size="45"
					value="<%=(adVO == null) ? "555" : adVO.getAd_niname()%>" /></td>
			</tr>

			<tr>
				<td>廣告大頭照:</td>
				<td><input type="file" name="ad_pic" size="45" id="doc"
					onchange="javascript:setImagePreview();" /></td>
			</tr>



		</table>
		<div id="localImag">
			<img id="preview" width=-1 height=-1 style="diplay: none" />
		</div>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">

	</FORM>
</body>
<%
	java.sql.Date ad_start = null;
	try {
		ad_start = adVO.getAd_start();
	} catch (Exception e) {
		ad_start = new java.sql.Date(System.currentTimeMillis());
	}
%>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="https://github.com/totobe/jQuery/blob/master/jquery.twzipcode.min.js"></script>
<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:true,       //timepicker:true,
 	       step: 60,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '${adVO.ad_start}', // value:   new Date(),
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
<script>
	function setImagePreview() {
		var docObj = document.getElementById("doc");
		var imgObjPreview = document.getElementById("preview");
		if (docObj.files && docObj.files[0]) {
			//火狐下，直接设img属性
			imgObjPreview.style.display = 'block';
			imgObjPreview.style.width = '200px';
			imgObjPreview.style.height = '120px';
			//imgObjPreview.src = docObj.files[0].getAsDataURL();
			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		} else {
			//IE下，使用滤镜
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById("localImag");
			//必须设置初始大小
			localImagId.style.width = "250px";
			localImagId.style.height = "200px";
			//图片异常的捕捉，防止用户修改后缀来伪造图片
			try {
				localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				alert("您上传的图片格式不正确，请重新选择!");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return true;
	}
</script>





</html>