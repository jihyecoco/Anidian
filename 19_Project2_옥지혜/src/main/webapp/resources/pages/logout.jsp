<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
logout.jsp
<%
	session.invalidate();
	//세션 해제
%>
<script type="text/javascript">
	location.href = '<%= request.getContextPath() %>/resources/pages/main.jsp';

</script>