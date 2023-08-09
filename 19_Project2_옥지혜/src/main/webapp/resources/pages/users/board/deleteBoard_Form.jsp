<%@page import="com.anidian.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateBoard_Proc
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bb" class="com.anidian.board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>

<%

	String board_no = request.getParameter("board_no");
	String pageNum = request.getParameter("pageNum");
	String userId = request.getParameter("userId");
	String subject = request.getParameter("subject");	   
	String content = request.getParameter("content");	   
	String userPw = request.getParameter("userPw");	   
	//객체생성
	BoardDAO bdao = BoardDAO.getInstance();
	
	int cnt = bdao.updateBoard(bb);
	
	out.println(board_no + " / "+ pageNum  + " / " +userId + " / " + subject + " / " + content + " / " + userPw + " / ");
	System.out.println("deleteBoard_Form board_no : "+board_no);
	System.out.println("deleteBoard_Form pageNum : "+pageNum);
	System.out.println("deleteBoard_Form bb.getUserId() : "+bb.getUserId());
	System.out.println("deleteBoard_Form userId : "+ userId);
	System.out.println("deleteBoard_Form subject : "+ subject);
	System.out.println("deleteBoard_Form userPw : "+ userPw);
	System.out.println("deleteBoard_Form cnt : "+ cnt); 

	
	String msg = "";
	String url = "";
	if(cnt>0){
		msg = "삭제성공";
		url = "board_content.jsp";
		
	}else{
		msg = "삭제실패";
		url = "board_content.jsp"; 
	}
	
%>
<script type="text/javascript">
	<%-- alert('<%= msg%>');
	location.href = '<%= url%>?pageNum=<%=pageNum%>';
 --%>
	 

</script>

