<%@page import="com.anidain.abandAniShelter.AniShelterDAO"%>
<%@page import="com.anidain.abandAniShelter.AniShelterBean"%>
<%@page import="com.anidain.ani.AniDAO"%>
<%@page import="com.anidain.ani.AniBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
main.jsp(사이드바 보호자를 찾고있어요 클릭) -> aniList.jsp
<%@ include file="../top.jsp"%>
<%@ include file="../sideBar.jsp"%>
<%@ include file="../wrapper.jsp"%>

<%
//싱글톤 객체 생성
AniDAO adao = AniDAO.getInstance();
ArrayList<AniBean> list = adao.getAniByState();

String[] thlist = {"일련번호", "이미지", "상태", "발견당시 장소", "성별", "발견날짜"};
String conPath = request.getContextPath();
String imgPath = conPath +"/images/";
%>
<!-- col-lg-12 -->
<div class="col-lg-12 grid-margin stretch-card">
<!-- card -->
<div class="card">
<!-- card-body -->
<div class="card-body">
<h4 class="card-title">보호자를 기다리고있어요</h4>
<!-- table-responsive -->
<div class="table-responsive">
	<table class="table table-striped table-hover">
		<tr>
   		<%
   		for(int i=0;i<thlist.length;i++){
   		%>
   			<th><%= thlist[i] %></th>
   		<%	
   		}		
   		%>
        </tr>
       <%
		try{
			int cnt = 0;
			for (int i = 0; i < list.size(); i++) {
				cnt++;
		%>
		<tr>
			<td><%=i+1%></td>
		<td style="height: 100px;">
			<a href="aniList_Details.jsp?no=<%= list.get(i).getNo()%>">
				<img
				src="<%= imgPath%>green.jpg"
				alt="<%=list.get(i).getAni_image()%>" >
			</a>
		</td>
		<td>
	        <%
			//protect', 'notice', 'adopt', 'guardian
			String state = list.get(i).getState();
			String stateClass = "";
			String bool_protect = "";
			if(state.equals("protect")){
				state = "보호중";
				stateClass = "badge badge-warning";
				bool_protect = "Y";
			}else if(state.equals("notice")){
				state = "공고중";
				stateClass = "badge badge-danger";
				bool_protect = "Y";
				
			}else if(state.equals("adopt")){
				state = "입양되었어요";
				stateClass = "badge badge-info";
				bool_protect = "N";
				
			}else if(state.equals("guardian")){
				state = "보호자를 만났어요";
				stateClass = "badge badge-success";
				bool_protect = "N";
				
			}else if(state.equals("check")){
				state = "관리자가 확인 중입니다.";
				stateClass = "badge badge-check";
				bool_protect = "N";
				
			} 
			%>
	
			<label class="<%= stateClass %>"><%= state%></label>

		</td>
     	<td>
	      	<%=list.get(i).getHappenPlace()%>,&nbsp;
			<%= list.get(i).getHappenPlace_sub() %>
    	</td>
     	<td>
	     	<%
			String sexcd = list.get(i).getSexCd();
			if(sexcd.equals("M")){
				sexcd = "남자";
			
			}else {
				sexcd = "여자";
			}
			%>
			<%= sexcd%>
		</td>
     	<td>
      		<%= list.get(i).getBgnde() %>
        </td>
      </tr>
      <% 
	if(cnt>0){
		out.println("</tr><tr></tr><tr>");
						
	}//for
			
	}//for
}catch(NullPointerException e){
	out.println("<tr><th>아직 등록되지않았습니다.</th></tr>");
}


%>
	</table>
</div>
<!-- //table-responsive -->

    </div>
    <!-- //card-body -->
  </div>
  <!-- card -->
</div>
<!-- //col-lg-12 -->
<%@ include file="../footer.jsp"%>