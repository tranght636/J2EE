<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
<%@include file="/common/taglib.jsp"%>
	<!-- Outer Row -->
	<div class="row justify-content-center">

		<div class="col-xl-10 col-lg-12 col-md-9">

			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-6 d-none d-lg-block " >
						<img style="width: 100%; height: 100%" src="<c:url value='/img/1.png' />"/>
						</div>
						<div class="col-lg-6">
							<div class="p-5">
								<c:if test="${not empty message}">
									<div class="alert alert-${alert}">
											${message}
									</div>
								</c:if>
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
								</div>
								<form action='<c:url value="/login?action=login"/>' method="POST">
									<div class="form-group">
										<input type="email" class="form-control form-control-user"
											aria-describedby="emailHelp"
											placeholder="Enter Email Address..."
											name="email">
									</div>
									<div class="form-group">
										<input type="password" class="form-control form-control-user"
											placeholder="Password" name="password">
									</div>
									<div class="form-group">
										<div class="custom-control custom-checkbox small">
											<input type="checkbox" class="custom-control-input"
												id="customCheck"> <label
												class="custom-control-label" for="customCheck">Remember
												Me</label>
										</div>
									</div>
									<button class="btn btn-primary btn-user btn-block" type="submit"> Login </button>
									<hr>
									<a href="#" class="btn btn-google btn-user btn-block">
										<i class="fab fa-google fa-fw"></i> Login with Google
									</a> <a href="#"
										class="btn btn-facebook btn-user btn-block"> <i
										class="fab fa-facebook-f fa-fw"></i> Login with Facebook
									</a>
								</form>
								<hr>
								<div class="text-center">
									<a class="small" href="/quen-mat-khau?action=quenmatkhau">Forgot
										Password?</a>
								</div>
								<div class="text-center">
									<a class="small" href="<c:url value='/register?action=register'/>">Create an Account!</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>

</div>