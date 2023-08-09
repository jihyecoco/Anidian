<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../top.jsp"%>
<%@ include file="../../sideBar.jsp"%>
<%@ include file="../../wrapper.jsp"%>
<%
try{
	if(!s_userId.equals(null)){
	System.out.println("findAni s_userId : " + s_userId);
	String board_no = request.getParameter("board_no");
	String pageNum = request.getParameter("pageNum");
%>
		<!-- col-md-12 grid-margin (틀) -->
		<div class="col-md-12 grid-margin">	
			<form method="post" action="insertBoard_Proc.jsp" >
		       <div class="col-md-12 grid-margin stretch-card">
		              <div class="card">
		                <div class="card-body">
		                  <h4 class="card-title">게시판 글 등록하기</h4>
		                  <p class="card-description">
		                   게시판 글 등록하기
		                  </p>
		                  <form class="forms-sample">
		                    <div class="form-group row">
		                      <label class="col-sm-3 col-form-label">작성자 아이디</label>
		                      <div class="col-sm-9">
		                        <input type="text" class="form-control" name="userId" id="userId" value="<%= s_userId %>" readonly>
		                      </div>
		                    </div>
		                     <div class="form-group row">
		                      <label class="col-sm-3 col-form-label">제목</label>
		                      <div class="col-sm-9">
		                        <input type="text" class="form-control" name="subject" id="subject" >
		                      </div>
		                    </div>
		                    <div class="form-group row">
		                      <label class="col-sm-3 col-form-label">내용</label>
		                      <div class="col-sm-9">
		                      	<textarea rows="10" cols="80" name="content" id="content" class="form-control"></textarea>
		                      </div>
		                    </div>
		                    <div class="form-group row">
		                      <label class="col-sm-3 col-form-label">비밀번호</label>
		                      <div class="col-sm-9">
		                      	<input type="password" class="form-control" name="userPw" id="userPw" placeholder="회원가입 시 등록한 비밀번호와 동일하게 입력해주세요.">
		                      </div>
		                    </div>
		                  	<div  style="margin: auto 0;">
		                    	<input type="submit" class="btn btn-primary mr-2" value="등록하기"  align="center">
		                   		<input type="text" class="btn btn-light" value="취소"  align="center">
		                    </div>
		                    
		                  </form>
		                </div>
		              </div>
		            </div>
		
			</form>
		
		</div>
		<!-- //col-md-12 grid-margin (틀) -->
	<%@ include file="../../footer.jsp"%>
	<%
	}//if
	
}catch(NullPointerException e){
	%>
	<script type="text/javascript">
		alert('로그인 후 이용가능합니다');
		if (confirm("로그인 창으로 이동하시겠습니까?")) {//T(확인)
			location.href = '<%= request.getContextPath()%>/resources/pages/login.jsp';
		    
		} else {//F(취소)
			history.go(-1);
		}
	</script>
<% 
}
%>