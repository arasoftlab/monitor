<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; content=&quot;no&quot; charset=utf-8; imagetoolbar;">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta name="author" content="https://research.seoul.go.kr/monitor/">
	<title>꼼꼼한 서울씨</title>
	<link href="/monitor/css/front/css/reset.css" rel="stylesheet">
	<link href="/monitor/css/front/css/style.css" rel="stylesheet">
	<link href="/monitor/css/front/css/font-awesome.min.css" rel="stylesheet">
	<link href="/monitor/css/front/css/responsive-leyouts.css" rel="stylesheet">
	<link href="/monitor/css/front/css/animations.min.css" rel="stylesheet">
	<link href="/monitor/css/front/css/slate.css" rel="stylesheet">
	
	<link href="/monitor/css/front/css/stickytwo.css" rel="stylesheet">
	<link href="/monitor/css/front/css/bootstrap.min.css" rel="stylesheet">
	<link href="/monitor/css/front/css/demo.css" rel="stylesheet">
	<link href="/monitor/css/front/css/menu.css" rel="stylesheet">
	
	<link href="/monitor/css/front/css/responsive-tabs3.css" rel="stylesheet">
	<link href="/monitor/css/front/css/skin.css" rel="stylesheet">
	<link href="/monitor/css/front/css/ui.progress-bar.css" rel="stylesheet">
	
	<link href="/monitor/css/front/css/jcarousel.responsive.css" rel="stylesheet">
	<link href="/monitor/css/front/css/base.css" rel="stylesheet">

	<script src="/monitor/js/jquery.js"></script>

	
</head>
<body>

<script>


$(document).ready(function() {
	fnCheckSession_idView();
});

