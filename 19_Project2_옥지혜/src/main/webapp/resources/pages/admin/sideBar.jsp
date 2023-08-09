<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- admin _ sideBar -->
<!-- partial:partials/_sidebar.html  "사이드바"-->
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<ul class="nav">
		<!-- 게시판 관리 -->
		<li class="nav-item">
			<a class="nav-link" href="<%= request.getContextPath() %>/resources/pages/admin/board/board_management.jsp"> 
				<i class="icon-grid menu-icon"></i> 
				<span class="menu-title">게시판 관리</span>
			</a>
		</li>
		<!-- //게시판 관리 -->
		<!-- 회원 관리 -->
		<li class="nav-item">
			<a class="nav-link" href="<%= request.getContextPath() %>/resources/pages/admin/users/users_management.jsp"> 
				<i class="icon-paper menu-icon"></i> 
				<span class="menu-title">회원 관리</span>
			</a>
		</li>
		<!-- //회원 관리 -->
		<!-- 유기동물 관리 -->
		<li class="nav-item">
		<a class="nav-link" href="<%= request.getContextPath() %>/resources/pages/admin/ani/ani_management.jsp">
			<i class="fa fa-regular fa-paw-simple fa-bounce"></i> 
			<i class="icon-paper menu-icon"></i>
			<span class="menu-title">유기동물 관리</span>
		</a>
		</li>
		<!-- //유기동물 관리 -->
	</ul>
</nav>
<!-- //partial:partials/_sidebar.html  "사이드바"-->