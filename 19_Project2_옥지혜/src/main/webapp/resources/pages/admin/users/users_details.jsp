<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
users_management.jsp -> users_details.jsp
<%
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userId");
	//System.out.println(userid);

%>
이 페이지는 해당 아이디를 가진 사용자가 작성한 글을 불러와서 확인할 수 있는 관리자용 마이페이지