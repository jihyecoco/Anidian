<!DOCTYPE html>
<%@page import="com.anidian.board.BoardDAO"%>
<%@page import="com.anidain.ani.AniBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.anidain.ani.AniDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
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
				<h3 class="font-weight-bold">사지말고 입양하세요!</h3>
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
						</div>
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
				      <img src="<%= imgPath%>mu.jpg" alt="이미지" width="80%">
			</div>
		</div>
	</div>
	<div class="col-md-6 grid-margin transparent">
		<div class="row">
			<div class="col-md-6 mb-4 stretch-card transparent">
				<div class="card card-tale">
					<div class="card-body">
						<h4 class="mb-4">오늘 새로 신고된 동물들</h4>
						<%
						ArrayList<AniBean> bglist = adao.getAniByBgnde();
						int ani_cnt = adao.getAniByBgndeCount();
						for(int i=0; i<bglist.size(); i++){		
						%>	
						
						<table>
							<tr>
								<td>
								<%-- <%= bglist.get(i).getHappenPlace()%> --%>
								</td>
							</tr>
							
						<%
						}
						%>
						</table>
						<p class="fs-30 mb-2"><%= ani_cnt%>마리</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 mb-4 stretch-card transparent">
				<div class="card card-dark-blue">
					<div class="card-body">
						<h4 class="mb-4">오늘 새로 작성된 게시글</h4>
						
						<%
						int brd_cnt = bdao.getArticleCountByDate();
						%>
						<p class="fs-30 mb-2"><%= brd_cnt%></p>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 mb-4 mb-lg-0 stretch-card transparent">
				<div class="card card-light-blue">
					<div class="card-body">
						<h4 class="mb-4">보호자를 찾았어요</h4>
						<%
						int sc_cnt = adao.getAniByStateCount();
						%>
						<p class="fs-30 mb-2"><%= sc_cnt%>마리</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 stretch-card transparent">
				<div class="card card-light-danger">
					<div class="card-body">
						<h4 class="mb-4">보호자를 찾고있어요</h4>
							<%
							int scf_cnt = adao.getAniByStateCount_f();
							%>
							<p class="fs-30 mb-2"><%= scf_cnt%>마리</p>
							<a
								href="<%=request.getContextPath()%>/resources/pages/users/aniList.jsp">
								더 많은 정보 확인
							</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>
<!-- //row -->
<!-- //우측 4개의 grid 미니화면  div class="row"-->
<!-- 두개의 화면,, 두개의 심장, -->

	</div>
	<!-- col-md-12 grid-margin stretch-card -->
</div>
<!-- // -->
<%@ include file="footer.jsp"%>
