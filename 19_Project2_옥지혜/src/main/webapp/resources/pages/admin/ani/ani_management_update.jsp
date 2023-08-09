<%@page import="com.anidain.abandAniShelter.AniShelterBean"%>
<%@page import="com.anidain.abandAniShelter.AniShelterDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.anidain.ani.AniBean"%>
<%@page import="com.anidain.ani.AniDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>		
<%@ include file="../sideBar.jsp"%>
<%@ include file="../wrapper.jsp"%>
<h3>수정하기</h3>
<%
int no = Integer.parseInt(request.getParameter("no"));//동물 no
AniDAO adao = AniDAO.getInstance();
AniBean aniB = adao.getAniByNo(no);

SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
String[] upkind_list = {"417000", "422400", "429900"};
String[] sexcd_list = {"M", "F"};

AniShelterDAO asdao = AniShelterDAO.getInstance();
ArrayList<AniShelterBean> sblist = asdao.getAllAniShl();
//System.out.println(sblist.getCare_reg_no());
int[] care_list = {1, 2};
%>
<div class="table-responsive">
<form method="post" action="ani_management_updateProc.jsp">
<table border="1" class="table table-hover">
<input type="hidden" name="no" value="<%= no%>">
<tr>
		<td colspan="2" align="center">
			<img alt="<%=aniB.getAni_image()%>" 
			src="<%= request.getContextPath() %>/images/<%=aniB.getAni_image()%>"
			width="100%" >
			<input type="hidden" name="ani_image" value="<%=aniB.getAni_image()%>" class="form-control" >
		</td>
	</tr>
	<tr>
		<td>발견 날짜</td>
		<td> 
			<%
			String bgnde = sdf.format(aniB.getBgnde());
			%>
			<input type="date" name="bgnde" value="<%= bgnde %>" class="form-control"  readonly> 
		</td>
	</tr>
	<tr>
		<td>분	류</td>
		<td>
			<select class="form-control" name="upkind" class="form-control" >
				<%
				for(int i=0; i<upkind_list.length; i++){
					//System.out.println("upkind_list : "+upkind_list[i]);
					String upkind_pf = "";
					String upkind = aniB.getUpkind();
					System.out.println("aniB.getUpkind() : "+aniB.getUpkind());
					
				%>
					<option value="<%=upkind_list[i]%>" 
					
						<%
						if(upkind_list[i].equals(aniB.getUpkind()) ) {
							
						%> selected <%
						
						} 
						if(upkind_list[i].equals(upkind_list[0])){
							upkind_pf = "개";
							
						}else if(upkind_list[i].equals(upkind_list[1])){
							upkind_pf = "고양이";
							
						}else{
							upkind_pf = "기타";
						} 
						
					%>> <%=upkind_pf%>
					</option> 
				<%
				}//for
				%>			
			</select>
		</td>
	</tr>
	<tr>
		<td>보호소여부</td>
		<td>
		<%
		int cno = aniB.getCare_reg_no();
		if(cno == 0){
			out.println("<font color='red'><b>보호소 미지정 상태</b></font>");
		}else{
			for(int i=0; i<sblist.size(); i++){
				if((sblist.get(i).getCare_reg_no()) == cno){
					sblist.get(i).getCareNm();
					sblist.get(i).getCareTel();
					sblist.get(i).getCareAddr();
				}
			}//for
		}
		
		%>
		<br><br><br>
		<div><b>보호소 지정하기</b>
		<select class="form-control" name="care_reg_no" class="form-control" >
				<%
				for(int i=0; i<sblist.size(); i++){
					
				%>
					<option value="<%=sblist.get(i).getCare_reg_no()%>" >
					<%=sblist.get(i).getCare_reg_no()%>&nbsp;&nbsp;<%=sblist.get(i).getCareNm()%>
					</option> 
				<%
				}//for
				%>			
			</select>
		</div>
		</td>
	</tr>
	<tr>
		<td>상	태</td>
		<td>
		<%
		String state = aniB.getState();
		if (state.equals("check")){
			out.println("<font color='red'><b>관리자 확인 요망</b></font>");
		}else{
		%>
			<label class="badge badge-danger"><%= state%></label>
			
		<%	
		}//if
		%>
		<br><br><br>
		<div><b>상태 변경하기</b>
			<select class="form-control" name="state" class="form-control" >
				<option value="protect" >보호중</option> 
				<option value="notice" >공고중</option> 
				<option value="adopt" >입양</option> 
				<option value="guardian" >보호자</option> 
			</select>
		</div>
		</td>
	</tr>
	<tr>
		<td>발견장소</td>
		<td>
			<input type="text" name="happenPlace" value="<%=aniB.getHappenPlace()%>" class="form-control" >  
			,&nbsp;
			<input type="text" name="happenPlace_sub" value="<%=aniB.getHappenPlace_sub()%>" class="form-control" > 
		</td>
	</tr>
	<tr>	
		<td>품	종</td>
		<td><input type="text" name="kindcd" value="<%=aniB.getKindCd()%>" class="form-control" ></td>
	</tr>
	<tr>
		<td>색	상</td>
		<td><input type="text" name="colorcd" value="<%=aniB.getColorCd()%>" class="form-control" ></td>
	</tr>	
	<tr>
		<td>성	별</td>
		<td>
			
				<%
					String sexcd = aniB.getSexCd();
					if(sexcd.equals("M")){
						sexcd = "남자";
					}else{
						sexcd = "여자";
					}
				%>
				<%= sexcd %>
				
				<br><br><br>
			<div><b>성별 변경하기</b><br>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" class="form-check-input" name="sexCd"
						id="sexCd" value="M"> 남자  &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" class="form-check-input" name="sexCd"
						id="sexCd" value="F"> 여자
			</div>
		</td>
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
			<input type="submit" value="수정하기" class="btn btn-primary btn-icon-text">
			<input type="button" value="목록보기" onclick="history.go(-1)"
			 class="btn btn-outline-primary btn-icon-text">
			 
		</td>
	</tr>		
</table>
</form>
</div>

<%@ include file="../footer.jsp"%>