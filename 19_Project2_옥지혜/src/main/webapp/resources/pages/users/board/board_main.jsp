<!DOCTYPE html>
<%@page import="com.anidian.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.anidian.board.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../top.jsp"%>
<%@ include file="../../sideBar.jsp"%>
<%@ include file="../../wrapper.jsp"%>
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
	BoardDAO bdao = BoardDAO.getInstance();
	//System.out.println("select bdao : "+bdao);
	
	//레코드 갯수 카운트( 데이터베이스에 저장된 총 갯수)
	int count = bdao.getArticleCount();
	//System.out.println("count : "+count);

	//전체 레코드 select
	ArrayList<BoardBean> lists = null;
	if(count>0){
		lists = bdao.getArticles(startRow, pageSize);
	}
	
	//조회수 Top5 레코드 select
	ArrayList<BoardBean> toplists = null;
	if(count>0){
		toplists = bdao.getArticlesTop();
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
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
		</tr>
	
		<% 
		for(int i=0;i<lists.size();i++){
		%>
		<tr height="20" align="center" >
			<td>
			<%= i+1%>
			</td> 
			<td align="left">
				<!-- 제목을 클릭하면 get방식으로 해당 PageNum을 가지고 content.jsp로 넘어감 --> 
				<%//여기는 답글 처리 포지션
					int width = 20;
					if(lists.get(i).getDepth() > 0){
						width = 20 * lists.get(i).getDepth();//bb.getDepth()가 1이면 -> wid:20
				%>  
				<%		
					}
				%>
				<a href="<%=request.getContextPath() %>/resources/pages/users/board/board_content.jsp?board_no=<%=lists.get(i).getBoard_no() %>&pageNum=<%=pageNum%>"><%=lists.get(i).getSubject() %></a>
				<%
					if(lists.get(i).getReadcount() > 20){
				%>
						 &nbsp;<img src="<%=request.getContextPath() %>/resources/images/popularity_color.png" height="10"> 
						 &nbsp;<span><font color="#F3797E" style="font-weight: bold;">HOT</font></span>
				<%	}
				%>
			</td>
			<td><%=lists.get(i).getUserId() %></td>
			<td><%=sdf.format(lists.get(i).getReg_date() )%></td>
			<td><%=lists.get(i).getReadcount() %></td>
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
	<!-- 인기글/새글 -->
	<div class="row">
		<!-- 인기글 -->
		<div class="col-md-6 grid-margin stretch-card">
			<!-- card-body -->
			<div class="card-body">	
				<div class="table-responsive">	
				<span><font color="#4747a1" size="4" style="font-weight: bold;">인기글</font></span>
				<br>
					<table  class="table-hover ">
						<% 
						for(int i=0; i<toplists.size();i++){
						%>
						<tr height="15" align="left">
							<td>
								
								
								<label class="badge badge-check"><%= i+1 %></label>&nbsp;
								<a href="<%=request.getContextPath() %>/resources/pages/users/board/board_content.jsp?board_no=<%=toplists.get(i).getBoard_no() %>&pageNum=<%=pageNum%>">
									<%=toplists.get(i).getSubject() %>
								</a>&nbsp;&nbsp;&nbsp;
								<font color="#4747a1" style="font-weight: bold;"><%= toplists.get(i).getReadcount() %></font>
							</td>
						</tr>
						<%}//for %>
					
					</table>
				</div>
				<!-- //인기글 -->
				</div>
				<!-- //card-body -->
			</div>
			<!-- //인기글 -->
			<!-- 새 글 등록 -->
			<div class="col-md-6 grid-margin stretch-card">
			<!-- card-body -->
			<div class="card-body">	
				<div class="table-responsive" align="right">
				[전체 글 : <%=count %>]&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="insertBoard_Form.jsp">
					<button class="btn btn-primary btn-icon-text">
						새 글
					</button>
					</a>
				</div>
				<!-- // 새 글 등록 -->
				</div>
				<!-- //card-body -->
			</div>
			<!-- //인기글 -->
		</div>
		<!-- //인기글/새글 -->
	</div>
	<!-- //count>0 | div table-responsive -->
</div>
<!-- div col-lg-12 grid-margin stretch-card (틀)-->
