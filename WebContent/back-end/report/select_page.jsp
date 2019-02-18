<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Report Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>IBM Emp: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Emp: Home</p>

<h3>資料查詢:</h3>
	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllEmp.jsp'>List</a> all Emps.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="report.do" >
        <b>輸入檢舉編號 :</b>
        <input type="text" name="report_ID">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="reportSvc" scope="page" class="com.report.model.ReportService" />
   
  <li>
     <FORM METHOD="post" ACTION="report.do" >
       <b>選擇檢舉編號 ::</b>
       <select size="1" name="report_ID">
         <%-- <c:forEach var="reportVO" items="${reportSvc.all}"> --%>
         <c:forEach var="reportVO" items="${reportSvc.all}"> 
          <option value="${reportVO.report_ID}">${reportVO.report_ID}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="report.do" >
       <b>選擇檢舉分類:</b>
       <select size="1" name="report_sort">
         <c:forEach var="reportVO" items="${reportSvc.all}" > 
          <option value="${reportVO.report_sort}">${reportVO.report_sort}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>


<h3>員工管理</h3>

<ul>
  <li><a href='addReport.jsp'>Add</a> a new Report.</li>
</ul>

</body>
</html>