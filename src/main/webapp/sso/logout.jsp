<%@ page contentType="text/html; charset=euc-kr" %>
<%@page import="com.ksign.access.api.*" %>
<%
	String SSO_SERVER = SSOService.getInstance().getServerScheme();
	//   returnUrl : ���� Ŀ���� ����¡ �ʿ�
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
<script language="JavaScript">
top.document.location = "<%=SSO_SERVER%>/sso/pmi-logout-url.jsp?returl=<%=returnUrl%>";
</script>
<%
    }
%>
<a href="<%=request.getContextPath() %>/sso/index.jsp"> �α��� �������� �̵� </a>
</body>
</html>
