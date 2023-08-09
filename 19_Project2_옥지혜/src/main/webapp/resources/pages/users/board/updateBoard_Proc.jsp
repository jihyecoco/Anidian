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
	System.out.println("updateBoard_Proc board_no : "+board_no);
	System.out.println("updateBoard_Proc pageNum : "+pageNum);
	System.out.println("updateBoard_Proc bb.getUserId() : "+bb.getUserId());
	System.out.println("updateBoard_Proc userId : "+ userId);
	System.out.println("updateBoard_Proc subject : "+ subject);
	System.out.println("updateBoard_Proc userPw : "+ userPw);
	System.out.println("updateBoard_Proc cnt : "+ cnt); 

	
	String msg = "";
	String url = "";
	if(cnt>0){
		msg = "수정성공";
		url = "board_content.jsp";
		
	}else{
		msg = "수정실패";
		url = "updateBoard_Form.jsp"; 
	}
	
%>
<script type="text/javascript">
	alert('<%= msg%>');
	location.href = '<%= url%>?board_no=<%=bb.getBoard_no()%>&pageNum=<%=pageNum%>';
</script>

