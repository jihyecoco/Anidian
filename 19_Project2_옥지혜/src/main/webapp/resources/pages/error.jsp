<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center text-center error-page bg-primary">
        <div class="row flex-grow">
          <div class="col-lg-7 mx-auto text-white">
            <div class="row align-items-center d-flex flex-row">
                <h3 class="font-weight-ligh" align="center">이 페이지에 접근권한이 없습니다. 로그인 후 이용해 주시길 바랍니다</h3>
            </div>
            <div class="row mt-5">
              <div class="col-12 text-center mt-xl-2" align="center">
                <a class="text-white font-weight-medium" href="<%= request.getContextPath()%>/resources/pages/main.jsp">돌아가기</a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
