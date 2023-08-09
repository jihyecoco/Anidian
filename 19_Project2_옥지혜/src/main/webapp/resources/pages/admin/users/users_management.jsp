<%@page import="com.anidian.users.UsersBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.anidian.users.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>		
<%@ include file="../sideBar.jsp"%>
<%@ include file="../wrapper.jsp"%>
users_management.jsp

<%
//싱글톤 객체 생성
UsersDAO udao = UsersDAO.getInstance();

////1. abandAni 테이블과 abandAniDetails 테이블 join && state가 protect or notice 값만 가져오기.
%>
<div class="table-responsive">
<table border="1" class="table table-hover">
		<tr>
			<th width="5%">일련번호</th>
			<th>이름</th>
			<th>아이디</th>
			<th>Email</th>
			<th>연락처</th>
			<th>주소</th>
		</tr>		
		<tr>
			<%
			ArrayList<UsersBean> lists = udao.getAllUsers();
			for(int i=0; i<lists.size(); i++){		
			%>
			
				<td><%=lists.get(i).getUserNo() %></td>
				<td><%=lists.get(i).getUserName() %></td>
				<td>
					<a href="users_details.jsp?userId=<%=lists.get(i).getUserId() %>">
						<%=lists.get(i).getUserId() %>
					</a>
				</td>
				<%-- <td><%=lists.get(i).getUserPw() %></td> --%>
				<td><%=lists.get(i).getEmail() %></td>
				<td><%=lists.get(i).getPhoneNum() %></td>
				<td><%=lists.get(i).getAddress() %>, &nbsp;<%=lists.get(i).getAddress_sub() %></td>
		</tr>	
			<%
			}//for
			%>
			

	<!-- //컬럼 -->

</table>
</div>

<%@ include file="../footer.jsp"%>