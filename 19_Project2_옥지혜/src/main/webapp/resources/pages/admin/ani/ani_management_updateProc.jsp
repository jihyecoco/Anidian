<%@page import="com.anidain.ani.AniBean"%>
<%@page import="com.anidain.ani.AniDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
AniBean ani = new AniBean();
int no = Integer.parseInt(request.getParameter("no"));//동물 no
String upkind = request.getParameter("upkind");
String care_reg_no = request.getParameter("care_reg_no");
String happenPlace = request.getParameter("happenPlace");
String happenPlace_sub = request.getParameter("happenPlace_sub");
String sexcd = request.getParameter("sexcd");

out.println(no + " / " + care_reg_no + " / " +  upkind + " / " +  " / " + happenPlace  + " / " + happenPlace_sub  + " / " + sexcd);

AniDAO adao = AniDAO.getInstance();
int cnt = adao.updateAni(ani);
String msg = "";
String url = "";
	System.out.println("cnt : " + cnt);
 
	if (cnt > 0) {
		msg = "수정 성공하였습니다.";
		url = "ani_management_details.jsp";
	} else if (cnt == 0) {
		msg = "수정 오류가 있습니다.";
		url = "ani_management_update.jsp";
	} else if (cnt == -1) {
		msg = "수정 실패하였습니다";
		url = "ani_management_update.jsp";
	}
	
%>
<script type="text/javascript">
	
	alert("<%=msg%>");
	location.href = '<%=url%>?no=<%=no%>'; 
	 
</script>