function fnCheckSession_idView(){
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/member/checkSession.do'/>",
		success : function(data){
			if(data.result == "success"){

				var account_n = data.account.id;
				
				$("#account_id").text(account_n.substring(0,3)+"*****");
				
				$("#login_form").css("display" , "none");
				$("#logout_form").css("display" , "block");

				$("#mlogin_form").css("display" , "none");
				$("#mlogout_form").css("display" , "block");
				
			}else{
				$("#mlogin_form").css("display" , "block");
				$("#mlogout_form").css("display" , "none");
			}
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function fnCheckSession(){

	$.ajax({
		async : false,
		type : "POST",
		url : "<c:url value='/member/checkSession.do'/>",
		success : function(data){
			if(data.result == "success"){
				
				if(data.grade == "admin"){
					location.href="https://research.seoul.go.kr/monitor/sso/logout.jsp";
				} 
				
				var account_n = data.account.name;
				
				$("#account_id").text(account_n.substring(0,4)+"*****");
				
				$("#login_form").css("display" , "none");
				$("#logout_form").css("display" , "block");
			}else{
				$('html').css('display','none');
				location.href="https://research.seoul.go.kr/monitor/front/main.do";
				alert("세션이 끊겼습니다.로그인 후 이용하세요.");
			}
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			
		}
	});
}

</script>

<div class="site_wrapper">

<style type="text/css">
	.content_right img {max-width: 100% !important; height: auto !important;}
	.logout_form{display:none}
</style>


<header>
 
	<div id="trueHeader">
    
		<div class="wrapper">
    
    
			<div id="m_hidden" class="logoarea">
				<div class="container">
    
					<!-- Logo -->
					<div id="m_hidden" class="logo">
						
						<div id="seoul-common-header" style="width:400px;">
							<iframe src="https://www.seoul.go.kr/seoul-common-gnb/seoul-common-gnb-type-b.html?gid=seoulbrand" width="380" height="28" frameborder="0" scrolling="no" title="서울시 새소식"></iframe>
						</div>

					</div>
    
					<div id="m_hidden" class="right_links">
        
						<ul class="login_form" id="login_form">  
							<li class="link"><a href="<c:url value='/front/sitemap.do'/>"><i class="fa fa-edit"></i> 사이트맵</a></li>
							<li class="link"><a href="https://www.seoul.go.kr/seoul/jsp/member/UserLogin.jsp?SITE_GB=GB002&refresh_url=https://research.seoul.go.kr/monitor/sso/index.jsp"><i class="fa fa-edit"></i> 로그인</a></li>            
						</ul>
						<ul class="logout_form" id="logout_form">
							<li> <label id="account_id"></label> 님  </li>            
							<li class="link"><a href="<c:url value='/front/sitemap.do'/>"><i class="fa fa-edit"></i> 사이트맵</a></li>
							<li class="link"><a href="<c:url value="/sso/logout.jsp"/>"><i class="fa fa-edit"></i> 로그아웃</a></li>            
						</ul>
						
					</div><!-- end right links -->
				</div>
			</div>
  
			<!-- Menu -->
			<div class="menu_main">
    
				<div class="container">
					
					<div class="navbar yamm navbar-default">
    
						<div class="container" style="z-index:9;">
							<div class="navbar-header">
								<div style="padding-bottom:15px;" class="navbar-toggle .navbar-collapse .pull-right "  >
									<a href="<c:url value='/front/main.do'/>" style="z-index:99999999;">
										<img src="<c:url value='/img/front/top_logo2.png'/>" class="s_logo" /></a>
									<button type="button" data-toggle="collapse" data-target="#navbar-collapse-1"> <i class="fa fa-bars"></i>
									</button>
								</div>
						  </div>
						  
							<div id="navbar-collapse-1" class="navbar-collapse collapse" style="z-index:99;">
								<a href="<c:url value='/front/main.do'/>" style="padding:0 10px;float:left;" class="logo"><img src=" <c:url value='/img/front/top_logo2.png'/>" style="width:100%"/></a>
								<ul class="nav navbar-nav">
									<li class="first"><a href="<c:url value='/front/info/join/info_list.do'/>" class="<c:if test="${menu.depth2 eq 'info' }">active</c:if>"><b>꼼꼼한 서울씨</b></a></li>
			                        <li><a href="<c:url value='/front/notice/all/list.do'/>" class="<c:if test="${menu.depth2 eq 'notice' }">active</c:if>"><b>공지사항</b></a></li>
			                        <li><a href="<c:url value='/front/monitoring/monitoring/list.do'/>" class="<c:if test="${menu.depth2 eq 'monitoring' }">active</c:if>"><b>모니터링 과제</b></a></li>
			                        <li><a href="<c:url value='/front/community/photo/photo_list.do'/>" class="<c:if test="${menu.depth2 eq 'community' }">active</c:if>"><b>게시판</b></a></li>
			                        <li><a href="<c:url value='/front/mypage/history/list.do'/>" class="<c:if test="${menu.depth2 eq 'mypage' }">active</c:if>"><b>마이페이지</b></a></li>						            
			                        <li class="m_block"><a href="<c:url value='/front/mypage/history/list.do'/>" class="<c:if test="${menu.depth2 eq 'mypage' }">active</c:if>"><b>사이트맵</b></a></li>
			                        <li class="m_block"><a href="<c:url value='/front/mypage/history/list.do'/>" class="<c:if test="${menu.depth2 eq 'mypage' }">active</c:if>"><b>로그인</b></a></li>
			                        <li class="m_block"><a href="<c:url value='/front/mypage/history/list.do'/>" class="<c:if test="${menu.depth2 eq 'mypage' }">active</c:if>"><b>로그아웃</b></a></li>						            

<!--  
									<li class="login_form" id="mlogin_form" style="display:none"><a href="https://www.seoul.go.kr/seoul/jsp/member/UserLogin.jsp?SITE_GB=GB002&refresh_url=https://research.seoul.go.kr/monitor/sso/index.jsp"><i class="fa fa-edit"></i> 로그인</a></li>
									<li class="logout_form" id="mlogout_form" style="display:none"><a href="<c:url value="/sso/logout.jsp"/>"><i class="fa fa-edit"></i> 로그아웃</a></li>            									
-->
								</ul>      
        
            
							</div>
						</div>
					</div>
     
				</div>
			</div><!-- end menu -->
        
		</div>
    
	</div>
    
</header>

<img src="/monitor/img/front/main.jpg" style="margin-top: 3px; width: 80%; margin-left: 10%;">
<div style="text-align: center;margin-top:-24%; font-weight: bold; font-size: 16px;padding-bottom: 215px;">
불편을 드려서 죄송합니다.<br>
사이트 관리자에게 문의해 주시기 바랍니다.<br><br>
<a href="<c:url value='/front/main.do'/>" style="color:#5CD1E5;">[홈으로 이동]</a>
</div>


<jsp:include page="/WEB-INF/layouts/default/footer.jsp"></jsp:include>

</body>
</html>
