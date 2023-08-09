<%@page import="com.anidain.abandAniShelter.AniShelterBean"%>
<%@page import="com.anidain.abandAniShelter.AniShelterDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.anidain.ani.AniDAO"%>
<%@page import="com.anidain.ani.AniBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ include file="../sideBar.jsp"%>
<%@ include file="../wrapper.jsp"%>

<%
request.setCharacterEncoding("UTF-8");
String[] thlist = { 
			"일련번호", "발견날짜", "종류", "보호소", "상태", 
			"발견장소", "품종", "색상", "성별", "중성화여부", "특징" 
			};
int no = Integer.parseInt(request.getParameter("no"));
//싱글톤 객체 생성
AniDAO adao = AniDAO.getInstance();
AniBean aniB = adao.getAniByNo(no);

//보호소
AniShelterDAO asdao = AniShelterDAO.getInstance();

SimpleDateFormat sdf = new SimpleDateFormat();

System.out.println(session.getAttribute("s_userId"));
String conPath = request.getContextPath();
String imgPath = conPath +"/images/";
%>
<form method="post" action="guardianForm.jsp">
<div class="table-responsive">
<table border="1"  class="table table-hover">
	<tr>
		<td colspan="2" align="center">
		<img alt="<%=aniB.getAni_image()%>" 
		src="<%= imgPath%>green.jpg"
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
		<td>보호소여부</td>
		
		<%
		int care_reg_no = aniB.getCare_reg_no();
		if (care_reg_no == 0){
		%>	<td>아직 보호소를 찾는 중입니다.</td>
		<%	
		}else{
			//보호소 배정O
				
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
		<td>상	태</td>
		<td>
		<%
		String state = aniB.getState();
		if (state.equals("check")){
			out.println("관리자가 확인 중인 상태입니다. 확인 후 바로 처리하도록 하겠습니다.");
		}else{
		%>
			<label class="badge badge-danger"><%= state%></label>
			
		<%	
		}//if
		%>
		</td>
	</tr>
	<tr>
		<td>발견장소</td>
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
		<td><%=aniB.getSpecialMark()%></td>
	</tr>	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="보호자 신청하기" class="btn btn-primary btn-icon-text">
			<input type="button" value="목록보기" onclick="history.go(-1)"
			 class="btn btn-outline-primary btn-icon-text">
		</td>
	</tr>		
</table>
	<input type="hidden" name="no" value="<%=no%>">
	<input type="hidden" name="bgnde" value="<%=sdf.format(aniB.getBgnde())%>">
	<!-- upkind는 자바코드로 출력값 변경하여 아래에서 별도처리 -->
	<input type="hidden" name="care_reg_no" value="<%=aniB.getCare_reg_no()%>">
	<input type="hidden" name="state" value="<%=aniB.getState()%>">
	<input type="hidden" name="happenPlace" value="<%=aniB.getHappenPlace()%>">
	<input type="hidden" name="colorCd" value="<%=aniB.getColorCd()%>">
	<input type="hidden" name="sexCd" value="<%=aniB.getSexCd()%>">
	<input type="hidden" name="neuter_yn" value="<%=aniB.getNeuter_yn()%>">
	<input type="hidden" name="specialMark" value="<%=aniB.getSpecialMark()%>">
	<input type="hidden" name="ani_image" value="<%=aniB.getAni_image()%>">
</div>	
</form>

<%@ include file="../footer.jsp"%>