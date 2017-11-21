<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.ksign.access.api.SSOService" %>

<%!
	static String GID = SSOService.getInstance().getGid();
%>

<html>
<head>
<title>
login
</title>
</head>
<body bgcolor="#ffffff">
<center>TEST PORTAL 1</center>
<form action="http://sso.seoul.go.kr:8080/sso/pmi-sso-login-uid-password.jsp" method="post" name="login_form">
<center>
<label>User  id </label>&nbsp;&nbsp;  <input name="uid" type="text" value="bin" size="20" maxlength="20">
<br>
<label>password</label> <input name="password" type="password" value="1" size="20" maxlength="20">
<br>
<label>site1</label> <input name="site" type="hidden" size="20" maxlength="20">
<br>
<label>gid</label> <input name="gid" type="hidden" value="<%=GID %>" size="20" maxlength="20">
<br>
<label>returl</label> <input name="returl" type="hidden" size="20" maxlength="20" value="http://agent.ksign.com:8080/filter/index.jsp">
<br>
<input name="login" value="Login" type="submit">
</center>
</form>
</body>

</html>
