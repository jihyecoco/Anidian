<!DOCTYPE html>
<%@page import="com.anidain.abandAniShelter.AniShelterBean"%>
<%@page import="com.anidain.abandAniShelter.AniShelterDAO"%>
<%@page import="com.anidian.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.anidian.board.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ include file="../sideBar.jsp"%>
<%@ include file="../wrapper.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");	
	
	//한 페이지에 출력할 레코드 수
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat();//특정 문자열 포맷으로 날짜를 얻고 싶을 때(yyyy-MM-dd hh:mm:ss)
	
	// 페이지 링크를 클릭한 번호 / 현재 페이지
	//pageNum : 현재 내가 선택해서 보고자하는 페이지의 페이지번호
	String pageNum = request.getParameter("pageNum");//pageNum이 null이 아닐 때 처리
	//pageNum이 null이면 첫페이지로 설정.
	if(pageNum == null ){
		pageNum = "1";
	}
	//String pageNum ->Integer.parseInt(연산하기위해서 변환)-> int currentPage 
	
	//몇번째 페이지를 선택했는가에 따라 start와 end의 값이 달라진다.
	
	// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
	int currentPage = Integer.parseInt(pageNum);
	// 해당 페이지에서 시작할 레코드 / 마지막 레코드
	// 첫 행의 번호를 계산(각 페이지마다 맨 위의 행 번호를 계산)
	int startRow = (currentPage-1) * pageSize + 1;
	
	//BoardDao 객체생성
	AniShelterDAO asdao = AniShelterDAO.getInstance();
	
	//레코드 갯수 카운트( 데이터베이스에 저장된 총 갯수)
	int count = asdao.getAniShlCount();
	//System.out.println("count : "+count);

	//전체 레코드 select
	ArrayList<AniShelterBean> lists = null;
	if(count>0){
		lists = asdao.getAllAniShl();
	}
	
	int number = count-(currentPage-1) * pageSize;

%>
<!-- div col-lg-12 grid-margin stretch-card (틀)-->
<div class="col-lg-12 grid-margin stretch-card">
	<!-- count==0 | div table-responsive -->
	<div class="table-responsive">
	
	<%
	if(count==0){//Board_ani 테이블의 레코드가 없을 때
	%>
	</div>	
	<!-- //count==0 | div table-responsive -->
	<Table>
		<tr>
			<td align="center">
				게시판에 저장된 글이 없습니다.
			</td>
		</tr>
	</Table>

	<%	
	}else {//Board_ani 테이블의 레코드가 있을 때
	%>
	<!-- count>0 | div table-responsive -->
	<div class="table-responsive ">	
	<table border="1" class="table table-hover">
		<tr height="30" align="center" bgcolor="#d3e8ff">
			<th>번호</th>
			<th>보호소 이름</th>
			<th>보호소 연락처</th>
			<th>보호소 위치</th>
		</tr>
	
		<% 
		for(int i=0;i<lists.size();i++){
		%>
		<tr height="20" align="center" >
			<td>
			<%= i+1%>
			</td> 
			<td><%=lists.get(i).getCareNm() %></td>
			<td><%=lists.get(i).getCareTel() %></td>
			<td><%=lists.get(i).getCareAddr() %></td>
		</tr>
		
		<%}//for %>
		</table>
	
	<!-- 페이징처리 -->
	<div class="table-responsive" align="center" style="line-height: 5">
	<%
		}//else
		
		//페이징 처리
	
		if(count>0){
			int totalPage = count /pageSize + (count%pageSize ==0 ? 0 : 1);
			 
			int pageLength = 3;
			int startPage = ((currentPage-1) / pageLength * pageLength )+1;
			int endPage = startPage + pageLength -1;
			
			if(totalPage<endPage){//totalPage(필요한 페이지 수)<endPage(보여줄 페이지의 끝) 
				endPage = totalPage;
			};
			
			//[이전], prev
			// 페이지 블록수보다 startPage가 클경우 이전 링크 생성
			if(startPage>pageLength){//첫 페이지가 페이지블럭 단위보다 커야 [이전] 버튼을 등장시킨다.
			%>
				<a href="<%=request.getContextPath() %>/resources/pages/users/board/board_main.jsp?pageNum=<%= startPage-3%>">[이전]</a>
			<%	
			}//if end
				
			// 페이지 블럭 번호
			// [startPage][-][endPage]
			for(int i=startPage; i<=endPage; i++){
			%>
				<a href="<%=request.getContextPath() %>/resources/pages/users/board/board_main.jsp?pageNum=<%= i%>">[<%= i%>]</a>
			<%
			}//for end
			
			// 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
			// [다음], next
			if(endPage < totalPage){//총 페이지 수가 endPage보다 클 때 [다음] 버튼 등장시킨다.
			%>
				<a href="<%=request.getContextPath() %>/resources/pages/users/board/board_main.jsp?pageNum=<%= startPage+3%>">[다음]</a>
			<%	
			}
			
		}//if(count>0) end
		
	%>
	</div>	
	<!-- //페이징처리 -->
	</div>
	<!-- //count>0 | div table-responsive -->
</div>
<!-- div col-lg-12 grid-margin stretch-card (틀)-->
