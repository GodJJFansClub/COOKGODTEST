<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.chef.model.*"%>
<%@ page import="com.chefSch.model.*"%>

<%	
	ChefSchService chefSchSvc = new ChefSchService();
	ChefVO chefVO = (ChefVO)session.getAttribute("chefVO"); 
	String chef_ID = chefVO.getChef_ID();
	List<ChefSchVO> listAll = chefSchSvc.getAllChefSchByID(chef_ID);
	pageContext.setAttribute("listAll", listAll);
%>

<html>
<head>
<title>主廚排程管理</title>
</head>
<body>
	<jsp:include page="/froTempl/header.jsp" flush="true" />
	<jsp:include page="/froTempl/headerChef.jsp" flush="true" />
	<!-- #####  Start ##### -->
		<div class="container-fliud">
			<div class="row">
				<div class="col-1"></div>
				<div class="col-3" style="font-family:Microsoft JhengHei;">
					<form method="post" action="<%=request.getContextPath() %>/chefSch/chefSch.do">
						<div class="form-group">
							<label style="font-size:14px;font-weight:bolder;font-family: Microsoft JhengHei;">請選擇可接單日期</label> 
							<input name="chef_sch_date" class="form-control" id="sch_date" type="text" autocomplete="off" />${errMsgs.chef_sch_date}
						</div>
						<input type="hidden" name="chef_ID" value="${chefVO.chef_ID}"> 
						<input type="hidden" name="action" value="insert"> 
						<input type="submit" class="btn btn-success btn-lg btn-block" value="新增排程">
					</form>
					<%--Error Message --%>
					<c:if test="${not empty errorMsgs}">
						<font style="color: red; font-size: 20px;">Error:</font>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li style="color: red">${message}</li>
							</c:forEach>
						</ul>
					</c:if>
				</div>
				<div class="col-7" style="font-family:Microsoft JhengHei;">
					<%@ include file="page1.file"%>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">排程日期</th>
								<th scope="col">當天狀態</th>
								<th scope="col">刪除排程</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="chefSchVO" items="${listAll}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">
								<tr>
									<th scope="row">${chefSchVO.chef_sch_date}</th>
									<td>
										<c:if test="${chefSchVO.chef_sch_status=='c0'}">閒置</c:if>
										<c:if test="${chefSchVO.chef_sch_status=='c1'}">預定</c:if>
									</td>
									<td>
										<c:if test="${chefSchVO.chef_sch_status=='c1'}">
											<form method="post" action="<%=request.getContextPath()%>/chefSch/chefSch.do">
												<input type="hidden" name="chef_ID" value="${chefSchVO.chef_ID}"> 
												<input type="hidden" name="chef_sch_date" value="${chefSchVO.chef_sch_date}"> 
												<input type="hidden" name="action" value="delete">
												<input type="submit" class="btn btn-secondary" value="刪除" disabled>
											</form>
										</c:if>
										<c:if test="${chefSchVO.chef_sch_status=='c0'}">
											<form method="post" action="<%=request.getContextPath()%>/chefSch/chefSch.do">
												<input type="hidden" name="chef_ID" value="${chefSchVO.chef_ID}"> 
												<input type="hidden" name="chef_sch_date" value="${chefSchVO.chef_sch_date}"> 
												<input type="hidden" name="action" value="delete">
												<input type="submit" class="btn btn-danger" value="刪除">
											</form>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<%@ include file="page2.file"%>
				</div>
				<div class="col-1"></div>
			</div>
		</div>
	<!-- #####  End #####-->
	<jsp:include page="/froTempl/footer.jsp" flush="true" />
</body>
<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->
<% 
  java.sql.Timestamp chef_sch_date = null;
  try {
	  	chef_sch_date = java.sql.Timestamp.valueOf(request.getParameter("chef_sch_date").trim());
   } catch (Exception e) {
	    chef_sch_date = null;
   }
%>

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
        $('#sch_date').datetimepicker({
 	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       //step: 30,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d' ,         //format:'Y-m-d H:i:s',
		   //value: '<%=chef_sch_date%>' , // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           minDate:               '-1969-12-25', // 去除今日(不含)之前
           maxDate:               '+1970-03-01'  // 去除今日(不含)之後
        });
</script>
</html>