<%@page import="com.anidian.users.UsersBean"%>
<%@page import="com.anidian.users.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
find_mId.jsp -> find_mIdProc.jsp
<%


	//한글처리
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="users" class="com.anidian.users.UsersBean"/>
<jsp:setProperty property="*" name="users"/>

<%
	String userName = request.getParameter("userName");
	String email = request.getParameter("email");
	String phoneNum = request.getParameter("phoneNum");
	   
	out.println(userName + " / " + email + " / " + phoneNum);
	
	//객체생성
	UsersDAO udao = UsersDAO.getInstance();
	
	UsersBean bean = udao.findmId(users);
	
	String msg = "";
	String url = "";
	
	if( bean != null ){
		msg = bean.getUserId();
	%>
		<script type="text/javascript">
			alert("아이디 : '<%= msg%>' 입니다.");
			if (confirm("로그인 창으로 이동하시겠습니까?")) {//T(확인)
			 	location.href = '<%= request.getContextPath()%>/resources/login.jsp';
			     
			 } else {//F(취소)
			 	history.go(-1);
			 }
		</script>
	
	<%
	}else{
		msg = "존재하지않는 회원입니다. 회원가입 후 이용가능합니다";
	%>	
		<script type="text/javascript">
			alert('<%= msg%>');
			if (confirm("회원가입 창으로 이동하시겠습니까?")) {//T(확인)
			 	location.href = '<%= request.getContextPath()%>/resources/pages/users/register.jsp';
			     
			 } else {//F(취소)
			 	history.go(-1);
			 }
		</script>
	<%
	}//else
	%>

