<%@ page contentType="text/html; charset=euc-kr" %>
<%@page import="com.ksign.access.sso.sso10.SSO10Conf"%>
<%@ page import="com.ksign.access.api.*" %>

<%
	SSORspData rspData = null;
	SSOService ssoService = SSOService.getInstance();
    rspData = ssoService.ssoGetLoginData(request);

	session.setAttribute("m_sso_id", rspData.getAttribute(SSO10Conf.UIDKey));

	//response.sendRedirect("https://www2.seoul.go.kr/monitor/front/main.do");
%>


<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>
index
</title>
<link rel="stylesheet" href="./css/purple_index_style.css" type="text/css" media="all" />
<link rel="stylesheet" href="./css/join.css" type="text/css" media="all" />

<script src="./jquery.js"></script>

</head>
<body bgcolor="#ffffff">


<form>
<input type="hidden" name="id" value="<%=rspData.getAttribute(SSO10Conf.UIDKey)%>">
</form>


<script>
//chk_login();

        function chk_login() {


                $.ajax({
                        async : true,
                        type : "POST",
                        url : "/monitor/member/checkMember.do",
                        data : $("form").serialize(),
                        success : function(data) {
                                if (data.result == "success") {
                                        location.href="/monitor/front/info/join/join_view.do";

                                } else {
                                        location.href="/monitor/front/info/join/join_view.do"
                                }
                        },
                        error : function() {
                                alert("error!!");
                        }
                });


        }
</script>


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
		                  <li>해당 화면은 통합인증(SSO) 연계를 위해 가상으로 개발된 로그인 페이지로 회원정보를 출력합니다.</li>
		                </ul>
<fieldset>
<font color="gray"><p align="right">
<a href="http://lms.seoul.go.kr:8080/sso/index.jsp"><b>Home </a> | 
<a href="http://yeyak.seoul.go.kr/sso/index.jsp">공공서비스예약 1</a> | 
<a href="http://petition.seoul.go.kr/sso/index.jsp">서울천만인소</a> | 
<a href="http://mileage.seoul.go.kr/sso/index.jsp">마일리지시스템</b></a></p></font></br>

 <label>UID : <%=rspData.getAttribute(SSO10Conf.UIDKey)%></label> <br /> 
 <label>AM : <%=rspData.getAttribute(SSO10Conf.AMKey)%></label><br />
 <label>TS : <%=rspData.getAttribute(SSO10Conf.TSKey)%></label><br /> 
 <label>CP : <%=rspData.getAttribute(SSO10Conf.CPKey)%></label>


</fieldset>
</div>
 <div class="adArea">
                    <a href="#" target="_blank"><img src="./images/ksign_banner.png" alt="banner" align="center"/></a>
                </div>
                <!-- //bannerArea -->
            </div>
            <!-- //loginAreaWrap -->
            <div class="footer">
                <span class="copy">COPYRIGHT(C) 2009<strong> KSIGN</strong>. ALL RIGHT RESERVED.</span>
            </div>
        </div>
        <!-- //loginWrap -->
    </div>
    <!-- //container -->
<!--<form action="http://server.ksign.com:18080/sso/pmi-logout-url.jsp?returl=http://agent.ksign.com:28080/index.jsp" method="post" name="login_form">-->
 
<!-- <form action="http://server.ksign.com:18080/sso/pmi-global-logout.jsp?pmi-logout-url=http://server.ksign.com:18080/pmi-logout.jsp&returl=http://agent.ksign.com:28080/index.jsp" method="post" name="login_form">
-->


</body>
</html>
