
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%

    Object lobj_getdata = session.getAttribute("m_sso_id");
    String sso_id = (String)lobj_getdata;

%>

<form>

<input type="hidden" name="id" value="<%=sso_id%>" >

</form>


<script>

	function chk_login() {
		
	
		$.ajax({
			async : true,
			type : "POST",
			url : "https://research.seoul.go.kr/monitor/member/checkMember.do",
			data : $("form").serialize(),
			success : function(data) {
				if (data.result == "success") {
					//$("form").attr("action", "<c:url value='/front/main.do'/>").submit();
					//location.href="https://www.seoul.go.kr/seoul/jsp/member/UserLogin.jsp?SITE_GB=GB002&refresh_url=https://research.seoul.go.kr/monitor";
alert('123');
				} else {
					//alert("로그인 정보가 일치하지 않습니다.\n확인 후 다시 시도 하세요.");
alert('222');

alert(data.result);

				}
			},
			error : function() {
				
			}
		});
		
		
	}
</script>

<style>
.btn2{padding:0; height:100%;}
</style>


