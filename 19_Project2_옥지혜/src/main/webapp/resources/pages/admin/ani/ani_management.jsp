<%@page import="com.anidain.ani.AniBean"%>
<%@page import="com.anidain.ani.AniDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>		
<%@ include file="../sideBar.jsp"%>
<%@ include file="../wrapper.jsp"%>

<%
//싱글톤 객체 생성
AniDAO adao = AniDAO.getInstance();

%>
<div class="table-responsive">
<table border="1" class="table table-hover">
		<tr>
			<th width="5%">일련번호</th>
			<th>이미지</th>
			<th>유기날짜</th>
			<th>상태</th>
			<th>축종코드</th>
			<th>품종</th>
			<th>발견장소</th>
		</tr>		
		<tr>

		
		<%
			ArrayList<AniBean> lists = adao.getAllAni();
			for(int i=0; i<lists.size(); i++){		
			%>
			
				<td><%=lists.get(i).getNo() %></td>
				<td>
					<a href="ani_management_details.jsp?no=<%=lists.get(i).getNo() %>">
					<img alt="<%=lists.get(i).getAni_image() %>" src="<%= request.getContextPath()%>/resources/pages/users/images/<%=lists.get(i).getAni_image() %>">
					</a>
				</td>
				<td><%=lists.get(i).getBgnde() %></td>
				
				<%
				//protect', 'notice', 'adopt', 'guardian
				String state = lists.get(i).getState();
				String stateClass = "";
				String bool_protect = "";
				if(state.equals("protect")){
					state = "보호중";
					stateClass = "badge badge-warning";
					bool_protect = "Y";
					
				}else if(state.equals("notice")){
					state = "공고중";
					stateClass = "badge badge-danger";
					bool_protect = "N";
					
				}else if(state.equals("adopt")){
					state = "입양";
					stateClass = "badge badge-info";
					bool_protect = "N";
					
				}else if(state.equals("guardian")){
					state = "보호자 연계";
					stateClass = "badge badge-success";
					bool_protect = "N";
					
				}else if(state.equals("check")){
					state = "관리자 확인 필요";
					stateClass = "badge badge-check";
					bool_protect = "N";
					
				} 
				
				%>
				
				<td>	
				<label class="<%= stateClass%>"><%= state%></label>
				</td>
				
				<%
				String upkind_pf = "";
				String upkind = lists.get(i).getUpkind();
				if(upkind.equals("422400")){
					upkind_pf = "고양이";
				}else if(upkind.equals("417000")){
					upkind_pf = "개";
				}else{
					upkind_pf = "기타";
				}
				%>
				<td>
					<%=upkind_pf%>
				</td>
				<td><%=lists.get(i).getKindCd() %></td>
				<td>
					<%=lists.get(i).getHappenPlace() %>,&nbsp;
					<%=lists.get(i).getHappenPlace_sub() %>
				</td>
					
			</tr>	
				<%
				}//for
				%>

</table>
</div>

<%@ include file="../footer.jsp"%>