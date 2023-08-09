<!DOCTYPE html>
<%@page import="com.anidian.users.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ include file="../sideBar.jsp"%>
<%@ include file="../wrapper.jsp"%>
<%
//객체생성
UsersDAO udao = UsersDAO.getInstance();

String message = "";
%>
<script src="<%= request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript">
$(function(){

	
});
var chk_userId = $('input[name=userId]').val();
var oMsg = $("#idMsg");
function registerCheck(){
	//alert(1);
	/* 유효성 검사 정규식 */
	
	var getAccount = /^[a-zA-Z0-9]{5,12}$/; //영문(대소문자)와 숫자로 이루어진 길이 5~12의 문자
	var getName = /^[가-힣a-zA-Z]+$/;//한글과 영문(대소문자)
	var getEmail = /^\w{4,15}@[a-zA-Z0-9]{3,9}[.][a-zA-Z]{3,4}$/;//kim123@naver.com
	var getPhoneNum = /(\d{3}).*(\d{4}).*(\d{4})/;//010-1234-5678
	
	/* 아이디 */
	if( chk_userId == "" ){
		alert("아이디를 입력해주세요. ");
		$('input[name=userId]').focus();
		return false;
	}
	//test() : 찾는 문자열이, 들어있는지 아닌지를 boolean으로 리턴.
 	if( !getAccount.test(chk_userId){ //아이디 유효성검사
        alert("ID는 5~12자의 영문 대소문자와 숫자로만 입력하여 주세요. ");   
        $('input[name=userId]').select();
        return false;
    }	
	
	/*//아이디 */

	/* 비밀번호 */
	if( $('input[name=userPw]').val() == "" ){
		alert("비밀번호를 입력해주세요. ");
		$('input[name=userPw]').focus();
		return false;
	}
 	if( !getAccount.test($('input[name=userPw]').val()) ){ //아이디 유효성검사
        alert("비밀번호는 5~12자의 영문 대소문자와 숫자로만 입력하여 주세요. ");   
        $('input[name=userPw]').select();
        return false;
    }	
 	
 	if( $('input[name=userId]').val() == $('input[name=userPw]').val() ){ //아이디 유효성검사
        alert("아이디와 비밀번호를 다르게 설정해주세요. ");   
        $('input[name=userPw]').select();
        return false;
    }	
	/*//비밀번호 */
	
 	/* 비밀번호 확인*/
 	
	//ajax로 
	//비밀번호와 일치하면 "비밀번호가 일치합니다."
	//비밀번호와 불일치하면 "비밀번호가 일치하지않습니다."
	
	/*//비밀번호 확인*/
	
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
						<h4>회원가입</h4>
						<!-- 회원가입 form -->
						<form class="pt-3" method="post" action="regiterProc.jsp" onsubmit="return registerCheck()">
							<!-- USERID -->
							<div class="form-group row">
								<label for="exampleInputMobile" class="col-sm-3 col-form-label">아이디</label>
								<div class="col-sm-9">
									<input type="text" class="form-control form-control-lg"
										name="userId" placeholder="Id"   >
									<span class="error_next_box" id="idMsg" style="display:none" aria-live="assertive"></span>
								</div>
							</div>
							<!-- //USERID -->
							<!-- USERPW -->
							<div class="form-group row">
								<label for="exampleInputMobile" class="col-sm-3 col-form-label">비밀번호</label>
								<div class="col-sm-9">
									<input type="password" class="form-control form-control-lg"
										name="userPw" placeholder="Password">
								</div>
							</div>
							<!-- //USERPW -->
							<!-- userPwChk -->
							<div class="form-group row">
								<label for="exampleInputMobile" class="col-sm-3 col-form-label">비밀번호 확인</label>
								<div class="col-sm-9">
									<input type="password" class="form-control form-control-lg"
										name="userPwChk" placeholder="Password 확인">
								</div>
							</div>
							<!-- //userPwChk -->
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
							<!-- address -->
							<div class="form-group row">
								<label for="exampleInputMobile" class="col-sm-3 col-form-label">주소</label>
								<div class="col-sm-6">
									<input type="text" id="postcode" class="form-control " placeholder="우편번호">
								</div>
								
								<span>
									<input type="button" onclick="exe_address()" 
									class="btn btn-primary btn-icon-text" value="우편번호 찾기" >	
								</span>
								<div style="margin: 40"></div><!-- margin안주면 딱붙어서 보여짐 -->
								<label for="exampleInputMobile" class="col-sm-3 col-form-label"></label>
								<div class="col-sm-9">
								
									<input type="text" name="address" id="address" placeholder="주소" 
									class="form-control" ><br>
								</div>	
								<label for="exampleInputMobile" class="col-sm-3 col-form-label"></label>
								<div class="col-sm-9">	
									<input type="text" name="address_sub" id="address_sub" placeholder="상세주소" 
									class="form-control" >
								</div>
								<div class="col-sm-9">		
									<input type="hidden" id="address_extra" placeholder="참고항목"
									class="form-control">
								</div>
									
					
							<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
							<script>
							function exe_address() {
							    new daum.Postcode({//우편번호 찾기 화면을 팝업으로 띄워주는 함수
							        oncomplete: function(data) {
							            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							
							            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
							            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							            var addr = ''; // 주소 변수
							            var extraAddr = ''; // 참고항목 변수
							
							            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						                    addr = data.roadAddress;
						                } else { // 사용자가 지번 주소를 선택했을 경우(J)
						                    addr = data.jibunAddress;
						                }

						                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						                if(data.userSelectedType === 'R'){
						                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
						                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						                        extraAddr += data.bname;
						                    }
						                    // 건물명이 있고, 공동주택일 경우 추가한다.
						                    if(data.buildingName !== '' && data.apartment === 'Y'){
						                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						                    }
						                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						                    if(extraAddr !== ''){
						                        extraAddr = ' (' + extraAddr + ')';
						                    }
						                
						                } 
							            // 우편번호와 주소 정보를 해당 필드에 넣는다.
							            document.getElementById('postcode').value = data.zonecode;
							            document.getElementById("address").value = addr;
							            // 커서를 상세주소 필드로 이동한다.
							            document.getElementById("address_sub").focus();
							        }
							    }).open();
							}//new daum.Postcode
							</script>
								
							</div>
							<!-- //address -->
							<div class="mt-3">
								<input 
									class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
									type="submit" value="회원가입" /> 
							</div>
							<div class="text-center mt-4 font-weight-light">
								이미 계정을 가지고계신가요? <a
									href="<%=request.getContextPath()%>/resources/pages/login.jsp"
									class="text-primary">로그인</a>
							</div>
						</form>
						<!-- //회원가입 form -->
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