<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv='Content-Type' content='text/html; content="no" charset=utf-8; imagetoolbar;'>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta name="author" content="http://bootstraptaste.com" />
	<title><tiles:insertAttribute name="title" /></title>
	<link href="<c:url value='/css/front/css/reset.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/front/css/style.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/front/css/font-awesome.min.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/front/css/responsive-leyouts.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/front/css/animations.min.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/front/css/slate.css'/>" rel="stylesheet" />
	
	<link href="<c:url value='/css/front/css/stickytwo.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/front/css/bootstrap.min.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/front/css/demo.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/front/css/menu.css'/>" rel="stylesheet" />
	
	<link href="<c:url value='/css/front/css/responsive-tabs3.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/front/css/skin.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/front/css/ui.progress-bar.css'/>" rel="stylesheet" />
	
	<link href="<c:url value='/css/front/css/jcarousel.responsive.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/front/css/base.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/front/css/element.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/front/css/survey.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/front/css/notice.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/front/css/photobbs.css'/>" rel="stylesheet" />

	
	<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js" integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i" crossorigin="anonymous"></script>
	<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script> <![endif]-->

	<script>
		$body = $("body");
	
		$(document).on({
		    ajaxStart: function() { $body.addClass("loading"); },
		    ajaxSubmit: function() { $body.addClass("loading"); },
		    ajaxStop: function() { $body.removeClass("loading"); }  
		});
	</script>
	
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="carousel" />
	<tiles:insertAttribute name="content" />
	<tiles:insertAttribute name="footer" />

	<script src="<c:url value='/css/front/js/custom-1.js'/>"></script>
	<script src="<c:url value='/css/front/js/custom.js'/>"></script>
	<script src="<c:url value='/css/front/js/waltzerjs.js'/>"></script>
	<script src="<c:url value='/css/front/js/jquery.flexslider.js'/>"></script>
	<script src="<c:url value='/css/front/js/responsive-tabs.min.js'/>"></script>
	<script src="<c:url value='/css/front/js/totop.js'/>"></script>
	<script src="<c:url value='/css/front/js/jquery.jcarousel.min.js'/>"></script>
	<script type="text/javascript">

		$(document).ready(function() {
	
			$('#carouseltest').waltzer({scroll:1});
	
		});
	
	</script>
	
	<script src="<c:url value='/css/front/js/jcarousel.responsive.js'/>"></script>
	<script src="<c:url value='/css/front/js/animations.min.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	
</body>
</html>