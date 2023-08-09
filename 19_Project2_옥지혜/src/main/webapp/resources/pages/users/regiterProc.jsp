<%@page import="com.anidian.users.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
register -> registerProc.jsp<br>
성공->alert 가입성공, main.jsp
실패-> alert 가입실패, register.jsp

<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="users" class="com.anidian.users.UsersBean"/>
<jsp:setProperty property="*" name="users"/>

<%
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	String userName = request.getParameter("userName");
	String email = request.getParameter("email");
	String phoneNum = request.getParameter("phoneNum");
	String address = request.getParameter("address");
	String address_sub = request.getParameter("address_sub");
	   
	out.println(userId + " / " + userPw + " / " + userName + " / " + email + " / " + phoneNum + " / " +
			address + " / " + address_sub);
	
	//객체생성
	UsersDAO udao = UsersDAO.getInstance();
	
	int cnt = udao.insertUsers(users);
	
	String msg = "";
	String url = "";
	if(cnt>0){
		msg = "삽입성공";
		url = "../main.jsp";
		
	}else if(cnt ==0 ){
		msg = "삽입오류, 다시 시도해주세요";
		url = "register.jsp";
		
	}else{
		msg = "삽입실패";
		url = "register.jsp";
		
	}
	
%>
<script type="text/javascript">
	alert('<%= msg%>');
	location.href = '<%= url%>';
</script>
