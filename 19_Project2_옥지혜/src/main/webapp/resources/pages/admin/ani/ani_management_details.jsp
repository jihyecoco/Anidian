<%@page import="com.anidain.abandAniShelter.AniShelterBean"%>
<%@page import="com.anidain.abandAniShelter.AniShelterDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
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
int no = Integer.parseInt(request.getParameter("no"));
//싱글톤 객체 생성
//동물
AniDAO adao = AniDAO.getInstance();
AniBean aniB = adao.getAniByNo(no);
SimpleDateFormat sdf = new SimpleDateFormat();

//보호소
AniShelterDAO asdao = AniShelterDAO.getInstance();

%>
<div class="table-responsive">
<table border="1" class="table table-hover">
	<tr>
		<td colspan="2" align="center">
			<img alt="<%=aniB.getAni_image()%>" 
			src="<%= request.getContextPath() %>/resources/pages/users/images/<%=aniB.getAni_image()%>"
			width="100%" >
		</td>
	</tr>
	<tr>
		<td>발견 날짜</td>
		<td> 
			<%=sdf.format(aniB.getBgnde())%>
		</td>
	</tr>
	<tr>
		<td>분	류</td>
		<%
		String upkind_pf = "";
		String upkind = aniB.getUpkind();
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
		
	</tr>
		<tr>
		<td>상	태</td>
		<%	
		String state = aniB.getState();
		String state_mark = "";
		String stateClass = "";
		String bool_protect = "";
		if(state.equals("protect")){
			state_mark = "보호중";
			stateClass = "badge badge-warning";
			bool_protect = "Y";
			
		}else if(state.equals("notice")){
			state_mark = "공고중";
			stateClass = "badge badge-danger";
			bool_protect = "Y";
			
		}else if(state.equals("adopt")){
			state_mark = "입양되었어요";
			stateClass = "badge badge-info";
			bool_protect = "N";
			
		}else if(state.equals("guardian")){
			state_mark = "보호자를 만났어요";
			stateClass = "badge badge-success";
			bool_protect = "N";
			
		}else if(state.equals("check")){
			state_mark = "관리자 확인 요망";
			stateClass = "badge badge-check";
			bool_protect = "N";
		}
		%>
		<td>
			<label class="<%= stateClass%>"><%= state_mark%></label>
		</td>
	</tr>
	<tr>
		<td align="left">보 호 소</td>
		
		<%
		int care_reg_no = aniB.getCare_reg_no();
		//System.out.println("care_reg_no"+care_reg_no);
		//System.out.println("aniB.getState()"+aniB.getState());c
		if((care_reg_no == 0 && aniB.getState().equals("check"))){
			%>
				<td><b><font color="red">보호소 배정에 오류가 있습니다. 다시 확인해주시기바랍니다.</font></b></td>
			<%	
		}else if (care_reg_no == 0 || aniB.getState().equals("check")){
		%>
			<td>보호소 배정X</td>
		<%
			
		}else {//보호소 배정O
			
			AniShelterBean aniSB = asdao.getAniShlByNo(care_reg_no);
			
		%> 	
			<td> 
				<div style="line-height: 2">
					보호소	이름 : <%= aniSB.getCareNm() %> 
				</div>
				<div style="line-height: 2">
					보호소전화번호 : <%= aniSB.getCareTel() %>
				</div>
				<div style="line-height: 2">
					보호소   위치 : <%= aniSB.getCareAddr() %> 
				</div>
			</td>
		<%	
		}//else
		%>
		
	</tr>
	<tr> 
		<td>발견 장소</td>
		<td>
			<%=aniB.getHappenPlace()%>,&nbsp;
			<%=aniB.getHappenPlace_sub()%>
		</td>
	</tr>
	<tr>	
		<td>품	종</td>
		<td><%=aniB.getKindCd()%></td>
	</tr>
	<tr>
		<td>색	상</td>
		<td><%=aniB.getColorCd()%></td>
	</tr>	
	<tr>
		<td>성	별</td>
		<%
		String sexcd = aniB.getSexCd();
		if(sexcd.equals("M")){
			sexcd = "남자";
		}else{
			sexcd = "여자";
		}
		%>
		<td><%=sexcd%></td>
	</tr>	
	<tr>
		<td>중성화여부</td>
		<%
		String neuterYn = aniB.getNeuter_yn();
		if (neuterYn.equals("Y")){
			neuterYn = "중성화O";
			
		}else if(neuterYn.equals("N")){
			neuterYn = "중성화X";
			
		}else if(neuterYn.equals("U")){
			neuterYn = "미상";
		}
		%>
		<td><%= neuterYn%></td>
	</tr>		
	<tr>
		<td>발견당시 특징</td>
		<td><%= aniB.getSpecialMark()%></td>
	</tr>	
	<tr>
		<td colspan="2" align="center">
			<a href="ani_management_update.jsp?no=<%=no%>">
				<input type="button" value="수정하기" class="btn btn-primary btn-icon-text">
			</a>
			<input type="button" value="목록보기" onclick="history.go(-1)"
			 class="btn btn-outline-primary btn-icon-text">
			 
		</td>
	</tr>		
</table>
</div>

<%@ include file="../footer.jsp"%>