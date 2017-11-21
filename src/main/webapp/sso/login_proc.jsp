<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>
<%@ page import="com.ksign.access.sso.conf.SSOConfManager" %>
<%@ page import="com.ksign.access.api.*"%>
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
	String uid = request.getParameter("uid");
   	String passwd = request.getParameter("password");
	String federation = request.getParameter("federation");
	//String mac_add = request.getParameter("mac");
	
	// =========================================================================
	//  [AP.1] 아이디/패스워드 검증
	// =========================================================================
	if(uid == null || passwd == null){
		String alertMsg = "사용자 ID를 입력하시기 바랍니다.";
		String nextURI = "../index.jsp";
		sendAlert(response, alertMsg, nextURI);
		return;
	} 

	// =========================================================================
	//  [AP.2] was 인증 세션 설정
	// =========================================================================
	session.setAttribute("uid", uid);
	session.setAttribute("ip", request.getRemoteAddr());
		
	// ============================= SSO 설정 시작 =============================
	
	// =========================================================================
	//  <SSO.1> SSO 서비스 객체 획득
	// =========================================================================
	SSOService ssoService = null;
	ssoService = SSOService.getInstance();		
			
	// =========================================================================
    //  <SSO.2> 인증토큰 발급: 추가 속성정보 설정
    //    - 응용시스템에서 SSO 처리 시 필요로하는 추가 정보를 인증토큰을 통해
    //      안전하고 신뢰할수 있는 방식으로 전달하기 위해 사용
    //    - eg. 이름/부서/직급/권한/역할 등
    // =========================================================================
    String avps = "name=hong$nick=ong$test=testValue$order=view";
	    	
   	// =========================================================================
	//  <SSO.3> 인증 토큰 생성 요청 
	//   returnUrl : 응용 커스터 마이징 필요
	// =========================================================================
	String reqCtx = request.getContextPath();
	String returnUrl = "http://" + request.getServerName()+":"+ request.getServerPort() + reqCtx + "/sso/index.jsp";
	//String agentIp = request.getLocalAddr();
	String agentIp = request.getRemoteAddr();
	
	// case.1. SSO API 내에서 SSO 서버로 리다이렉트 수행
	if(federation == null || !federation.equals("ready")) {
		SSORspData rspData = null;	

		rspData = ssoService.ssoReqIssueToken(
								  request,	               	// 서블릿 요청 객체
								  response,					// 서블릿 응답 객체
								  "form-based",				// 인증 방법
								  uid,						// 아이디
								  avps,						// 인증토큰 : 추가 속성정보 설정
								  returnUrl, 				// return url
								  agentIp,	// agent ip
								  request.getRemoteAddr());			    	// client ip
		
		if(rspData != null && rspData.getResultCode() == -1) {
			String alertMsg = "사용자 인증토큰 요청정보 생성에 실패 하였습니다. 시스템 자체 로그인을 수행합니다.";
			String nextURI = reqCtx + "/sso/index.jsp";
			sendAlert(response, alertMsg, nextURI);
			return;
		}
	
	} else {
		com.ksign.access.km.SessionKey sessionKey = com.ksign.access.km.SessionKey.getInstance();
		uid = sessionKey.getKeyInfo().getCipherUtil().doEncryptEncode(uid);

		String SSO_SERVER = SSOService.getInstance().getServerScheme() + "/fed-test.jsp";
		String GID = SSOService.getInstance().getGid();
		response.sendRedirect(SSO_SERVER + "?cmd=addFed&isAgree=Y&userId=" + uid +"&gid=" + GID + "&returl=" + java.net.URLEncoder.encode(returnUrl));
	}

	/*
	// case.2. 응용 jsp 에서  SSO 서버로 리다이렉트 수행  
	String issue = 
	ssoService.ssoReqIssueTokenToString(
							  request,	            	// 서블릿 요청 객체
        				      response,					// 서블릿 응답 객체
                              "form-based",				// 인증 방법
                              uid,				    	// 아이디
                              avps,		            	// 인증토큰 : 추가 속성정보 설정
                              returnUrl,            	// return url
                              request.getRemoteAddr(),	// client ip
                              agentIp);					// agent ip

	if(issue == null ){
		String alertMsg = "사용자 인증토큰 요청정보 생성에 실패 하였습니다. 시스템 자체 로그인을 수행합니다.";
		String nextURI = "index.jsp";
		sendAlert(response, alertMsg, nextURI);
		return;
	} 
    response.sendRedirect(issue);
    */
    
	if(true) return;
	
	// ============================= SSO 설정 끝 =============================	
%>