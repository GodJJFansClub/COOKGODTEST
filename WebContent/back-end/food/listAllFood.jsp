<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.food.model.*"%>

<%
    FoodService foodSvc = new FoodService();
    List<FoodVO> list = foodSvc.getAll();
    pageContext.setAttribute("list", list);
%>

<html>
<head>
<title>所有食材資料 - listAllFood.jsp</title>
<link href="../../dist/css/style.min.css" rel="stylesheet">

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


       			 <div class="col">
                        <div class="card">
                            
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">食材編號:</th>
                                            <th scope="col">食材名稱:</th>
                                            <th scope="col">食材種類:</th>
                                            <th scope="col">修改:</th>
                                        </tr>
                                    </thead>

               
                    <%@ include file="/file/page1.file"%>
                    <c:forEach var="foodVO" items="${list}" begin="<%=pageIndex%>"
                        end="<%=pageIndex+rowsPerPage-1%>">
                      
                        <tr class="foodEntiy">
                           <th scope="row">${foodVO.food_ID}</th>
                            <th scope="row">${foodVO.food_name}</th>
                            <th scope="row">${foodTypeMap[foodVO.food_type_ID]}</th>
                            <th scope="row">
                                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/food/food.do">
                                    <button id="update" type="button">修改</button>
                                    <input type="hidden" name="food_ID" value="${foodVO.food_ID}"> 
                                    <input type="hidden" id="action" name="action">
                                    <input type="hidden" id="requestURL" name="requestURL">
                                </FORM>
                            </th>
                        </tr>
                    </c:forEach>
                </table>
                 </div>
                        </div>
                    </div>
                <%@ include file="/file/page2.file"%>
                <%if (request.getAttribute("listFoodMalls_ByFood_ID") != null ) {%>
                    <jsp:include page="/back-end/food/listFoodMalls_ByFood_ID.jsp" flush="true" />
                <%}%>
<%--=================================工作區================================================--%>            
                <jsp:include page="/back-endTemplate/footer.jsp" flush="true" />
<%--=================================jQuery===============================================--%>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function(){
            $(".foodEntiy").click(function(evt){
                let foodForm = $(this).find("form");
                if(evt.target.id != "update") { 
                    foodForm.children("#requestURL").val('<%=request.getServletPath()%>');
                    foodForm.children("#action").val("listFoodMalls_ByFood_ID");
                }else{
                    foodForm.children("#action").val("getOne_For_Udate");   
                }
                foodForm.submit();
            });
        });
         
    </script>
</body>
</html>