<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="com.ksign.access.api.*" %>

<%
	String fed = request.getParameter("federation");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>login_stand</title>
<link rel="stylesheet" href="./css/purple_index_style.css" type="text/css" media="all" />
<link rel="stylesheet" href="./css/join.css" type="text/css" media="all" />
<script language="javascript">
function login(){
	var f = document.login_form;
		var uid = f.uid.value;
		var pwd = f.password.value;
		
		if(uid == ""){
			alert("아이디를 입력하세요");
			f.uid.focus();
			return;
		}
		if(pwd == ""){
			alert("비밀번호를 입력하세요");
			return;
		}
		if('<%=fed%>'!='null'){
			f.federation.value='<%=fed%>';
		}
		f.action="login_proc.jsp";
		f.submit();

}
function check(){
	if(event.keyCode==13){
		login();
	}
}
</script>
</head>
<body>
<div id="container">
	<div class="loginWrap">
    	<div id="header">
        	<div id="top">
            	<h1 class="logo" title="">
                	<a href="#" title="KSIGN">KSIGN</a>
				</h1>
			</div>
		</div>
		<div class="loginAreaWrap">
        	<div class="loginArea">
	        	<h2>SSO Login</h2>
		        	<ul>
		            	<li>해당 화면은 통합인증(SSO) 연계를 위해 가상으로 개발된 샘플 기관 로그인 페이지로 화면 UI는 적용되지 않았으나<br> 기능적으로 정상동작하는 화면입니다</li>
					</ul>
						<form action="./login_proc.jsp" method="post" name="login_form">
							<input name="federation" type="hidden" value='<%=fed%>' size="20" maxlength="20">
			                	<fieldset>
									<label for="loginId">아이디</label> 
									<input type="text" name="uid" value="" Style="ime-mode:inactive"  class="input_txt" id="loginId" onkeypress=""/> <br/>
									<label for="loginPassword">비밀번호</label>
									<input type="password" name="password" Value="" id="loginPassword" class="input_txt pw" onkeypress="javascript:check();"/> 
									<a class="buttonLogin" onClick="javascript:login();"></a><br>
								</fieldset> <br>
					  </form>
				</div><!-- loginArea -->
                <div class="adArea">
                   <a href="#" target="_blank"><img src="./images/ksign_banner.png" alt="banner" align="center"/></a>
                </div><!-- bannerArea -->
            </div><!-- loginAreaWrap -->
            <div class="footer">
                <span class="copy">COPYRIGHT(C) 2009<strong> KSIGN</strong>. ALL RIGHT RESERVED.</span>
            </div>
        </div><!-- loginWrap -->
    </div><!-- container -->
</body>
</html>