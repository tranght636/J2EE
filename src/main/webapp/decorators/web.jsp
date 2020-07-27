<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title><dec:title default="Trang chủ" /></title>
    <!--  -->
    
    <link rel="stylesheet" href="<c:url value='/template/admin/vendor/fontawesome-free/css/all.min.css' />" />
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<!-- Custom styles for this template-->
	<link rel="stylesheet" href="<c:url value='/template/admin/css/sb-admin-2.min.css' />" />
	<link rel="stylesheet" href='<c:url value="/template/vendor/font-awesome/css/font-awesome.min.css"/>' />
	
	
	<link rel="stylesheet" href="<c:url value='/template/admin/css/styles.css' />" />
	<!-- ckeditor -->
	<script src="<c:url value='/ckeditor/ckeditor.js' />"></script>
	
	
	<script src="<c:url value='/template/admin/vendor/jquery/jquery.min.js' />"></script>
	<link rel="stylesheet" href="<c:url value='/template/loader/jquery.loadingModal.css' />" />
	
	<link rel="stylesheet" href="<c:url value='/template/admin/css/styles.css' />" />
	<!-- ckeditor -->
	<script src="<c:url value='/template/admin/vendor/jquery/jquery.min.js' />"></script>
	  
	
	
	
	
	<!--  -->
    <!-- css -->
    <link href="<c:url value='/template/web/bootstrap/css/bootstrap.min.css' />" rel="stylesheet" type="text/css" media="all"/>
    <link href="<c:url value='/template/web/css/style.css' />" rel="stylesheet" type="text/css" media="all"/>
    <!-- ckeditor -->
	<script src="<c:url value='/ckeditor/ckeditor.js' />"></script>
	
	<script src="<c:url value='/template/admin/vendor/jquery/jquery.min.js' />"></script>
</head>
<body>
	<!-- header -->
    <%@ include file="/common/web/header.jsp" %>
    <!-- header -->
    
    <div class="container">
    	<dec:body/>
    </div>

	<!-- footer -->
	<%@ include file="/common/web/footer.jsp" %>
	<!-- footer -->
	
	
	
	
	<script
		src="<c:url value='/template/admin/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	<!-- Core plugin JavaScript-->
	<script
		src="<c:url value='/template/admin/vendor/jquery-easing/jquery.easing.min.js' />"></script>
	<!-- Custom scripts for all pages-->
	<script src="<c:url value='/template/admin/js/sb-admin-2.min.js' />"></script>
	<!-- Page level plugins -->
	<script
		src="<c:url value='/template/admin/vendor/chart.js/Chart.min.js' />"></script>
	<!-- Page level custom scripts -->
	<script
		src="<c:url value='/template/admin/js/demo/chart-area-demo.js' />"></script>
	<script
		src="<c:url value='/template/admin/js/demo/chart-pie-demo.js' />"></script>
	<script src="<c:url value='/js/custom.js' />"></script>
	
	
</body>
</html>