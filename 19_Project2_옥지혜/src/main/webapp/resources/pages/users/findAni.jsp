<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="<%= request.getContextPath()%>/resources/js/exe_happenPlace.js"></script>
<script type="text/javascript">
<%-- 
/*   
 null 검사
bgnde date not null, --유기날짜(검색 시작일)
happenPlace varchar(40) not null,--발견장소

	alert('로그인 후 이용가능합니다');
	if (confirm("로그인 창으로 이동하시겠습니까?")) {//T(확인)
		location.href = '<%= request.getContextPath()%>/resources/pages/login.jsp';
	    
	} else {//F(취소)
		history.go(-1);
	}
	*/	 --%>
</script>
<%@ include file="../top.jsp"%>
<%@ include file="../sideBar.jsp"%>
<%@ include file="../wrapper.jsp"%>
<%
try{
	if(!s_userId.equals(null)){
	System.out.println("findAni s_userId : " + s_userId);

%>
	<!-- col-md-12 grid-margin (틀)-->
	<div class="col-md-12 grid-margin">	
		<form method="post" action="findAniProc.jsp"
			enctype="multipart/form-data">
			<div class="form-group">
				<div class="col-12 grid-margin">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">보호자를 찾아요</h4>
							<input type="hidden" name="state" id="state" value="check">
							<!-- 발견 날짜 & 종류 -->
							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">발견 날짜</label>
										<div class="col-sm-9">
											<input type="date" class="form-control" name="bgnde" id="bgnde">
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">종류</label>
										<div class="col-sm-9">
											<select class="form-control" name="upkind" id="upkind">
												<option value="417000">개</option>
												<option value="422400">고양이</option>
												<option value="429900">기타</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<!-- 품종 & 중성화여부 -->
							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">품종</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="kindCd"
												id="kindCd" placeholder="믹스견">
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">중성화여부</label>
										<div class="col-sm-9">
											<select class="form-control" name="neuter_yn">
												<option value="Y">중성화O</option>
												<option value="N">중성화X</option>
												<option value="U">모름</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<!-- //품종 & 중성화여부 -->
							<!-- 색상 & 성별 -->
							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">색상</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="colorCd"
												id="colorCd" placeholder="갈색">
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">성별</label>
										<div class="col-sm-4">
											<div class="form-check">
												<input type="radio" class="form-check-input" name="sexCd"
													id="sexCd" value="M"> 남자
											</div>
										</div>
										<div class="col-sm-5">
											<div class="form-check">
												<input type="radio" class="form-check-input" name="sexCd"
													id="sexCd" value="F"> 여자
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- //색상 & 성별 -->
							<!-- 발견 장소 happenPlace-->
							<div class="row">
								<div class="col-md-12">
									<div class="form-group row">
										<label class="col-sm-12 col-form-label">발견 장소</label>
										<div class="col-sm-5">
											<input type="text" id="postcode" class="form-control"  
											placeholder="우편번호" >
										</div>	
										<span>
											<input type="button" onclick="exe_happenPlace()" 
											class="btn btn-primary btn-icon-text" value="우편번호 찾기" >	
										</span>
										<div style="margin: 35"></div><!-- margin안주면 딱붙어서 보여짐 -->
										<div class="col-sm-9">
											<input type="text" name="happenPlace" id="happenPlace" placeholder="주소" 
											class="form-control" ><br>
										</div>	
										
										<div class="col-sm-9">	
											<input type="text" name="happenPlace_sub" id="happenPlace_sub" placeholder="상세주소" 
											class="form-control" >
										</div>
										<div class="col-sm-9">		
											<input type="hidden" id="happenPlace_extra" placeholder="참고항목"
											class="form-control">
										</div>
									</div>
								</div>
							</div>
							<!-- 특징 -->
							<div class="row">
								<div class="col-md-12">
									<div class="form-group row">
										<label class="col-sm-12 col-form-label">특징</label>
										<div class="col-sm-12">
											<textarea class="form-control" rows="4" name="specialMark"
												placeholder="특징을 알아볼 수 있게 '파란색목줄착용, 겁이많음,' 등과 같이 입력해주세요!"></textarea>
										</div>
									</div>
								</div>
							</div>
							<!-- //특징 -->
							<!-- 파일 업로드 -->
							<div class="row">
								<div class="col-md-12">
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">사진 업로드</label>
				
										<div class="input-group col-sm-12">
											<!-- <input type="file" 
											name="ani_image" class="file-upload-default">  -->
											<input type="file"
											class="form-control file-upload-info" name="ani_image"
											placeholder="Upload Image">
										</div>
									</div>
								</div>
							</div>
							<!-- //파일 업로드 -->
							<!-- 등록 & 취소버튼 -->
							<div class="row">
								<div class="input-group col-xs-12">
									<button type="submit" class="btn btn-primary btn-icon-text">
										<i class="ti-file btn-icon-prepend"></i> 등록하기
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
	<!-- //col-md-12 grid-margin (틀)-->	
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
} catch(Exception e){
%>
	<script type="text/javascript">
	alert('다시');
	history.go(-1);
</script>
<% 
}
%>