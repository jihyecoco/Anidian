<%@page import="com.anidain.ani.AniDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	//config 객체 - 올릴 때 
	//getRealPath : 폴더에 접근하기 위한 메서드로 생략하면 웹서버 폴더 기본 위치까지만 접근
	String configFolder = config.getServletContext().getRealPath("/images/");
//	C:\JSP_ojh_dev\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\19_Project2_옥지혜\images
	System.out.println("저장되는 경로(실제 서버) configFolder : " + configFolder);
	//request 객체 - 올린 것을 가지고 올 때
	String requestFolder = request.getContextPath()+"/images/";
	System.out.println("가지고오는 경로 requestFolder : "+requestFolder);
	int maxSize = 1024 * 1024 * 10;
	String encoding = "UTF-8";
	//(request, 올릴폴더, 올릴 최대사이즈, 인코딩타입, [선택사항]기존에 올린 파일 업로드가능)
	String msg = "";
	String url = "";
	MultipartRequest mr = null;
	//파일 업로드를 수행하는  MultipartRequest
	mr = new MultipartRequest(request, 
			configFolder, 
			maxSize, 
			encoding, 
			new DefaultFileRenamePolicy() );
	
	AniDAO adao = AniDAO.getInstance();
	int cnt = adao.insertAbandAni(mr);
	//mr에 form에서 입력한 모든 것들을 넘김.
	
	System.out.println("저장되는 경로(실제 서버) request : " + request);
	/*
	System.out.println("bgnde :" + mr.getParameter("bgnde"));
	System.out.println("state :" + mr.getParameter("state"));
	System.out.println("happenPlace :" + mr.getParameter("happenPlace"));
	System.out.println("happenPlace_sub :" + mr.getParameter("happenPlace_sub"));
	System.out.println("kindCd :" + mr.getParameter("kindCd"));
	System.out.println("colorCd :" + mr.getParameter("colorCd"));
	System.out.println("sexCd :" + mr.getParameter("sexCd"));
	System.out.println("neuter_yn :" + mr.getParameter("neuter_yn"));
	System.out.println("specialMark :" + mr.getParameter("specialMark"));
	*/
	System.out.println("ani_image :" + mr.getFilesystemName("ani_image"));
	
	System.out.println("cnt : " + cnt);
	String no = mr.getParameter("no");
 
	if (cnt > 0) {
		msg = "등록에 성공하였습니다.";
		url = "aniList.jsp";
	} else if (cnt == 0) {
		msg = "등록에 오류가 있습니다.";
		url = "findAni.jsp";
	} else if (cnt == -1) {
		msg = "등록에 실패하였습니다";
		url = "findAni.jsp";
	}
	
%>
<script type="text/javascript">
	
	alert("<%=msg%>");
	location.href = '<%=url%>'; 
	 
</script>

