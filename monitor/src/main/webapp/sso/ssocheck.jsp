<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="com.ksign.access.sso.sso10.SSO10Conf"%>
<%@ page import="com.ksign.access.api.*" %>

<%
//***********************************************************************
//*		JSP �α��� üũ													*
//***********************************************************************
	SSORspData rspData = null;
	SSOService ssoService = SSOService.getInstance();
	rspData = ssoService.ssoGetLoginData(request);

	// SSO ����
	String SSO_MEM_ID = rspData.getAttribute("KSIGN_FED_USER_ID");
	if((SSO_MEM_ID == null) || (SSO_MEM_ID == "")){
		SSO_MEM_ID = rspData.getAttribute(SSO10Conf.UIDKey);
	}
	String SSO_REALNAME_YN = rspData.getAttribute("REALNAME_YN");
	String SSO_MEM_NM = rspData.getAttribute("NAME");
	

	// ���� ���� ���� - ex.��������� ���� ����
	String MEM_ID = (String)request.getSession().getAttribute("MEM_ID");
	String MEM_NM = (String)request.getSession().getAttribute("MEM_NM");
	String REALNAME_YN = (String)request.getSession().getAttribute("REALNAME_YN");
	

	boolean isTokenDel = false;	// kalogin ��Ű ���� ���� <- SSO �������� kalogin ��Ű �����Ǿ�� �Կ��� �ȵǴ� ��찡 �ִ°� ����.
	
	
	System.out.println("ssocheck.jsp - SSO_MEM_ID : " + SSO_MEM_ID + "<br/>");
	System.out.println("ssocheck.jsp - MEM_ID : " + MEM_ID + "<br/>");
	

	if((MEM_ID == null) || (MEM_ID == "")){
		// ���� ���� ���� ���� ����.

		if((SSO_MEM_ID == null) || (SSO_MEM_ID == "")){
			// SSO ����, ���� ���� ���� ��� ���� ��� - ���շα��� �ȵ� ����
			//out.println("1. �� ȸ��");
			
			// ��ū ����~
			isTokenDel = true;

		} else{
			// SSO ���� ����(���շα��� �� ����)
			// ���� ���� ������ �������� ���� => ���� ���� ���� ����
			session.setAttribute("MEM_ID", SSO_MEM_ID);
			session.setAttribute("MEM_NM", SSO_MEM_NM);
			session.setAttribute("REALNAME_YN", SSO_REALNAME_YN);
			//out.println("2. ȸ�� sso���� ���� ��ü session���� sso�� ����");
		}

	} else {
		// ���� ���� ���� ���� ��.

		if((SSO_MEM_ID == null) || (SSO_MEM_ID == "")){
			// SSO ���� ���� ���� - ���� ���� ���� �ʱ�ȭ
			session.setAttribute("MEM_ID", "");
			session.setAttribute("MEM_NM", "");
			session.setAttribute("REALNAME_YN", "");
			//out.println("SSO_MEM_ID = " + SSO_MEM_ID);
			//out.println("3. ��ȸ�� : ��ü session ���� �ϳ� sso ���� ���� ����, ��ü session�� �ʱ�ȭ ");
			
			
			// ��ū ����~
			isTokenDel = true;
			

		} else{
			// SSO ���� ���� ��.

			if(MEM_ID != SSO_MEM_ID){
				// SSO ���� ����ھ��̵�� ���� ���� ���� ����ھ��̵� �ٸ� ���
				// SSO ���� ������ ���� ���� ���� ���� ��.
				session.setAttribute("MEM_ID", SSO_MEM_ID);
				session.setAttribute("MEM_NM", SSO_MEM_NM);
				session.setAttribute("REALNAME_YN", SSO_REALNAME_YN);
				//out.println("4. ȸ�� : ��ü session���� sso���� �ٸ� sso������ ��ü session�� ����");

			} else {
				//out.println("5. ȸ�� : sso���� ��ü session���� ����" + "<br>");
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
		
		// ��ū ��Ű ����, _SSO_Global_Logout_url
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
