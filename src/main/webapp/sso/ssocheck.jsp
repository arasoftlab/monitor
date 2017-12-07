<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="com.ksign.access.sso.sso10.SSO10Conf"%>
<%@ page import="com.ksign.access.api.*" %>

<%
//***********************************************************************
//*		JSP 로그인 체크													*
//***********************************************************************
	SSORspData rspData = null;
	SSOService ssoService = SSOService.getInstance();
	rspData = ssoService.ssoGetLoginData(request);

	// SSO 세션
	String SSO_MEM_ID = rspData.getAttribute("KSIGN_FED_USER_ID");
	if((SSO_MEM_ID == null) || (SSO_MEM_ID == "")){
		SSO_MEM_ID = rspData.getAttribute(SSO10Conf.UIDKey);
	}
	String SSO_REALNAME_YN = rspData.getAttribute("REALNAME_YN");
	String SSO_MEM_NM = rspData.getAttribute("NAME");
	

	// 개별 서버 세션 - ex.시정모니터 서버 세션
	String MEM_ID = (String)request.getSession().getAttribute("MEM_ID");
	String MEM_NM = (String)request.getSession().getAttribute("MEM_NM");
	String REALNAME_YN = (String)request.getSession().getAttribute("REALNAME_YN");
	

	boolean isTokenDel = false;	// kalogin 쿠키 삭제 여부 <- SSO 서버에서 kalogin 쿠키 삭제되어야 함에도 안되는 경우가 있는것 같음.
	
	
	System.out.println("ssocheck.jsp - SSO_MEM_ID : " + SSO_MEM_ID + "<br/>");
	System.out.println("ssocheck.jsp - MEM_ID : " + MEM_ID + "<br/>");
	

	if((MEM_ID == null) || (MEM_ID == "")){
		// 개별 서버 세션 존재 안함.

		if((SSO_MEM_ID == null) || (SSO_MEM_ID == "")){
			// SSO 세션, 개별 서버 세션 모두 없는 경우 - 통합로그인 안된 상태
			//out.println("1. 비 회원");
			
			// 토큰 삭제~
			isTokenDel = true;

		} else{
			// SSO 세션 존재(통합로그인 된 상태)
			// 개별 서버 세션은 존재하지 않음 => 개별 서버 세션 생성
			session.setAttribute("MEM_ID", SSO_MEM_ID);
			session.setAttribute("MEM_NM", SSO_MEM_NM);
			session.setAttribute("REALNAME_YN", SSO_REALNAME_YN);
			//out.println("2. 회원 sso값만 존제 자체 session값에 sso값 저장");
		}

	} else {
		// 개별 서버 세션 존재 함.

		if((SSO_MEM_ID == null) || (SSO_MEM_ID == "")){
			// SSO 세션 존재 안함 - 개별 서버 세션 초기화
			session.setAttribute("MEM_ID", "");
			session.setAttribute("MEM_NM", "");
			session.setAttribute("REALNAME_YN", "");
			//out.println("SSO_MEM_ID = " + SSO_MEM_ID);
			//out.println("3. 비회원 : 자체 session 존재 하나 sso 에는 존재 안함, 자체 session값 초기화 ");
			
			
			// 토큰 삭제~
			isTokenDel = true;
			

		} else{
			// SSO 세션 존재 함.

			if(MEM_ID != SSO_MEM_ID){
				// SSO 세션 사용자아이디와 개별 서버 세션 사용자아이디가 다른 경우
				// SSO 세션 정보로 개별 서버 세션 갱신 함.
				session.setAttribute("MEM_ID", SSO_MEM_ID);
				session.setAttribute("MEM_NM", SSO_MEM_NM);
				session.setAttribute("REALNAME_YN", SSO_REALNAME_YN);
				//out.println("4. 회원 : 자체 session값과 sso값이 다름 sso값으로 자체 session값 변경");

			} else {
				//out.println("5. 회원 : sso값과 자체 session값이 동일" + "<br>");
				//out.println("SSO_MEM_ID = " + SSO_MEM_ID + "<br>");
				//out.println("MEM_ID = " + MEM_ID + "<br>");
				//out.println("SSO_MEM_NM = " + SSO_MEM_NM + "<br>");
				//out.println("SSO_REALNAME_YN = " + SSO_REALNAME_YN + "<br>");
			}
		}
	}
	
	
	
	String TokenChk = "N";
	String TokenChkCookie = "";
	Cookie[] cookiess = request.getCookies();
	if(cookiess == null || cookiess.length == 0){
	}else{
	  for(int i = 0; i<cookiess.length; i++){
	    //if(cookiess[i].getName().equals("_SSO_Global_Logout_url")){
	    if(cookiess[i].getName().equals("kalogin")){
	    	TokenChkCookie=cookiess[i].getValue();
	      break;
	    }
	  }
	}

	if(TokenChkCookie.length() > 0){
		TokenChk = "Y";
	}

	System.out.println("ssocheck.jsp - kalogin : " + TokenChk + "<br/>");


	// test
	if (isTokenDel) {
		
		System.out.println("ssocheck.jsp - kalogin cookie delete.....");
		
		// 토큰 쿠키 삭제, _SSO_Global_Logout_url
		//Cookie m = new Cookie ("_SSO_Global_Logout_url", null);
		
		Cookie m = new Cookie ("kalogin", null);
		m.setDomain("seoul.go.kr");
		m.setPath("/");
		m.setMaxAge(0);
		response.addCookie(m);
		
	}
	


	String SSOreturnUrl = request.getParameter("SSOreturnUrl") == null ? "" : request.getParameter("SSOreturnUrl") ;

	if (SSOreturnUrl.equals("")) {
		SSOreturnUrl = "https://research.seoul.go.kr/monitor";
	}

	response.sendRedirect(SSOreturnUrl);

%>
