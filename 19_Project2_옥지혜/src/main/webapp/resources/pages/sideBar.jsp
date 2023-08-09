<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- partial:partials/_sidebar.html  "사이드바"-->
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<ul class="nav">
		<!--  -->
		<li class="nav-item">
			<a class="nav-link" href="<%= request.getContextPath()%>/resources/pages/users/board/board_main.jsp"> 
				<i class="icon-grid menu-icon"></i> 
				<span class="menu-title">게시판</span>
			</a>
		</li>
		<!-- // -->
		<!--  -->
		<li class="nav-item">
			<a class="nav-link" 
			href="<%= request.getContextPath()%>/resources/pages/users/abandAniShelter.jsp">
				<i class="icon-paper menu-icon"></i> 
				<span class="menu-title">보호소</span>
			</a>
		</li>
		<!-- // -->
		<!-- 발견했어요 -->
		<li class="nav-item">
		<a class="nav-link"
			href="<%= request.getContextPath()%>/resources/pages/users/findAni.jsp">
			<i class="fa fa-regular fa-paw-simple fa-bounce"></i> 
			<i class="icon-paper menu-icon"></i>
			<span class="menu-title">발견했어요</span>
		</a>
		</li>
		<!-- //발견했어요 -->
		<!-- 보호자를 찾고있어요 -->
		<li class="nav-item">
			<a class="nav-link"
				href="<%= request.getContextPath()%>/resources/pages/users/aniList.jsp">
				<i class="icon-paper menu-icon"></i> 
				<span class="menu-title">보호자를 찾고있어요</span>
			</a>
		</li>
		<!-- //보호자를 찾고있어요 -->
	</ul>
</nav>
<!-- //partial:partials/_sidebar.html  "사이드바"-->