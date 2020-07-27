<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!-- Navigation -->

<div style="margin-bottom: 20px;">
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="    background-color: #4e73df; ">

      <div class="container">
        <a class="navbar-brand" href="<c:url value="/trang-chu"/>">Quản Lý Khóa Học Tập</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="<c:url value="/trang-chu"/>">Trang chủ
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item ">
              <a class="nav-link" href="<c:url value="/thong-tin-dang-ky-lich"/>">Thông tin đăng ký lịch
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item ">
              <a class="nav-link" href="<c:url value="/thoi-khoa-bieu"/>">Thời khóa biểu
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item ">
              <a class="nav-link" href="<c:url value="/diemr-danh"/>">Điểm danh
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <c:if test="${not empty USERMODEL}">
                <li class="nav-item dropdown no-arrow">
			    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			      <span class="mr-2 d-none d-lg-inline" style="color: rgba(255,255,255,0.5);">${USERMODEL.username}</span>
			      <img class="img-profile rounded-circle" src="https://scontent-xsp1-2.xx.fbcdn.net/v/t1.0-9/p720x720/49389787_1147601402083826_3155358583692984320_o.jpg?_nc_cat=107&_nc_sid=85a577&_nc_ohc=011gqJLVIAkAX_aIWMf&_nc_ht=scontent-xsp1-2.xx&_nc_tp=6&oh=bd67495ce766114b848531931cfe2735&oe=5EAC53EC">
			    </a>
			    <!-- Dropdown - User Information -->
			      <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
			        <a class="dropdown-item" href="<c:url value="/thong-tin-tai-khoan" />">
			          <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
			          Profile
			        </a>
			        <div class="dropdown-divider"></div>
			        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
			          <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
			          Logout
			        </a>
			      </div>
              </li>
            </c:if>
            <c:if test="${empty USERMODEL}">
              <li class="nav-item">
                <a class="nav-link" href='<c:url value="/login?action=login"/>'>Đăng nhập</a>
              </li>
            </c:if>
          </ul>
        </div>
      </div>
</nav>
</div>