<%@page import="com.anidian.guardian.GuardianDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
guardianProc
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="gd" class="com.anidian.guardian.GuardianBean"/>
<jsp:setProperty property="*" name="gd"/>


<%
	String no = request.getParameter("no");
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	String gender = request.getParameter("gender");
	String reason = request.getParameter("reason");
	System.out.println(no + " / " + userId + " / " +  userPw + " / " +gender + " / " + reason);
	
	GuardianDAO gdao = GuardianDAO.getInstance();
	
	int cnt = gdao.insertGuardian(gd);
	
	String msg = "";
	String url = "";
	String fail_url = "";
	if(cnt>0){
		msg = "신청되었습니다.";
		url = "aniList.jsp";
	%>
	<script type="text/javascript">
		alert('<%= msg%>');
		location.href = '<%= url%>';
	</script>
	<%
	}else if(cnt ==0 ){
		msg = "신청오류, 다시 시도해주세요";
		url = "aniList_Details.jsp";
	%>
	<script type="text/javascript">
		alert('<%= msg%>');
		location.href = '<%= url%>?no=<%=no%>';
	</script>
	<%	
	}else{
		msg = "입력한 비밀번호가 동일하지않습니다.";
		url = "aniList_Details.jsp";
		
	%>	
	<script type="text/javascript">
		alert('<%= msg%>');
		location.href = '<%= url%>?no=<%=no%>';
	</script>


	<%
		
	}
		
	%>
	
