<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.anidian.users.UsersBean"%>
<%@page import="com.anidian.users.UsersDAO"%>

<%
request.setCharacterEncoding("UTF-8");
String userId = request.getParameter("userId");
String userPw = request.getParameter("userPw");
System.out.println("loginProc userId "+userId);
System.out.println("loginProc userPw "+userPw);

//객체생성
UsersDAO udao = UsersDAO.getInstance();
UsersBean users = udao.getUsersInfo(userId, userPw);
System.out.println("loginProc userId "+userId);
System.out.println("loginProc users "+users);

String viewPage = "";

	if (users != null){	
	/* users != null 로 비교했을 때 syso로 출력해보면 null인데 null값 비교를 못했다.
	null 비교는 equals, 길이비교 등으로 처리하는 방향으로 해야할 것같다.		
	*/
	String getId = users.getUserId();
	System.out.println("loginProc users not null : "+  getId);
		if(getId.equals("admin")) {//관리자
			viewPage = "admin/main.jsp";
			
		}else {//사용자
			viewPage = "main.jsp";
		}
%>
	<script type="text/javascript">
		alert('<%=userId%>님 환영합니다');
		location.href = '<%=viewPage%>';
	</script>
<%
	}else{//getId.equals(null)
%>
		<script type="text/javascript">
			alert('존재하지않는 회원입니다. 회원가입 후 이용가능합니다');
		    if (confirm("회원가입 창으로 이동하시겠습니까?")) {//T(확인)
		    	location.href = '<%= request.getContextPath()%>/resources/pages/users/register.jsp';
		        
		    } else {//F(취소)
		    	history.go(-1);
		    }
		</script>

<%
	}//else
	
	 //set 설정
	session.setAttribute("userId", userId);//sid = session으로 설정할 ID
	
	/* 세션(Session)에 값 저장하기
	[형식] session.setAttribute(String name, Object value); 
	session에 값을 저장하기 위해서는 그 값을 저장하는 대상을 식별하기 위한 키가 있어야 한다.
	- name이 바로 세션에 저장된 특정 값을 찾아오기 위한 키로 사용된다.
	- 이 키와 일대일 대응으로 저장하고 싶은 값을 value 위치에 지정한다.
	- name과 value는 1:1 대응이다.
	-name은 String 형으로 들어가고 value는 Object형이어야만 한다. 
	*/
%>
