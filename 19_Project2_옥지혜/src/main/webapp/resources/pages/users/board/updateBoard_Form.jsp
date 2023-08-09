<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.anidian.board.BoardBean"%>
<%@page import="com.anidian.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../top.jsp"%>
<%@ include file="../../sideBar.jsp"%>
<%@ include file="../../wrapper.jsp"%>    
updateBoard_Form
<%
request.setCharacterEncoding("UTF-8");

String board_no = request.getParameter("board_no");
String pageNum = request.getParameter("pageNum");
String userId = request.getParameter("userId");

//싱글톤 객체 생성
BoardDAO bdao = BoardDAO.getInstance();
BoardBean bb = bdao.getContentByBoardNo(board_no);
/*
System.out.println("updateBoard_Form board_no : "+board_no);
System.out.println("updateBoard_Form pageNum : "+pageNum);
System.out.println("updateBoard_Form s_userId : "+s_userId);
System.out.println("updateBoard_Form bb.getUserId() : "+bb.getUserId());
*/
SimpleDateFormat sdf = new SimpleDateFormat();
%>
<div class="col-md-12 grid-margin">	
	<form method="post" action="updateBoard_Proc.jsp" >
	<input type="hidden" name="board_no" value="<%= board_no%>">
	<input type="hidden" name="pageNum" value="<%= pageNum%>">
	<input type="hidden" name="board_no" value="<%= board_no%>">
	<input type="hidden" name="userId" value="<%= bb.getUserId()%>">
       <div class="col-md-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">게시판 글 수정하기</h4>
                  <p class="card-description">
                   게시판 글 수정하기
                  </p>
                  <form class="forms-sample">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">작성자 아이디</label>
                      <div class="col-sm-9">
                      	작성자 아이디와 동일해야 수정가능합니다.
                        <input type="text" class="form-control" name="userId" id="userId" value="<%= bb.getUserId() %>" readonly>
                      </div>
                    </div>
                     <div class="form-group row">
                      <label class="col-sm-3 col-form-label">제목</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name="subject" id="subject" value="<%= bb.getSubject()%>">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">내용</label>
                      <div class="col-sm-9">
                      	<textarea rows="10" cols="80" name="content" id="content" class="form-control" ><%= bb.getContent()%></textarea>
                      </div>
                    </div>
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">비밀번호</label>
                      <div class="col-sm-9">
                      	<input type="password" class="form-control" name="userPw" id="userPw" placeholder="회원가입 시 등록한 비밀번호와 동일하게 입력해주세요.">
                      </div>
                    </div>
                  	<div  style="margin: auto 0;">
                    	<input type="submit" class="btn btn-primary mr-2" value="수정하기"  align="center">
                   		<input type="text" class="btn btn-light" value="취소"  align="center">
                    </div>
                    
                  </form>
                </div>
              </div>
            </div>

	</form>

</div>
<!-- form-check-input -->

<!-- content-wrapper -->
<%@ include file="../../footer.jsp"%>
