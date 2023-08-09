<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String s_userId = (String)session.getAttribute("userId");//다운캐스팅

%>		
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<!-- 웹페이지의 크기가 모니터의 실제크기를 따라가도록 만든 설정(화면에 맞는 비율로 화면이 뜨도록함) -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Project2 옥지혜</title>
<!-- plugins:css -->

<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/vendors/feather/feather.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/vendors/select2/select2.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
<!-- endinject -->
<!-- Plugin css -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/js/select.dataTables.min.css">
<!-- End plugin css for this page -->
<!-- inject:css (전반적인 CSS)-->
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/images/favicon.png" />
</head>
	<!-- container-scroller -->
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->
		<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<!-- nav의 좌측 이미지 영역-->
			<div
				class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
				<a class="navbar-brand brand-logo mr-5" 
					href="<%=request.getContextPath()%>/resources/pages/main.jsp"> 
					<img src="<%=request.getContextPath()%>/resources/images/logo.png"
					class="mr-2" alt="logo" />Anidian
				</a>
			</div>
			<!-- //nav의 좌측 이미지 영역 -->
			<!-- nav의 로고 외 영역 -->
			<div
				class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
				<!-- 로그인 세션 영역 -->
				<ul class="navbar-nav ">
					<li class="nav-item nav-profile dropdown">
						<%
						try{
							
							if(s_userId == null){
							%>	
								<a class="nav-link dropdown-toggle"
									href="<%= request.getContextPath() %>/resources/pages/login.jsp"> 
									로그인
								</a>
							
							<%
							}else if(s_userId.equals("admin")){
							%>	
								<a class="text-primary fs-25 font-weight-medium nav-link dropdown-toggle"
									href="<%= request.getContextPath() %>/resources/pages/admin/main.jsp"> 
									<%= s_userId %>님
									
								</a>
								&nbsp;&nbsp;
								<a class="nav-link dropdown-toggle"
									href="<%= request.getContextPath() %>/resources/pages/logout.jsp"> 
									로그아웃
								</a>
								
							<%	
							}else{
								
							%>	
								<a class="text-primary fs-25 font-weight-medium nav-link"
									href="<%= request.getContextPath() %>/resources/pages/main.jsp"> 
								<%= s_userId %>님  	
								</a>
								&nbsp;&nbsp;
								<a class="nav-link dropdown-toggle"
									href="<%= request.getContextPath() %>/resources/pages/logout.jsp"> 
									로그아웃
								</a>
							<%	
							}
						}catch(NullPointerException e){
						System.out.println("top.jsp null");
						%>
						<script type="text/javascript">
							alert("로그인 후 이용가능합니다.");
							location.href="<%= request.getContextPath()%>/resources/pages/login.jsp";
						</script>
						<%
						}//catch
						%>	
					</li>
				</ul>
				<!-- //로그인 세션 영역 -->
			</div>
			<!-- //nav의 로고 외 영역 -->
		</nav>
		<!-- page-body-wrapper /  페이지 전반 wrapper -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_settings-panel.html -->
			<div class="theme-setting-wrapper">
				<div id="settings-trigger">
					<i class="ti-settings"></i>
				</div>
				<div id="theme-settings" class="settings-panel">
					<i class="settings-close ti-close"></i>
					<p class="settings-heading">SIDEBAR SKINS</p>
					<div class="sidebar-bg-options selected" id="sidebar-light-theme">
						<div class="img-ss rounded-circle bg-light border mr-3"></div>
						Light
					</div>
					<div class="sidebar-bg-options" id="sidebar-dark-theme">
						<div class="img-ss rounded-circle bg-dark border mr-3"></div>
						Dark
					</div>
					<p class="settings-heading mt-2">HEADER SKINS</p>
					<div class="color-tiles mx-0 px-4">
						<div class="tiles success"></div>
						<div class="tiles warning"></div>
						<div class="tiles danger"></div>
						<div class="tiles info"></div>
						<div class="tiles dark"></div>
						<div class="tiles default"></div>
					
					</div>
					<!-- color-tiles mx-0 px-4 -->
				</div>
				<!-- theme-settings -->
			</div>
			<!-- theme-setting-wrapper -->
	<!-- plugins:js -->
	<script src="vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="vendors/chart.js/Chart.min.js"></script>
	<script src="vendors/datatables.net/jquery.dataTables.js"></script>
	<script src="vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
	<script src="js/dataTables.select.min.js"></script>

	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="js/off-canvas.js"></script>
	<script src="js/hoverable-collapse.js"></script>
	<script src="js/template.js"></script>
	<script src="js/settings.js"></script>
	<script src="js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="js/dashboard.js"></script>
	<script src="js/Chart.roundedBarCharts.js"></script>
	<!-- End custom js for this page-->
	<body>

