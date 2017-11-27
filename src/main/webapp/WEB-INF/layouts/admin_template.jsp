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
<!-- 	
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	
 -->	<link href="<c:url value='/css/bootstrap.min.css'/>"  rel="stylesheet" />
	
	<link href="<c:url value='/css/fancybox/jquery.fancybox.css'/>" rel="stylesheet">
	<link href="<c:url value='/css/flexslider.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/style.css'/>" rel="stylesheet" />
	
	<link href="<c:url value='/css/front/css/reply.css'/>" rel="stylesheet" />
	
	<!-- Theme skin -->
	<link href="<c:url value='/skins/default.css'/>" rel="stylesheet" />
	
	<link href="<c:url value='/css/datepicker.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/datepicker3.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/daterangepicker-bs3.css'/>" rel="stylesheet" />
	
	<!--  admin css  -->
	<link href="<c:url value='/css/admin/admin.css' />" rel="stylesheet" />
	
	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	    <![endif]-->
	    
	    
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	
	<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
	
	<script src="<c:url value='/js/jquery-ui.js'/>"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js" integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script src="<c:url value='/js/browser_check.js' />"></script>
	<script src="<c:url value='/js/jquery.slimscroll.js'/>"></script>
	<script src="<c:url value='/js/jquery.cookie.js'/>"></script>
		
	<script src="<c:url value='/js/bootstrap-datepicker.js'/>"></script>
	<script src="<c:url value='/js/bootstrap-datepicker.kr.js'/>"></script>
	<script src="<c:url value='/js/moment.js'/>"></script>
	<script src="<c:url value='/js/daterangepicker.js'/>"></script>
	<script src="<c:url value='/js/validate.js'/>"></script>
	
	<%-- <script src="<c:url value='/js/jquery.easing.1.3.js'/>"></script>
	<script src="<c:url value='/js/jquery.fancybox.pack.js'/>"></script>
	<script src="<c:url value='/js/jquery.fancybox-media.js'/>"></script>
	<script src="<c:url value='/js/google-code-prettify/prettify.js'/>"></script>
	<script src="<c:url value='/js/portfolio/jquery.quicksand.js'/>"></script>
	<script src="<c:url value='/js/portfolio/setting.js'/>"></script>
	<script src="<c:url value='/js/jquery.flexslider.js'/>"></script>
	<script src="<c:url value='/js/animate.js'/>"></script>
	<script src="<c:url value='/js/custom.js'/>"></script>
	 --%>
	
	<script src="<c:url value='/js/common.js'/>"></script>
	<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script> <![endif]-->
		
</head>
<body>
	<div id="wrapper">
		<tiles:insertAttribute name="header" />
		<div id="body" >
			<div class="body" >
				<tiles:insertAttribute name="menu" />
				<tiles:insertAttribute name="content" />
			</div>
		</div>
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>