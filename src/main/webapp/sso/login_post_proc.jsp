<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="com.ksign.access.api.*" %>
<%@ page import="com.ksign.access.sso.SSOConf" %>
<%@ page import="com.ksign.access.sso.sso10.SSO10Conf" %>
<%@ page import="com.ksign.access.ext.AuthenManager"  %>
<%@ page import="com.ksign.access.ext.HttpSessionBindingListnerImplKSign"  %>
<%@ page import="java.io.*" %>
<%!
    // -------------------------------------------------------------------------
    //  [유틸] 로그인 오류 발생 시, alert() 출력 후 다음 페이지로 이동하는 메소드
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
	//  <AP.1> SSO 서비스 객체 획득
 	// =========================================================================
	SSORspData rspData = null;
	SSOService ssoService = SSOService.getInstance();
	
	// =========================================================================
    //  <AP.2> SSO 인증토큰 획득
    // =========================================================================
        
    rspData = ssoService.ssoGetLoginData(request);
	if(rspData == null || rspData.getResultCode() == -1) {
		// TODO : 에러페이지로 or index.jsp 페이지로 이동
		String alertMsg = "사용자 인증토큰 획득에 실패하였습니다. 초기 접속페이지로 이동합니다.";
		String nextURI = "../index.jsp";
		sendAlert(response, alertMsg, nextURI);
		return;
	}
	// end: added
		
	// =========================================================================
    //  [AP.3] WAS 인증세션 설정 - 응용 커스터마이징 필요
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
    //  [AP.4] 최초 접속한 리턴 URL로 이동
    // =========================================================================
	String retURL = (String)request.getParameter("returnurl");	
    if(retURL == null){
		// TODO : 에러페이지로 or index.jsp 페이지로 이동
		String alertMsg = "리턴 URL 획득에 실패하였습니다. 초기 접속페이지로 이동합니다.";
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
