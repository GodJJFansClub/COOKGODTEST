<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>

</head>
<body>
	<aside class="left-sidebar" data-sidebarbg="skin5">
	<br><br>
	<!-- Sidebar scroll-->
	<div class="scroll-sidebar">
		<!-- Sidebar navigation-->
		<nav class="sidebar-nav">
			<ul id="sidebarnav">
				<li class="sidebar-item"><a
					class="sidebar-link waves-effect waves-dark sidebar-link"
					href="<%=request.getContextPath()%>/listAllFoodSup.jsp" aria-expanded="false"> <i
						class="mdi mdi-av-timer"></i> <span class="hide-menu">列出所有的食材供應商</span>
				</a></li>
				<li class="sidebar-item"><a
					class="sidebar-link waves-effect waves-dark sidebar-link"
					href="<%=request.getContextPath()%>/listAllFoodMall.jsp" aria-expanded="false"> <i
						class="mdi mdi-av-timer"></i> <span class="hide-menu">列出所有的食材商城商品</span>
				</a></li>

			</ul>
		</nav>
		<!-- End Sidebar navigation -->
	</div>
	<!-- End Sidebar scroll-->
	</aside>

</body>
</html>