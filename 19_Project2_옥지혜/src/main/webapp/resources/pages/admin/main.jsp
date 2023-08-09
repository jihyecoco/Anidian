<!DOCTYPE html>
<%@page import="com.anidain.ani.AniDAO"%>
<%@page import="com.anidian.board.BoardDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>		
<%@ include file="sideBar.jsp"%>
<%@ include file="wrapper.jsp"%>
<%
String conPath = request.getContextPath();
String imgPath = conPath +"/images/";

BoardDAO bdao = BoardDAO.getInstance();
AniDAO adao = AniDAO.getInstance();
%>
<div class="row">
	<div class="col-md-12 grid-margin">
		<div class="row">
			<div class="col-12 col-xl-8 mb-4 mb-xl-0">
				<h3 class="font-weight-bold">Admin </h3>
				<h6 class="font-weight-normal mb-0">
					<span class="text-primary"><b>anidain</b> =  animal + guardian</span>
				</h6>
			</div>
			<!-- 날짜 영역설정 -->
			<div class="col-12 col-xl-4">
				<div class="justify-content-end d-flex"">
					<div class="dropdown flex-md-grow-1 flex-xl-grow-0">
						<button class="btn btn-sm btn-light bg-white dropdown-toggle"
							type="button" id="dropdownMenuDate2" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="true">
							<i class="mdi mdi-calendar"></i>
							<%
							LocalDate now = LocalDate.now();
							String dayOfWeek = now.getDayOfWeek().toString();
							switch (dayOfWeek) {
							case "MONDAY":
								dayOfWeek = "월";
								break;
							case "TUESDAY":
								dayOfWeek = "화";
								break;
							case "WEDNESDAY":
								dayOfWeek = "수";
								break;
							case "THURSDAY":
								dayOfWeek = "목";
								break;
							case "FRIDAY":
								dayOfWeek = "금";
								break;
							case "SATURDAY":
								dayOfWeek = "토";
								break;
							case "SUNDAY":
								dayOfWeek = "일";
							}//switch
							%>
							<%=now%>&nbsp;
							<%=dayOfWeek%>
						</button>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="dropdownMenuDate2">
							<a class="dropdown-item" href="#">January - March</a> <a
								class="dropdown-item" href="#">March - June</a> <a
								class="dropdown-item" href="#">June - August</a> <a
								class="dropdown-item" href="#">August - November</a>
						</div>`
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- //row -->
<!-- 우측 4개의 grid 미니화면 -->
<div class="row">
	<div class="col-md-6 grid-margin stretch-card">
		<div class="card tale-bg">
			<div class="card-people mt-auto">
				<!-- <img src="images/dashboard/people.svg" alt="people"> -->
				<h1>관리자 페이지</h1>
			</div>
		</div>
	</div>
	<div class="col-md-6 grid-margin transparent">
		<div class="row">
			<div class="col-md-6 mb-4 stretch-card transparent">
				<div class="card card-tale">
					<div class="card-body">
						<h4 class="mb-4">확인해야할 동물 숫자</h4>
							<%
							int scc_cnt = adao.getAniByStateCount_c();
							%>
							<p class="fs-30 mb-2"><%= scc_cnt%>마리</p>
							<a
								href="<%=request.getContextPath()%>/resources/pages/users/aniList.jsp">
								더 많은 정보 확인
							</a>
					</div>
				</div>
			</div>
			<div class="col-md-6 mb-4 stretch-card transparent">
				<div class="card card-dark-blue">
					<div class="card-body">
						<p class="mb-4">
							피드백 : 게시판을 넣어도 좋을 듯! <br> <br>방문자수
						</p>
						<p class="fs-30 mb-2">select</p>
						select해서 카운트해보자
						<p>
							비율을 구하는 자리,,가능하다면해보기<br>22.00% (30 days)
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 mb-4 mb-lg-0 stretch-card transparent">
				<div class="card card-light-blue">
					<div class="card-body">
						<p class="mb-4">보호자를 찾은 동물</p>
						<p class="fs-30 mb-2">select</p>
						select해서 카운트해보자
						<p>
							비율을 구하는 자리,,가능하다면해보기<br>22.00% (30 days)
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 stretch-card transparent">
				<div class="card card-light-danger">
					<div class="card-body">
						<p class="mb-4">
							<a
								href="<%=request.getContextPath()%>/resources/pages/users/findAni.jsp">
								보호자를 찾고있어요 </a>
						</p>
						<p class="fs-30 mb-2">select</p>
						select해서 카운트해보자
						<p>
							비율을 구하는 자리,,가능하다면해보기<br>22.00% (30 days)
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>
<!-- //row -->

<%@ include file="footer.jsp"%>
