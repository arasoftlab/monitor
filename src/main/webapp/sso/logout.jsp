<%@ page contentType="text/html; charset=euc-kr" %>
<%@page import="com.ksign.access.api.*" %>
<%
	String SSO_SERVER = SSOService.getInstance().getServerScheme();
	//   returnUrl : 응용 커스터 마이징 필요
	String returnUrl = "https://research.seoul.go.kr/monitor/sso/index.jsp";	
%>
<html>
<head>
<title>
log out
</title>


</head>
<body bgcolor="#ffffff">
<%
	String logoutParam = request.getParameter("logout");
	session.invalidate();
	if(SSO_SERVER != null && !"1".equals(logoutParam)) {
%>
<script>
top.document.location = "<%=SSO_SERVER%>/sso/pmi-logout-url.jsp?returl=<%=returnUrl%>";
</script>
<%
    }
%>
<a href="<%=request.getContextPath() %>/sso/index.jsp"> 로그인 페이지로 이동 </a>
</body>
</html>
