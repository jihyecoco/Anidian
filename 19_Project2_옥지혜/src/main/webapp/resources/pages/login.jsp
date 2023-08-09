<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<%@ include file="sideBar.jsp"%>
<%@ include file="wrapper.jsp"%>
<script type="text/javascript" src="<%= request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript">
//유효성 검사
 $(function(){
	// alert(1);
 });
 
 function loginCheck(){
	 if( $('input[name=userId]').val() == "" ){
		 alert("아이디를 입력해주세요");
		 $('input[name=userId]').focus();
		 return false;
	 }
	 
	 if( $('input[name=userPw]').val() == "" ){
		 alert("비밀번호를 입력해주세요");
		 $('input[name=userPw5]').focus();
		 return false;
	 }
 }
 
</script>
<!-- <div class="container-scroller">
	<div class="container-fluid page-body-wrapper full-page-wrapper"> -->
	<div class="content-wrapper d-flex align-items-center auth px-0">
		<div class="row w-100 mx-0">
			<div class="col-lg-7 mx-auto">
				<div class="auth-form-light text-left py-5 px-4 px-sm-5">
					<div class="brand-logo">
						<img
							src="<%=request.getContextPath()%>/resources/images/logo.png"
							alt="logo" style="height: 20" />
					</div>
					<h4>Hello! let's get started</h4>
					<h6 class="font-weight-light">회원가입 시 등록하신 아이디와 비밀번호를 입력해주세요</h6>
					<form class="pt-3" name="loginf" action="loginProc.jsp"
						method="post" onsubmit="return loginCheck()">
						<!-- 로그인 form -->
						<div class="form-group">
							<input type="text" class="form-control form-control-lg"
								id="userId" name="userId" placeholder="id">
						</div>
						<div class="form-group">
							<input type="password" class="form-control form-control-lg"
								id="userPw" name="userPw" placeholder="password">
						</div>
						<div class="mt-3">
							<input type="submit"
								class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
								value="로그인">
						</div>

						<div class="text-center mt-4 font-weight-light">
							<a
								href="<%=request.getContextPath()%>/resources/pages/users/find_mId.jsp"
								class="text-primary">아이디 찾기</a>&nbsp; <a
								href="<%=request.getContextPath()%>/resources/pages/users/find_mPw.jsp"
								class="text-primary">비밀번호 찾기</a>&nbsp; <a
								href="<%=request.getContextPath()%>/resources/pages/users/register.jsp"
								class="text-primary">회원가입</a>
						</div>
					</form>
				</div>
				<!-- auth-form-light -->
			</div>
			<!-- col -->
		</div>
		<!-- row -->
	</div>
	<!-- content-wrapper ends -->
<!-- 	</div>
	page-body-wrapper ends
	
</div> -->
<%@ include file="footer.jsp"%>


