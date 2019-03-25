<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cust.model.CustVO,com.broadcast.model.BroadcastVO"%>
<jsp:useBean id="broadcastSvc" scope="page"
	class="com.broadcast.model.BroadcastService" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>Pixel - Digital Agency HTML Template</title>

<!-- Favicon -->
<link rel="icon"
	href="<%=request.getContextPath()%>/froTempl/temp/img/core-img/favicon.ico">

<!-- Stylesheet -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/froTempl/temp/style.css">
<link
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css"
	rel="stylesheet">

</head>

<body>
	<script
		src="<%=request.getContextPath()%>/publibrary/ckeditor4/ckeditor.js"></script>
	<!-- Preloader -->
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="lds-ellipsis">
			<div></div>
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>

	<!-- ##### Header Area Start ##### -->
	<header class="header-area">
		<!-- Navbar Area -->
		<div class="pixel-main-menu" id="sticker">
			<div class="classy-nav-container breakpoint-off">
				<div class="container-fluid">
					<!-- Menu -->
					<nav class="classy-navbar justify-content-between" id="pixelNav">

						<!-- Nav brand -->
						<a href="<%=request.getContextPath()%>/front-end/index.jsp"
							class="nav-brand"><img
							src="<%=request.getContextPath()%>/froTempl/temp/img/core-img/logo.png"
							alt=""></a>

						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span><span></span><span></span></span>
						</div>

						<!-- Menu -->
						<div class="classy-menu">

							<!-- Close Button -->
							<div class="classycloseIcon">
								<div class="cross-wrap">
									<span class="top"></span><span class="bottom"></span>
								</div>
							</div>

							<!-- Nav Start -->
							<div class="classynav">
								<ul>
									<li><a
										href="<%=request.getContextPath()%>/front-end/index.jsp">首頁</a></li>

									<li><a style="font-weight: bold">食神來了</a>
										<ul class="dropdown">
											<li><a
												href="<%=request.getContextPath()%>/front-end/chef/listAllChef.jsp">瀏覽主廚</a></li>
											<li><a
												href="<%=request.getContextPath()%>/front-end/menu/menu.jsp">嚴選套餐</a></li>
										</ul></li>

									<li><a style="font-weight: bold">食神配送</a>
										<ul class="dropdown">
											<li><a
												href="<%=request.getContextPath()%>/front-end/festMenu/listFestMall.jsp">節慶主題</a></li>
											<li><a
												href="<%=request.getContextPath()%>/front-end/foodMall/listFoodMall.jsp">嚴選食材</a></li>
										</ul></li>

									<c:if test="${not empty chefVO.chef_ID}">
										<li><a href="#" style="font-weight: bold">主廚專區</a>
											<ul class="dropdown">
												<li><a href="<%=request.getContextPath()%>/front-end/chef/updateChefResume.jsp">主廚資料管理</a></li>
												<li><a href="<%=request.getContextPath()%>/front-end/festMenu/select_page.jsp">節慶主題料理管理</a></li>
												<li><a href="<%=request.getContextPath()%>/front-end/chefDish/addChefDish.jsp">擅長菜色管理</a></li>
												<li><a href="<%=request.getContextPath()%>/front-end/chefSch/addChefSch.jsp">主廚排程管理</a></li>
												<li><a href="#">訂單管理</a>
													<ul class="dropdown">
														<li><a href="<%=request.getContextPath()%>/front-end/menuOrder/unCheckMenuOrder.jsp">未審核訂單</a></li>
														<li><a href="<%=request.getContextPath()%>/front-end/menuOrder/unFinishedMenuOrder.jsp">已審核訂單</a></li>
														<li><a href="<%=request.getContextPath()%>/front-end/menuOrder/FinishedMenuOrder.jsp">已完成訂單</a></li>
													</ul>
												</li>
											</ul>
										</li>
									</c:if>
									<c:if test="${not empty foodSupVO.food_sup_ID}">
										<li><a style="font-weight: bold">食材供應商專區</a>
											<ul class="dropdown">
												<li><a
													href="<%=request.getContextPath()%>/front-end/foodSup/addFoodMall.jsp">新增食材商品</a></li>
												<li><a
													href="<%=request.getContextPath()%>/front-end/foodSup/listFoodMallsByFoodSupID.jsp">食材商品管理</a></li>
												<li><a
													href="<%=request.getContextPath()%>/front-end/foodSup/MFSupODs.jsp">訂單管理</a></li>
												<li><a >廣告管理</a>
													<ul class="dropdown">
														<li><a href="<%=request.getContextPath()%>/front-end/ad/addAd.jsp">新增廣告</a></li>
														<li><a href="<%=request.getContextPath()%>/front-end/ad/listAllAd.jsp">所有廣告</a></li>
													</ul></li>
											</ul></li>
									</c:if>
									<c:if test="${not empty custVO.cust_ID}">
										<li><a style="font-weight: bold">會員專區</a>
											<ul class="dropdown">
												<c:choose>
													<c:when
														test="${empty foodSupVO.food_sup_ID and not empty custVO.cust_ID and empty chefVO.chef_ID}">
														<li><a
															href="<%=request.getContextPath()%>/front-end/cust/listOneCust.jsp">查看個人資料</a></li>
														<li><a
															href="<%=request.getContextPath()%>/front-end/cust/update_cust_input.jsp">編輯個人資料</a></li>
													</c:when>
													<c:when test="${not empty foodSupVO.food_sup_ID}">
														<li><a
															href="<%=request.getContextPath()%>/front-end/foodSup/foodSupInfo.jsp">查看食材供應商資料</a></li>
														<li><a
															href="<%=request.getContextPath()%>/front-end/foodSup/update_foodSup_input.jsp">編輯食材供應商資料</a></li>
													</c:when>
													<c:when
														test="${not empty custVO.cust_ID and not empty chefVO.chef_ID}">
														<li><a
															href="<%=request.getContextPath()%>/front-end/chef/chef_profile.jsp">查看個人資料</a></li>
													</c:when>
												</c:choose>
												<li><a
													href="<%=request.getContextPath()%>/front-end/menuOrder/listAllMenuOrderByCustID.jsp">套餐訂單管理</a></li>
												<li><a
													href="<%=request.getContextPath()%>/front-end/cust/listCOR.jsp">食材訂單管理</a></li>
											</ul></li>
									</c:if>

									<c:if test="${not empty custVO.cust_ID}">
										<li><a>Hello:<font style="font-weight: bold" color=#ea7500> 
												<c:if test="${not empty custVO.cust_niname}">
													${custVO.cust_niname}
												</c:if>
												<c:if test="${empty custVO.cust_niname}">
													${custVO.cust_name}
												</c:if> </font>您好
												</a></li>
												<li><a><i class="fa fa-dribbble"></i><span
														class="badge badge-danger">${broadcastSvc.countSelect(custVO.cust_ID)}</span></a>
													<ul class="dropdown">
														<c:forEach var="broadcastVO"
															items="${broadcastSvc.getOneBroadcastByCustID(custVO.cust_ID)}">
															<li><a>${broadcastVO.broadcast_con}</a></li>
														</c:forEach>
														<c:if
															test="${empty broadcastSvc.getOneBroadcastByCustID(custVO.cust_ID)}">
															<li><a>目前尚無訊息</a></li>
														</c:if>
													</ul></li>
												<li><FORM id="frontLogOutBTN" METHOD="get"
														action="<%=request.getContextPath()%>/front-end/logout.do">
														<button type="button" class="btn btn-danger"
															id="alertLogOutBTN">登出</button>
													</FORM></li>
									</c:if>
									<c:if test="${empty custVO.cust_ID}">
										<li><a>加入我們</a>
											<ul class="dropdown">
												<li><a
													href="<%=request.getContextPath()%>/front-end/login/addCust.jsp">成為顧客</a></li>
												<li><a
													href="<%=request.getContextPath()%>/front-end/login/addChef.jsp">成為主廚</a></li>
												<li><a
													href="<%=request.getContextPath()%>/front-end/login/addFoodSup.jsp">成為食材供應商</a></li>
											</ul></li>
										<li><a
											href="<%=request.getContextPath()%>/front-end/loginFrontEnd.jsp">請登入</a></li>
									</c:if>
								</ul>


								<!-- Top Social Info -->
								<div class="top-social-info ml-5"></div>
							</div>
							<!-- Nav End -->
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- ##### Header Area End ##### -->


	<!-- ##### Contact Area End #####-->




	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">Modal
						title</h5>
				</div>
				<div id="newBroMessage" class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### All Javascript Script ##### -->
	<!-- jQuery-2.2.4 js -->
	<script
		src="<%=request.getContextPath()%>/froTempl/temp/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script
		src="<%=request.getContextPath()%>/froTempl/temp/js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script
		src="<%=request.getContextPath()%>/froTempl/temp/js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script
		src="<%=request.getContextPath()%>/froTempl/temp/js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script src="<%=request.getContextPath()%>/froTempl/temp/js/active.js"></script>
	<script
		src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
