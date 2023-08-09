<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ include file="../sideBar.jsp"%>
<%@ include file="../wrapper.jsp"%>
<script src="<%= request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript">
$(function(){
	//alert(1);
	
});
function registerCheck(){

 	/* 이름 */
	if( $('input[name=userName]').val() == "" ){
		alert("이름을 입력해주세요. ");
		$('input[name=userName]').focus();
		return false;
	}
	
	if( !getName.test($('input[name=userName]').val()) ){ //아이디 유효성검사
        alert("한글과 영문 대소문자를 사용하세요. (특수기호, 공백 사용 불가)");   
        $('input[name=userName]').select();
        return false;
    }	
	/*//이름 */
	
	/* Email */
	if( $('input[name=email]').val() == "" ){
		alert("Email을 입력해주세요. ");
		$('input[name=email]').focus();
		return false;
	}
	
	if($('input[name=email]').val().indexOf("@") == -1){
		//str.indexOf('Bye') == -1
		alert("입력하신 Email형식에 @가 없습니다. ");
		$('input[name=email]').focus();
		return false;
	}
	
	if( !getEmail.test($('input[name=email]').val()) ){ //아이디 유효성검사
        alert("이메일 주소를 다시 확인해주세요. ");   
        $('input[name=email]').select();
        return false;
    }	
	/*//Email */
	
	/* 연락처 */
	if( $('input[name=phoneNum]').val() == "" ){
		alert("연락처를 입력해주세요. ");
		$('input[name=phoneNum]').focus();
		return false;
	}
	
	if( !getPhoneNum.test($('input[name=phoneNum]').val()) ){ 
        alert("형식에 맞지 않는 번호입니다. ");   
        $('input[name=phoneNum]').select();
        return false;
    }	
	/*//연락처 */
	/*//유효성 검사 정규식 */
}

</script>
<!-- <div class="container-scroller">
	<div class="container-fluid page-body-wrapper full-page-wrapper"> -->
		<div class="content-wrapper d-flex align-items-center auth px-0">
			<div class="row w-100 mx-0">
				<div class="col-lg-9 mx-auto">
					<div class="auth-form-light text-left py-5 px-4 px-sm-5">
						<div class="brand-logo">
							<img
								src="<%=request.getContextPath()%>/resources/images/logo.png"
								alt="logo" />
						</div>
						<h4 >아이디찾기</h4>
						<!-- 아이디찾기 form -->
						<form class="pt-3" method="post" action="find_mIdProc.jsp" onsubmit="return registerCheck()">
							<!-- USERNAME -->
							<div class="form-group row">
								<label for="exampleInputMobile" class="col-sm-3 col-form-label">이름</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="userName"
										placeholder="Username">
								</div>
							</div>
							<!-- //USERNAME -->
							<!-- Email -->
							<div class="form-group row">
								<label for="exampleInputMobile" class="col-sm-3 col-form-label">Email</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="email"
										placeholder="Email">
								</div>
							</div>
							<!-- //Email -->
							<!-- Phone number -->
							<div class="form-group row">
								<label for="exampleInputMobile" class="col-sm-3 col-form-label">연락처</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="phoneNum"
										placeholder="Phone number">
								</div>
							</div>
							<!-- //Phone number -->

							<div class="mt-3">
								<input 
									class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
									type="submit" value="아이디 찾기" /> 
							</div>
							<div class="text-center mt-4 font-weight-light">
								<a
									href="<%=request.getContextPath()%>/resources/pages/users/find_mPw.jsp"
									class="text-primary">비밀번호 찾기
								</a>
								&nbsp;&nbsp;&nbsp;
								<a
									href="<%=request.getContextPath()%>/resources/pages/login.jsp"
									class="text-primary">로그인
								</a>
							</div>
						</form>
						<!-- //아이디찾기 form -->
					</div>
				</div>
			</div>
		</div>
		<!-- content-wrapper -->
<!-- 	</div>
	//container-fluid page-body-wrapper
</div> -->
<!-- //container-scroller -->
<%@ include file="../footer.jsp"%>