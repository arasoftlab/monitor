<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="com.ksign.access.sso.sso10.SSO10Conf"%>
<%@ page import="com.ksign.access.api.*" %>
<%@ page import="java.util.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%
	SSORspData rspData = null;
	SSOService ssoService = SSOService.getInstance();
    rspData = ssoService.ssoGetLoginData(request);

	session.setAttribute("m_sso_id", rspData.getAttribute(SSO10Conf.UIDKey));
	
	Object lobj_getdata = session.getAttribute("s_url");
	String s_url = (String)lobj_getdata;

	
	if (s_url == null)
	{
		s_url ="/monitor/front/main.do";
	}else{
		s_url ="/monitor/front/main.do";
	}
	
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

	<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>

</head>
<body bgcolor="#ffffff">


<form>
<input type="hidden" name="id" id="id" value="<%=rspData.getAttribute(SSO10Conf.UIDKey)%>">

</form>
<input type="hidden" id="url" name="url" value="<%=s_url%>">

<script>

var adr = "https://research.seoul.go.kr";

var urlParams;
(window.onpopstate = function () {
    var match,
        pl     = /\+/g,  // Regex for replacing addition symbol with a space
        search = /([^&=]+)=?([^&]*)/g,
        decode = function (s) { return decodeURIComponent(s.replace(pl, " ")); },
        query  = window.location.search.substring(1);

    urlParams = {};
    while (match = search.exec(query))
       urlParams[decode(match[1])] = decode(match[2]);
})();

chk_login();

        function chk_login() {
	
        	var url = $("#url").val();
		
		url = urlParams["rtn"] === undefined ? url : urlParams["rtn"];
		
		// 2017-04-11 modify 
		if($("#id").val() ==null || $("#id").val() == ""||$("#id").val()=="null"){
			location.href=adr+url;
		}else{
        	
               		$.ajax({
                        	async : false,
                        	type : "POST",
                        	url : adr+"/monitor/member/checkMember.do",
                        	data : $("form").serialize(),
                        	success : function(data) {
                                	if (data.result == "success") {
									if (data.grade == "secession")
									{
										location.href=adr+url;
									}else
									{ 
				                     	location.href=adr+url;
									}
                                	} else {
                                		location.href=adr+url;
								}
                        	},
                        	error : function() {
                                	location.href=adr+url;
                        	}
                	});
		}


        }
</script>



</body>

</html>
