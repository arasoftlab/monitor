<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="com.ksign.access.api.*" %>
<%@ page import="com.ksign.access.sso.SSOConf" %>
<%@ page import="com.ksign.access.sso.sso10.SSO10Conf" %>
<%@ page import="com.ksign.access.ext.AuthenManager"  %>
<%@ page import="com.ksign.access.ext.HttpSessionBindingListnerImplKSign"  %>
<%@ page import="java.io.*" %>
<%!
    // -------------------------------------------------------------------------
    //  [��ƿ] �α��� ���� �߻� ��, alert() ��� �� ���� �������� �̵��ϴ� �޼ҵ�
    // -------------------------------------------------------------------------
    public void sendAlert(HttpServletResponse resp, String alertMsg, String nextURI) throws IOException {

        alertMsg = alertMsg.replaceAll("\"", "\\\"");
        alertMsg = alertMsg.replaceAll("\r", "\\r");
        alertMsg = alertMsg.replaceAll("\n", "\\n");

        String msg = 
            "<script language=\"javascript\">\r\n" +
            "  alert(\"" + alertMsg + "\");\r\n" +
            "  top.location.href = \"" + nextURI + "\";\r\n" +
            "</script>\r\n";

        resp.setCharacterEncoding("MS949");
        // resp.setContentLength();

        PrintWriter out = resp.getWriter();
        out.println(msg);
        out.flush();
    }
%>
<%
	// =========================================================================
	//  <AP.1> SSO ���� ��ü ȹ��
 	// =========================================================================
	SSORspData rspData = null;
	SSOService ssoService = SSOService.getInstance();
	
	// =========================================================================
    //  <AP.2> SSO ������ū ȹ��
    // =========================================================================
        
    rspData = ssoService.ssoGetLoginData(request);
	if(rspData == null || rspData.getResultCode() == -1) {
		// TODO : ������������ or index.jsp �������� �̵�
		String alertMsg = "����� ������ū ȹ�濡 �����Ͽ����ϴ�. �ʱ� ������������ �̵��մϴ�.";
		String nextURI = "../index.jsp";
		sendAlert(response, alertMsg, nextURI);
		return;
	}
	// end: added
		
	// =========================================================================
    //  [AP.3] WAS �������� ���� - ���� Ŀ���͸���¡ �ʿ�
    // =========================================================================
	String uid = rspData.getAttribute("KSIGN_FED_USER_ID");
	if(uid == null) uid = rspData.getAttribute("UID");

	session.setAttribute("uid", uid);
	AuthenManager.getInstance().addUserInfo(session, rspData.getAttribute("UID"), false);
	HttpSessionBindingListnerImplKSign listener = new HttpSessionBindingListnerImplKSign(rspData.getAttribute("UID"), session.getId());
	session.setAttribute("SessionManagerCheck", listener);

	String expireMsg = request.getParameter("expire");
	if(expireMsg != null) session.setAttribute("expire.date", expireMsg);
	//...
	
	// =========================================================================
    //  [AP.4] ���� ������ ���� URL�� �̵�
    // =========================================================================
	String retURL = (String)request.getParameter("returnurl");	
    if(retURL == null){
		// TODO : ������������ or index.jsp �������� �̵�
		String alertMsg = "���� URL ȹ�濡 �����Ͽ����ϴ�. �ʱ� ������������ �̵��մϴ�.";
		String nextURI = "../index.jsp";
		sendAlert(response, alertMsg, nextURI);
		return;	
	}
/*    
	StringBuffer sb = new StringBuffer();

	for( java.util.Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
		String key = (String) en.nextElement();
		if(key.startsWith("returnurl")) continue;
		sb.append(key).append("=").append(java.net.URLEncoder.encode(request.getParameter(key))).append("&");
	}

    response.sendRedirect(retURL + "&" + sb.toString());
	*/
response.sendRedirect(retURL);
    if(true) return;	
%>
