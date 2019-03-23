<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
</head>
<body>
	<jsp:include page="/froTempl/header.jsp" flush="true" />

	<!-- ##### Contact Area Start #####-->
	<section class="contact-area section-padding-100">
		<div class="container-fliud" style="margin: 100px">
			<div class="row">
				<h2>加入成功，請至信箱收信</h2>

				系統將於 <span id='timer'>3</span> 秒後，為您自動轉跳。


			</div>
		</div>
	</section>
	<!-- ##### Contact Area End #####-->



	<jsp:include page="/froTempl/footer.jsp" flush="true" />
</body>
<script type='text/javascript'>
	setTimeout('countdown()', 1000);

	function countdown() {
		var s = document.getElementById('timer');
		s.innerHTML = s.innerHTML - 1;
		if (s.innerHTML == 0)
			window.location = 'http://localhost:8081/CA106G3/front-end/index.jsp';
		else
			setTimeout('countdown()', 1000);
	}
</script>
</html>