<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>

<head>
	<meta charset="utf-8" />
	<title><tiles:insertAttribute name="title" /></title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1"/> -->	
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- css -->
 
	<link href="<c:url value='/webjars/bootstrap/3.3.7/css/bootstrap.min.css' />" rel="stylesheet" />
	
	<link href="<c:url value='/css/bootstrap.min.css'/>"  rel="stylesheet" />
	
	<link href="<c:url value='/css/fancybox/jquery.fancybox.css'/>" rel="stylesheet">
	<link href="<c:url value='/css/flexslider.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/style.css'/>" rel="stylesheet" />
	
	<!-- Theme skin -->
	<link href="<c:url value='/skins/default.css'/>" rel="stylesheet" />
	
	<link href="<c:url value='/webjars/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css'/>" rel="stylesheet"/>
	<link href="<c:url value='/webjars/bootstrap-daterangepicker/2.1.24/css/bootstrap-daterangepicker.css'/>" rel="stylesheet" />
	
	
	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>	
	<script src="<c:url value='/webjars/respond/1.4.2/dest/respond.min.js'/>"></script>
	<script src="<c:url value='/webjars/json2/20140204/json2.min.js'/>"></script>
    <script src="<c:url value='/webjars/html5shiv/3.7.3/html5shiv.min.js'/>"></script>
    <![endif]-->

	
	<script src="<c:url value='/webjars/jquery/1.12.4/jquery.min.js'/>"></script>
	<script src="<c:url value='/webjars/jquery-form/4.2.1/jquery.form.min.js'/>"></script>
	<script src="<c:url value='/webjars/bootstrap/3.3.7/js/bootstrap.min.js'/>"></script>
	
	<script src="<c:url value='/js/browser_check.js' />"></script>
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
