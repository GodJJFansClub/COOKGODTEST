<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
</head>

<body>
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<jsp:include page="/back-endTemplate/header.jsp" flush="true"/>
		<aside class="left-sidebar" data-sidebarbg="skin5">
<%--==============<jsp:include page="/back-end/XXXX/sidebar.jsp" flush="true" />=================================--%>
	<FORM METHOD="post" id="sub"
		ACTION="<%=request.getContextPath()%>/cust/cust.do"
		 name="form1" >
		 
		 <input type="hidden" name="action" value="updateCust_status">
		<input type="hidden" name="cust_ID" value="${custVO.cust_ID}">
		
	</FORM>

	
	<script >
		$(document).ready(function() {
			$('#sub').submit();
		});
	</script>
<%--=================================工作區================================================--%>			
				<jsp:include page="/back-endTemplate/footer.jsp" flush="true" />
<%--=================================jQuery===============================================--%>
			</div>
		</div>
	</div>
</body>
</html>