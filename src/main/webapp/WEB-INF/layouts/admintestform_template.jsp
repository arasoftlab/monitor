<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>

<head>
	<meta charset="utf-8" />
	<title><tiles:insertAttribute name="title" /></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="" />
	<meta name="author" content="http://bootstraptaste.com" />
	
	<!-- css -->
	
	<link href="<c:url value='/webjars/bootstrap/3.3.7/css/bootstrap.min.css' />" rel="stylesheet" />	
	<link href="<c:url value='/webjars/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css'/>" rel="stylesheet"/>
	<link href="<c:url value='/webjars/bootstrap-daterangepicker/2.1.24/css/bootstrap-daterangepicker.css'/>" rel="stylesheet" />
		
	<link href="<c:url value='/css/fancybox/jquery.fancybox.css'/>" rel="stylesheet">
	<link href="<c:url value='/css/flexslider.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/style.css'/>" rel="stylesheet" />
	
	<!-- Theme skin -->
	<link href="<c:url value='/skins/default.css'/>" rel="stylesheet" />
		  

	<!-- webjars -->	
	<script src="<c:url value='/webjars/jquery/1.12.4/jquery.min.js'/>"></script>
	<script src="<c:url value='/webjars/jquery-form/4.2.1/jquery.form.min.js'/>"></script>
	<script src="<c:url value='/webjars/bootstrap/3.3.7/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/webjars/jquery-ui/1.12.1/jquery-ui.min.js'/>"></script>
	<script src="<c:url value='/webjars/bootstrap-filestyle/1.1.2/bootstrap-filestyle.js'/>"></script>
	<script src="<c:url value='/webjars/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js'/>"></script>
	<script src="<c:url value='/webjars/bootstrap-datepicker/1.7.1/locales/bootstrap-datepicker.kr.min.js'/>"></script>
	<script src="<c:url value='/webjars/bootstrap-daterangepicker/2.1.24/js/bootstrap-daterangepicker.js'/>"></script>
	<script src="<c:url value='/webjars/jquery-cookie/1.4.1-1/jquery.cookie.js'/>"></script>
	
	<script src="<c:url value='/js/browser_check.js' />"></script>
	<script src="<c:url value='/js/jquery.slimscroll.js'/>"></script>
	<script src="<c:url value='/js/moment.js'/>"></script>
	<script src="<c:url value='/js/validate.js'/>"></script>
	
	<script src="<c:url value='/js/common.js'/>"></script>
	
		
</head>
<body>

	<div id="body" >
		<div class="body" >
			<tiles:insertAttribute name="content" />
		</div>
	</div>

</body>
</html>