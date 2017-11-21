<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>

<head>
	<meta charset="utf-8" />
	<title><tiles:insertAttribute name="title" /></title>
<!--
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
-->	
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1"/>	
	<meta http-ｅquiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- css -->

	<link href="<c:url value='/css/bootstrap.min.css'/>"  rel="stylesheet" />
	
	<link href="<c:url value='/css/fancybox/jquery.fancybox.css'/>" rel="stylesheet">
	<link href="<c:url value='/css/flexslider.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/style.css'/>" rel="stylesheet" />
	
	<!-- Theme skin -->
	<link href="<c:url value='/skins/default.css'/>" rel="stylesheet" />
	
		<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	    <![endif]-->
	    
	    
	<!-- javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	
	<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js" integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i" crossorigin="anonymous"></script>
	<script src="<c:url value='/js/common.js'/>"></script>
	<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script> <![endif]-->
	
</head>
<body>

	<div id="body" >
		<div class="body" >
			<tiles:insertAttribute name="content" />
		</div>
	</div>

</body>
</html>
