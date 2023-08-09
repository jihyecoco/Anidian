<%@page import="com.anidian.board.BoardBean"%>
<%@page import="com.anidian.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertBoard_Proc
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="board" class="com.anidian.board.BoardBean"/>
<jsp:setProperty property="*" name="board"/>

<%
	String userId = request.getParameter("userId");
	String subject = request.getParameter("subject");	   
	String content = request.getParameter("content");	   
	String userPw = request.getParameter("userPw");	   
	//out.println(userId + " / " + subject + " / " + content + " / " + userPw);
	//객체생성
	
	BoardDAO bdao = BoardDAO.getInstance();
	
	int cnt = bdao.insertArticle(board);
	
	String msg = "";
	String url = "";
	if(cnt>0){
		msg = "등록되었습니다.";
		url = "board_main.jsp";
	
	}else if(cnt ==0 ){
		msg = "등록오류, 다시 시도해주세요";
		url = "insertBoard_Form.jsp";
		
	}else{
		msg = "입력한 비밀번호가 동일하지않습니다.";
		url = "insertBoard_Form.jsp";
	%>	
	<%
		
	}
	
%>

<script type="text/javascript">
		alert('<%= msg%>');
		location.href = '<%= url%>';
</script>