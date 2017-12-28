<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript">

fnCheckSession();

function fnCheckSession(){

	$.ajax({
		async : false,
		type : "POST",
		url : "<c:url value='/member/checkAdminSession.do'/>",
		success : function(data){
			if(data.result == "success"){
				
			}else{
				$('html').css('display','none');
				location.href="<c:url value='/member/adminlogin.do'/>";
				alert("세션이 끊겼습니다.\n로그인 후 이용하세요.");
			}
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}
</script>

<!-- start header -->
<header>
       <div class="navbar navbar-default navbar-static-top">
           <div class="container">
               <div class="navbar-header">
                   <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                       <span class="icon-bar"></span>
                       <span class="icon-bar"></span>
                       <span class="icon-bar"></span>
                   </button>
                   <a class="navbar-brand"><span>S</span>eoul</a>
               </div>
               <div class="">
                   <ul class="nav navbar-nav">
  	                   <li><a href="<c:url value='/front/main.do'/>">프론트홈</a></li>
                       <li class="<c:if test="${menu.depth2 eq 'notice' }">active</c:if>"><a href="<c:url value='/admin/notice/list.do'/>">공지사항</a></li>
                       <li class="<c:if test="${menu.depth2 eq 'subject' }">active</c:if>"><a href="<c:url value='/admin/subject/list.do'/>">모니터링과제</a></li>
                       <li class="<c:if test="${menu.depth4 eq 'all_list' }">active</c:if>"><a href="<c:url value='/admin/subject/money/all_list.do'/>">활동비</a></li>
                       <li class="<c:if test="${menu.depth2 eq 'monitor' }">active</c:if>"><a href="<c:url value='/admin/monitor/list.do'/>">회원관리</a></li>
                       <li class="<c:if test="${menu.depth2 eq 'community' }">active</c:if>"><a href="<c:url value='/admin/community/story/list.do'/>">게시판관리</a></li>
                       <li class="<c:if test="${menu.depth2 eq 'setting' }">active</c:if>"><a href="<c:url value='/admin/setting/info.do'/>">설정</a></li>
                       <li class="<c:if test="${menu.depth1 eq 'member' }">active</c:if>"><a href="<c:url value='/member/adminLogout.do'/>">Logout</a></li>                       
                   </ul>
               </div>
           </div>
       </div>
</header>