<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.layer_fixed
{
    width:100%;
    position:fixed;
    z-index:999;
    top:0px;
    left:0px;
    -webkit-box-shadow: 0 1px 2px 0 #777;
    box-shadow: 0 1px 2px 0 #777;
    background-color:#ccc;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		
		var jbOffset = $('#layer_fixed').offset();
		var top = 228;
		if(typeof jbOffset != "undefined"){
			
			$(window).scroll(function() {
				if($(document).scrollTop() > jbOffset.top) {
					$('#layer_fixed').addClass('layer_fixed');
					$("#content").css("padding", "116px 0 40px 0");
					
					if($('#testDiv').length > 0){
						$(".slimscroll").css("top", "116px");
					}
					
				} else {
					$('#layer_fixed').removeClass('layer_fixed');
					$("#content").css("padding", "25px 0 40px 0");
					
					if($('#testDiv').length > 0){
						$(".slimscroll").css("top", top-$(document).scrollTop()+"px");
					}
				}
			
			});
		}
		
	});
</script>

<c:if test="${menu.depth2 eq 'subject' and menu.depth3 ne 'list' and menu.depth4 ne 'all_list'}">
	<div id="layer_fixed" class="">
		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<a href="<c:url value='/admin/subject/info/view.do?subject_id=${vo.subject_id }'/>">
							<button class="btn btn-theme <c:if test="${menu.depth3 eq 'info' }"> active</c:if> btn_top" >기본정보</button>
						</a>
						<a href="<c:url value='/admin/subject/applicant/view.do?subject_id=${vo.subject_id }'/>">
							<button class="btn btn-theme btn_top <c:if test="${menu.depth3 eq 'applicant' }"> active</c:if>">신청자</button>
						</a>
						<a href="<c:url value='/admin/subject/mng/view.do?subject_id=${vo.subject_id }'/>">
							<button class="btn btn-theme btn_top <c:if test="${menu.depth3 eq 'mng' }"> active</c:if>">과제관리</button>
						</a>
						<a href="<c:url value='/admin/subject/answer/view.do?subject_id=${vo.subject_id }'/>">
							<button class="btn btn-theme btn_top <c:if test="${menu.depth3 eq 'answer' }"> active</c:if>">응답목록</button>
						</a>
						<button class="btn btn-theme btn_top">통계</button>
						<a href="<c:url value='/admin/subject/money/list.do?subject_id=${vo.subject_id }'/>">
							<button class="btn btn-theme btn_top <c:if test="${menu.depth3 eq 'money' }"> active</c:if>">활동비관리</button>
						</a>
					</div>
				</div>
			</div>
		</section>
	</div>
</c:if>

<c:if test="${menu.depth2 eq 'monitor'}"> 
	<div id="layer_fixed" class="">
		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<a href="<c:url value='/admin/monitor/list.do'/>">
							<button class="btn btn-theme btn_top <c:if test="${menu.depth3 eq 'list' }"> active</c:if>" >가입 중회원</button>
						</a>
						<a href="<c:url value='/admin/monitor/view.do'/>">
							<button class="btn btn-theme btn_top <c:if test="${menu.depth3 eq 'view' }"> active</c:if>">탈퇴회원</button>
						</a>
						<!-- 
						<a href="<c:url value='/admin/monitor/info.do'/>">
							<button class="btn btn-theme btn_top <c:if test="${menu.depth3 eq 'info' }"> active</c:if>">관리자정보</button>
						</a>
						 -->
					</div>
				</div>
			</div>
		</section>
	</div>
</c:if>

<c:if test="${menu.depth2 eq 'setting'}"> 
	<div id="layer_fixed" class="">
		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<!-- 
						<a href="<c:url value='/admin/monitor/list.do'/>">
							<button class="btn btn-theme btn_top <c:if test="${menu.depth3 eq 'list' }"> active</c:if>" >가입 중회원</button>
						</a>
						<a href="<c:url value='/admin/monitor/view.do'/>">
							<button class="btn btn-theme btn_top <c:if test="${menu.depth3 eq 'view' }"> active</c:if>">탈퇴회원</button>
						</a>
						 -->
						<a href="<c:url value='/admin/setting/info.do'/>">
							<button class="btn btn-theme btn_top <c:if test="${menu.depth3 eq 'info' }"> active</c:if>">관리자정보</button>
						</a>

						<a href="<c:url value='/admin/setting/admin_setting.do'/>">
							<button class="btn btn-theme btn_top <c:if test="${menu.depth3 eq 'info' }"> active</c:if>">관리자 기수 설정</button>
						</a>
						
					</div>
				</div>
			</div>
		</section>
	</div>
</c:if>

<c:if test="${menu.depth2 eq 'community'}"> 
	<div id="layer_fixed" class="">
		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<a href="<c:url value='/admin/community/story/list.do'/>">
							<button class="btn btn-theme btn_top <c:if test="${menu.depth3 eq 'story' }"> active</c:if>" >이야기방</button>
						</a>
						<a href="<c:url value='/admin/community/photo/plist.do'/>">
							<button class="btn btn-theme btn_top <c:if test="${menu.depth3 eq 'photo' }"> active</c:if>">포토갤러리</button>
						</a>
						 
						
					</div>
				</div>
			</div>
		</section>
	</div>
</c:if>