</body>

<c:if test="${not empty custVO.cust_name}">
	<jsp:useBean id="custVO" scope="session" type="com.cust.model.CustVO" />
	<script>
			var MyPoint = "/BroadcastWebSocket";
			var host = window.location.host;
			var webCtx = '<%=request.getContextPath()%>';
			var userID = '<%=custVO.getCust_ID()%>';
		var endPointURL = "ws://" + host + webCtx + "/" + MyPoint + "/"
				+ userID;

		var statusOutput = document.getElementById("statusOutput");
		var webSocket;
		$(document).ready(function() {
			connect();
		});
		// 觸發connect()時註冊方法, 並建立WebSocket物件

		function connect() {
			//	建立 websocket 物件
			webSocket = new WebSocket(endPointURL);

			webSocket.onopen = function(event) {

			};

			//	隨然我是在連線建立好時傳送訊息(ServerWebSocket), 依舊會觸發這個onmessage

			webSocket.onmessage = function(event) {
				$("#newBroMessage").text(event.data);
				let newMsgModal = $('#myModal').modal('show');
			};

			webSocket.onclose = function(event) {

			};
		}
		function sendMessage() {

		}

		function disconnect() {
			webSocket.close();
		}
	</script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		var btn = document.getElementById("alertLogOutBTN");
		btn.onclick = function() {
			swal({
				title : "Good job!",
				text : "You clicked the button!",
				icon : "success",
				buttons : {
					confirm : {
						text : "OK",
						value : true,
						visible : true,
						className : "",
						closeModal : true
					}
				},

			}, $("#frontLogOutBTN").submit())
		};
	</script>
</c:if>

</html>