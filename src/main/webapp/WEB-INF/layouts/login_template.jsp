<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-ｅquiv="Content-Type" content="text/html; charset=UTF-8">
	<title><tiles:insertAttribute name="title" /></title>
	<link href="<c:url value='/css/style.css'/>" rel="stylesheet" />
	<!-- Theme skin -->
	<link href="<c:url value='/skins/default.css'/>" rel="stylesheet" />
	
	<link href="<c:url value='/webjars/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css'/>" rel="stylesheet"/>
	<link href="<c:url value='/webjars/bootstrap-daterangepicker/2.1.24/css/bootstrap-daterangepicker.css'/>" rel="stylesheet" />
	
	<!--[if lt IE 9]>	
	<script src="<c:url value='/webjars/respond/1.4.2/dest/respond.min.js'/>"></script>
	<script src="<c:url value='/webjars/json2/20140204/json2.min.js'/>"></script>
    <script src="<c:url value='/webjars/html5shiv/3.7.3/html5shiv.min.js'/>"></script>
    <![endif]-->
	
	<script src="<c:url value='/webjars/jquery/1.12.4/jquery.min.js'/>"></script>
	<script src="<c:url value='/webjars/jquery-ui/1.12.1/jquery-ui.min.js'/>"></script>
	<script src="<c:url value='/webjars/jquery-form/4.2.1/jquery.form.min.js'/>"></script>
	<script src="<c:url value='/webjars/jquery-cookie/1.4.1-1/jquery.cookie.js'/>"></script>
	<script src="<c:url value='/webjars/bootstrap/3.3.7/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/webjars/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js'/>"></script>
	<script src="<c:url value='/webjars/bootstrap-datepicker/1.7.1/locales/bootstrap-datepicker.ko.min.js'/>"></script>
	<script src="<c:url value='/webjars/bootstrap-daterangepicker/2.1.24/js/bootstrap-daterangepicker.js'/>"></script>
	
	<script src="<c:url value='/js/browser_check.js' />"></script>
	<script src="<c:url value='/js/jquery.slimscroll.js'/>"></script>
			
	<script src="<c:url value='/js/moment.js'/>"></script>
	<script src="<c:url value='/js/validate.js'/>"></script>
	<script src="<c:url value='/js/common.js'/>"></script>
	
	<!--[if lt IE 9]>	
	<script src="<c:url value='/webjars/respond/1.4.2/dest/respond.min.js'/>"></script>
	<script src="<c:url value='/webjars/json2/20140204/json2.min.js'/>"></script>
    <script src="<c:url value='/webjars/html5shiv/3.7.3/html5shiv.min.js'/>"></script>
    <![endif]-->
    
</head>
<body>
	<div id="body" >
		<div class="login" >
			<tiles:insertAttribute name="content" />
		</div>
	</div>
</body>
</html>