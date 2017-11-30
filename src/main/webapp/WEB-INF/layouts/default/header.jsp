<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();

	String spath = request.getServletPath();
	session.setAttribute("s_url", url);
	
	Object lobj_getdata = session.getAttribute("m_sso_id");
	String sso_id = (String)lobj_getdata;


	Object m_infos_tmp = session.getAttribute("grade");
	String m_infos = (String)m_infos_tmp;
%>

<!-- 서울 GNB 스크립트 -->
<script type="text/javascript" src="//www.seoul.go.kr/seoulgnb/gnb.js"></script>

<!--  
<script src="<c:url value='/js/gnb.js'/>"></script>
-->


<!-- 서울 GNB 영역 -->

<script type="text/javascript">
// GNB 로딩 스크립트
// Yjs.Gnb.init('사이트코드', 'GNB 표출영역 ID');
window.onload = function() {
Yjs.Gnb.init('S020', 'seoul-common-gnb');

};
</script>



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
			////console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function fnCheckSession(){

	var ret = "F";
	
	
	$.ajax({
		async : false,
		type : "POST",
		url : "<c:url value='/member/checkSession.do'/>",
		success : function(data){
			if(data.result == "success"){
				
				if(data.grade == "admin"){
					location.href="https://research.seoul.go.kr/monitor/sso/logout.jsp";
				} 
				/*
				var account_n = data.account.name;
				
				$("#account_id").text(account_n.substring(0,4)+"*****");
				
				$("#login_form").css("display" , "none");
				$("#logout_form").css("display" , "block");*/
				ret = true;
			}else{
				$('html').css('display','none');
				location.href="https://research.seoul.go.kr/monitor/front/main.do";
				alert("세션이 끊겼습니다.\n로그인 후 이용하세요.");
				ret = false;
			}
		},
		error : function(request,status,error) {
			////console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			ret = false;
		}
	});
	
	return ret;
}

function joinSeoul(){
	var loginPath = "https://www.seoul.go.kr/seoul/jsp/smem/UserLoginSSL.jsp?refresh_url=https://research.seoul.go.kr/monitor/sso/index.jsp?rtn=" + jQuery(location).attr("pathname") + jQuery(location).attr("search");
	document.location.href=loginPath;
}

function loginSeoul(){
	if(confirm('로그인 후 사용가능합니다.\n로그인 페이지로 이동하시겠습니까?')){
		joinSeoul();
	}else{
		return false;
	}
}

function logout(){
    sessionStorage.clear();
    //var logoutPath = "https://www.seoul.go.kr/seoul/jsp/smem/logout.jsp?SSid=102_09";
    var logoutPath = "http://www.seoul.go.kr/seoul/jsp/smem/logout.jsp?sNextVal=http://research.seoul.go.kr/monitor/";

    document.location.href=logoutPath;
}


</script>

<div class="site_wrapper">

<style>
	/* .content_right img {max-width: 100% !important; height: auto !important;} */
	.logout_form{display:none}

#seoul-gnb-plugin.white{
    background-color: #c6d7f1;
    border-color: #c6d7f1;
    color: #666;
}

#seoul-gnb-plugin.white .seoul-gnb-menu > dd > a {
    border-right: 1px solid #c6d7f1;
}

#seoul-gnb-plugin.white .seoul-gnb-menu{
	border-right: 1px solid #c6d7f1;
    border-left: 1px solid #c6d7f1;
    background: #c6d7f1;
}

.navbar-nav>li>a>b{color:darkblue;}
</style>


<header id="header">
 
	<div id="trueHeader">
    
		<div class="wrapper">
    
    
			<div id="m_hidden" class="logoarea">
				<div class="container">
    
					<!-- Logo -->
					<div id="m_hidden" class="logo">
						
						<div id='seoul-common-gnb' style="width:330%;"></div>

					</div>
    
					<div id="m_hidden" class="right_links">
        
						<ul class="login_form" id="login_form">  
							<li class="link"><a href="<c:url value='/front/sitemap.do'/>"><i class="fa fa-edit"></i> 사이트맵</a></li>
							<li class="link">
	<a id="loginSubmit" href="javascript:joinSeoul();" >
