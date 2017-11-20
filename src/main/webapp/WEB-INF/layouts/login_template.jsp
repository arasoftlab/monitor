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
	
	<link href="<c:url value='/css/datepicker.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/datepicker3.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/daterangepicker-bs3.css'/>" rel="stylesheet" />
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
	<script src="<c:url value='/js/jquery.slimscroll.js'/>"></script>
	<script src="<c:url value='/js/jquery.cookie.js'/>"></script>
		
	<script src="<c:url value='/js/bootstrap-datepicker.js'/>"></script>
	<script src="<c:url value='/js/bootstrap-datepicker.kr.js'/>"></script>
	<script src="<c:url value='/js/moment.js'/>"></script>
	<script src="<c:url value='/js/daterangepicker.js'/>"></script>
	<script src="<c:url value='/js/validate.js'/>"></script>
	
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>

	
	<script src="<c:url value='/js/common.js'/>"></script>
	<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script> <![endif]-->
	
</head>
<body>
	<div id="body" >
		<div class="login" >
			<tiles:insertAttribute name="content" />
		</div>
	</div>
</body>
</html>