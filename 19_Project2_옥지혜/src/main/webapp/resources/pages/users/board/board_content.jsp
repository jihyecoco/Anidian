<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.anidian.board.BoardBean"%>
<%@page import="com.anidian.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../top.jsp"%>
<%@ include file="../../sideBar.jsp"%>
<%@ include file="../../wrapper.jsp"%>
<%
try{
	if(!s_userId.equals(null)){
	
	
	request.setCharacterEncoding("UTF-8");
	
	String board_no = request.getParameter("board_no");
	String pageNum = request.getParameter("pageNum");
	
	//싱글톤 객체 생성
	BoardDAO bdao = BoardDAO.getInstance();
	BoardBean bb = bdao.getArticleByBoard_No(board_no);
	
	out.println("board_no : "+board_no);
	out.println("pageNum : "+pageNum);
	out.println("s_userId : "+s_userId);
	out.println("bb.getUserId() : "+bb.getUserId());
	
	
	SimpleDateFormat sdf = new SimpleDateFormat();
	%>
	<form name="boardForm">
	<div class="table-responsive">
	<table border="1"  class="table table-hover">
		<input type="hidden" name="board_no" value="<%=board_no%>">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		<input type="hidden" name="userId" value="<%=bb.getUserId()%>">
		<tr>
			<td>일련번호</td>
			<td>
				<%= bb.getBoard_no() %>
			</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td> 
				<%= bb.getUserId() %>
			</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>
				<%= bb.getReadcount() %>
			</td>
		</tr>
		
		<tr>
			<td>제목</td>
			<td>
				<%= bb.getSubject()%>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="2" align="left">
				<%= bb.getContent() %>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="게시글 수정" class="btn btn-primary btn-icon-text" onClick="location.href='updateBoard_Form.jsp?board_no=<%=bb.getBoard_no()%>&pageNum=<%=pageNum%>'">
				<input type="button" value="게시글 삭제" class="btn btn-primary btn-icon-text"  onclick='deleteCheck()'>
				<input type="button" value="글목록" class="btn btn-outline-primary btn-icon-text" onclick="location.href='board_main.jsp?pageNum=<%=pageNum%>'">
			</td>
		</tr>	
		
	</table>
	
	</div>	
	</form>
	<!-- 댓글 입력하는 폼 -->
	<form action="insertComment_Proc.jsp" method="post">
	<div class="table-responsive" id="comment_box">
	<table border="1"  class="table table-hover">
	   <!--  <img id="title_comment" src="img/title_comment.gif"> -->
		<tr>
			<td>
				<textarea name="boardComment" rows="15" cols="50" placeholder="댓글입력하기">
				</textarea>
			</td>
		</tr>
	
	</table>
	</div>
	    
	</form>
	
	<%@ include file="../../footer.jsp"%>
	<%
	}//if
}catch(NullPointerException e){
	%>
	<script type="text/javascript">
		alert('로그인 후 이용가능합니다');
		if (confirm("로그인 창으로 이동하시겠습니까?")) {//T(확인)
			location.href = '<%= request.getContextPath()%>/resources/pages/login.jsp';
		    
		} else {//F(취소)
			history.go(-1);
		}
	</script>
<% 
}
%>