<!--	<a href="https://www.seoul.go.kr/seoul/jsp/smem/UserLoginSSL.jsp?refresh_url=https://research.seoul.go.kr/monitor/sso/index.jsp"> -->
								<i class="fa fa-edit"></i> 꼼꼼씨 로그인</a></li>            
						</ul>
						<ul class="logout_form" id="logout_form">
							<li> <label id="account_id"></label> 님  </li>            
							<li class="link">
								<a href="<c:url value='/front/sitemap.do'/>"><i class="fa fa-edit"></i> 사이트맵</a></li>
							<li class="link" style="width: 80px;">
								<!-- <a href="<c:url value="/sso/logout.jsp"/>"> -->
                                <a href="javascript:logout();" >
                                	<i class="fa fa-edit"></i> 로그아웃
                                </a>
                            </li>            
						</ul>
						
					</div><!-- end right links -->
    
    
				</div>
			</div>
  
			<!-- Menu -->
			<div class="menu_main">
    
				<div class="container">
					
					<div class="navbar yamm">
    
						<div class="container" style="z-index:9;">
							<div class="navbar-header">
								<div class="navbar-toggle .navbar-collapse .pull-right "  >
									<a href="<c:url value='/front/main.do'/>" style="z-index:99999999;">
										<img src="<c:url value='/img/front/top_logo2.png'/>" class="s_logo" /></a>
									<button type="button" data-toggle="collapse" data-target="#navbar-collapse-1" style="padding-top:10px;"> <i class="fa fa-bars fa-2x" style="color:black;"></i>
									</button>
								</div>
						  </div>
						  
							<div id="navbar-collapse-1" class="navbar-collapse collapse" style="z-index:99; font-size:14px;">
								<a href="<c:url value='/front/main.do'/>" style="padding:0 10px;float:left;" class="logo"><img src=" <c:url value='/img/front/top_logo2.png'/>" style="width:100%"/></a>
								<ul class="nav navbar-nav">
									<li class="first"><a href="<c:url value='/front/info/join/info_list.do'/>" class="<c:if test="${menu.depth2 eq 'info' }">active</c:if>"><b>꼼꼼한 서울씨</b></a></li>
			                        <li><a href="<c:url value='/front/notice/all/list.do'/>" class="<c:if test="${menu.depth2 eq 'notice' }">active</c:if>"><b>공지사항</b></a></li>
			                        <li><a href="<c:url value='/front/monitoring/monitoring/list.do'/>" class="<c:if test="${menu.depth2 eq 'monitoring' }">active</c:if>"><b>모니터링 과제</b></a></li>
			                        <li><a href="<c:url value='/front/community/photo/photo_list.do'/>" class="<c:if test="${menu.depth2 eq 'community' }">active</c:if>"><b>게시판</b></a></li>
<%
if (sso_id != null && m_infos == null) 
{
%>
			                        <li><a href="javascript:alert('꼼꼼한 서울씨 회원이 아닙니다.')" class="<c:if test="${menu.depth2 eq 'mypage' }">active</c:if>"><b>마이페이지</b></a></li>						            
<%
}else if (sso_id == null && m_infos == null){
%>
			                        <li><a href="javascript:loginSeoul();" class="<c:if test="${menu.depth2 eq 'mypage' }">active</c:if>"><b>마이페이지</b></a></li>						            
<%
}else if (m_infos.contains("secession")){
%>
			                        <li><a href="javascript:alert('꼼꼼한 서울씨 회원이 아닙니다.')" class="<c:if test="${menu.depth2 eq 'mypage' }">active</c:if>"><b>마이페이지</b></a></li>						            
<%
}else{
%>
			                        <li><a href="<c:url value='/front/mypage/history/list.do'/>" class="<c:if test="${menu.depth2 eq 'mypage' }">active</c:if>"><b>마이페이지</b></a></li>						            
<%
}
%>

			                        <li class="m_block"><a href="<c:url value='/front/sitemap.do'/>"><b>사이트맵</b></a></li>
			                        <li class="m_block_login" id="mlogin_form"> 
							<a id="loginSubmit" href="javascript:joinSeoul();" >
							<!--	
							<a href="https://www.seoul.go.kr/seoul/jsp/member/UserLogin.jsp?SITE_GB=GB002&refresh_url=https://research.seoul.go.kr/monitor/sso/index.jsp"> 
							-->
							<b>로그인</b></a>
						</li>
			                        <li class="m_block_login" id="mlogout_form"> <a href="<c:url value="/sso/logout.jsp"/>"><b> 로그아웃</b></a></li>						            

<!--  
									<li class="login_form" id="mlogin_form" style="display:none"><a href="https://www.seoul.go.kr/seoul/jsp/member/UserLogin.jsp?SITE_GB=GB002&refresh_url=https://reserch.seoul.go.kr/monitor/sso/index.jsp"><i class="fa fa-edit"></i> 로그인</a></li>
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
