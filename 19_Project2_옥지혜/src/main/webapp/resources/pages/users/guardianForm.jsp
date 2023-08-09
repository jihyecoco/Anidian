<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../top.jsp"%>
<%@ include file="../sideBar.jsp"%>
<%@ include file="../wrapper.jsp"%>
<%
try{
	if(!s_userId.equals(null)){
	
	request.setCharacterEncoding("UTF-8");
	int no = Integer.parseInt(request.getParameter("no"));
	String bgnde = request.getParameter("bgnde");
	String care_reg_no = request.getParameter("care_reg_no");
	String state = request.getParameter("state");
	String happenPlace = request.getParameter("happenPlace");
	String kindCd = request.getParameter("kindCd");
	String colorCd = request.getParameter("colorCd");
	String sexCd = request.getParameter("sexCd");
	String neuter_yn = request.getParameter("neuter_yn");
	String specialMark = request.getParameter("specialMark");
	String ani_image = request.getParameter("ani_image");
	out.println(no);
	
	
	/* 
	create table anidian(
			no number, --유기동물 일련번호
			userId varchar2(15),
			gender char(4) CHECK(gender IN ('남자', '여자')), --성별
			reason varchar(100), --신청사유
			CONSTRAINT fk_no foreign key(no) references abandAni(no),  --외래키 지정문
			CONSTRAINT fk_userId foreign key(userId) references users(userId) --외래키 지정문
		); 
	*/
	%>
	<div class="col-md-12 grid-margin">	
		<form method="post" action="guardianProc.jsp">
			<div class="form-group">
				<div class="col-12 grid-margin">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">보호자가 되고싶어요</h4>
							<input type="hidden" name="no" id="no" value="<%= no%>">
							
							<!-- 이미지 -->
							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
									<label class="col-sm-3 col-form-label"></label>
										<img alt="<%=ani_image%>" 
										src="<%= request.getContextPath() %>/resources/pages/users/images/<%=ani_image%>"
										width="250" height="300" >
									</div>
								</div>
							</div>
							<!-- //이미지 -->
							<!-- 신청자 아이디 -->
							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">신청자 아이디</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="userId"
												id="userId" value="<%= s_userId%>" readonly="readonly">
										</div>
									</div>
								</div>
							</div>	
							<!-- //신청자 아이디 -->
							<!-- 성별 -->
							<div class="row">
								<div class="col-md-9">
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">성별</label>
										<div class="col-sm-2">
											<div class="form-check">
												<input type="radio" class="form-check-input" name="gender"
													id="gender" value="남자"> 남자
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-check">
												<input type="radio" class="form-check-input" name="gender"
													id="gender" value="여자"> 여자
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- //성별 -->
							<!-- 신청사유 -->
							<div class="row">
								<div class="col-md-12">
									<div class="form-group row">
										<label class="col-sm-12 col-form-label">신청사유</label>
										<div class="col-sm-12">
											<textarea class="form-control" rows="4" name="reason"
												placeholder="신청사유를 입력해주세요!"></textarea>
										</div>
									</div>
								</div>
							</div>
							<!-- //신청사유 -->
							<!-- 비밀번호 -->
							<div class="row">
							 	<div class="col-md-12">
							 		<div class="form-group row">
		                      			<label class="col-sm-12 col-form-label">비밀번호</label>
					                    <div class="col-sm-9">
					                    	<input type="password" class="form-control" name="userPw" id="userPw" placeholder="회원가입 시 등록한 비밀번호와 동일하게 입력해주세요.">
					                    </div>
		                      		</div>
		                    	</div>
							</div>		 
		                    <!-- //비밀번호 -->
							<!-- 등록 & 취소버튼 -->
							<div class="row">
								<div class="input-group col-xs-12">
									<button type="submit" class="btn btn-primary btn-icon-text">
										<i class="ti-file btn-icon-prepend"></i> 신청하기
									</button>
									<button type="button"
										class="btn btn-outline-primary btn-icon-text">
										<i class="ti-reload btn-icon-prepend"></i> 취소
									</button>
								</div>
							</div>
							<!-- 등록 & 취소버튼 -->
						</div>
						<!-- <div class="card-body"> -->
					</div>
					<!-- <div class="card"> -->
				</div>
				<!-- <div class="col-12 grid-margin"> -->
			</div>
			<!-- <div class="form-group"> -->
	
		</form>
	
	</div>
	<%@ include file="../footer.jsp"%>
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