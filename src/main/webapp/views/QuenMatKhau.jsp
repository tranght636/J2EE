<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row justify-content-center">

	<div class="col-xl-10 col-lg-12 col-md-9">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<c:if test="${not empty message}">
						<div class="alert alert-warning">${message}</div>
					</c:if>
					<div class="col-lg-6 d-none d-lg-block">
						<img style="width: 100%; height: 100%"
							src="<c:url value='/img/1.png' />" />
					</div>
					<div class="col-lg-6">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-2">Bạn quên mật khẩu?</h1>
								<p class="mb-4">Vui lòng nhập email để tạo mật khẩu mới</p>
							</div>
							<form action="<c:url value='/quen-mat-khau?action=quenmatkhau'/>" method="POST">
								<div class="form-group">
									<input name="email" type="email"
										class="form-control form-control-user"
										aria-describedby="emailHelp"
										placeholder="Enter Email Address...">
								</div>
								<button type="submit" class="btn btn-primary btn-user btn-block">Reset
									Password</button>
							</form>
							<hr>
							<div class="text-center">
								<a class="small" href="<c:url value='/sign-in'/>">Create an
									Account!</a>
							</div>
							<div class="text-center">
								<a class="small" href="<c:url value='/register'/>">Already
									have an account? Login!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>