<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${menu.depth2 eq 'info'}">
<style>

	.current2 a {
		background: none !important;
	    color: #00aeef !important;
	}
</style>

	<!-- 서브 타이틀 -->
	<div class="page_title">
		<div class="container">
			<c:if test="${menu.depth3 eq 'join' }">
				<c:choose>
					<c:when test="${menu.depth4 eq 'join_list' }">
						<div class="title"><p style="text-align:right; padding:20px;"> 꼼꼼한 서울씨 >  꼼꼼한 서울씨 가입 </p></div>					
					</c:when>
					<c:otherwise>
						<div class="title"><p style="text-align:right; padding:20px;"> 꼼꼼한 서울씨 >  꼼꼼한 서울씨 소개 </p></div>			
					</c:otherwise>
				</c:choose>
	    	</c:if>
	    	<c:if test="${menu.depth3 eq 'institution' }">
				<div class="title"><p style="text-align:right; padding:20px;"> 꼼꼼한 서울씨 >  꼼꼼한 서울씨 연혁 </p></div>
	    	</c:if>
	    	<c:if test="${menu.depth3 eq 'monitor_activity' }">
				<div class="title"><p style="text-align:right; padding:20px;"> 꼼꼼한 서울씨 >  모니터 활동방법</p></div>
	    	</c:if>	    	
		</div>
	</div>
	<div class="container">	
		<!-- 좌측 메뉴 -->
		<div class="left_sidebar"> 
			
	 
			<div class="shortcode-widget">
				<aside class="sc_widget_nav">
					<h4 class="widget-title"><i class="fa fa-building"></i>&nbsp; 꼼꼼한 서울씨</h4>
					<ul>
						<li class=" <c:if test="${menu.depth3 eq 'join'}"> current</c:if>">
						   <a href="<c:url value='/front/info/join/info_list.do'/>">꼼꼼한 서울씨 소개</a>
						<!-----  주석 처리(19기 가입마감)   
						   <ul class="side_menu" style="height: 35px;">
								<li class=" <c:if test="${menu.depth4 eq 'join_list'|| menu.depth4 eq 'join_view'}"> current2</c:if>" >
								   <a href="<c:url value='/front/info/join/join_list.do'/>" style="background:none;color:#aaa;width:90%;float:right;padding-right:10%;font-size: 13px;" >꼼꼼한 서울씨 가입</a>
								</li>
							</ul>
						------->	
						</li>
						
						<li class=" <c:if test="${menu.depth3 eq 'institution' }"> current</c:if>">
						   <a href="<c:url value='/front/info/institution/view.do'/>">꼼꼼한 서울씨 연혁</a>
						</li>
						<li class=" <c:if test="${menu.depth3 eq 'monitor_activity' }"> current</c:if>">
						   <a href="<c:url value='/front/info/monitor_activity/view.do'/>">모니터 활동방법</a>
						</li>				
					</ul>
				</aside>
			</div>
				
		</div>
		<!-- 좌측 메뉴 -->
	
</c:if>

<c:if test="${menu.depth2 eq 'notice'}">

	<!-- 서브 타이틀 -->
	<div class="page_title">
		<div class="container">
			<c:if test="${menu.depth3 eq 'all' }">
			<div class="title"><p style="text-align:right; padding:20px;"> 공지사항 > 전체공지   </p></div>
	    	</c:if>
	    	<c:if test="${menu.depth3 eq 'subject' }">
			<div class="title"><p style="text-align:right; padding:20px;"> 공지사항 > 현장과제 참여공지 </p></div>
	    	</c:if>
	    	<c:if test="${vo.type eq 'Q' }">
			<div class="title"><p style="text-align:right; padding:20px;"> 공지사항 > FAQ </p></div>
	    	</c:if>
		</div>
	</div>
<div class="container">	
		<!-- 좌측 메뉴 -->
		<div class="left_sidebar"> 
			
	 
			<div class="shortcode-widget">
				<aside class="sc_widget_nav">
					<h4 class="widget-title"><i class="fa fa-building"></i>&nbsp; 공지사항</h4>
					<ul>
						<li class=" <c:if test="${vo.stype eq 'A' }"> current</c:if>">
						   <a href="<c:url value='/front/notice/all/list.do?stype=A'/>">전체공지</a>
						</li>
						<li class=" <c:if test="${vo.stype eq 'S' }"> current</c:if>">
						   <a href="<c:url value='/front/notice/all/list.do?stype=S'/>">현장과제 참여공지</a>
						</li>
						<li class=" <c:if test="${vo.stype eq 'Q' }"> current</c:if>">
						   <a href="<c:url value='/front/notice/all/list.do?stype=Q'/>">FAQ</a>
						</li>
					</ul>
				</aside>
			</div>
				
		</div>
		<!-- 좌측 메뉴 -->
	
</c:if>

<c:if test="${menu.depth2 eq 'monitoring'}">

	<!-- 서브 타이틀 -->
		<div class="page_title">
			<div class="container">
				<c:if test="${menu.depth3 eq 'monitoring' }">
				<div class="title"><p style="text-align:right; padding:20px;"> 모니터링 과제 > 현장과제  </p></div>
		    	</c:if>
		    	<c:if test="${menu.depth3 eq 'survey' }">
				<div class="title"><p style="text-align:right; padding:20px;"> 모나터링 과제 > 설문과제 </p></div>
		    	</c:if>
			</div>
		</div>
	<div class="container">	
			<!-- 좌측 메뉴 -->
			<div class="left_sidebar"> 
				
		 
				<div class="shortcode-widget">
					<aside class="sc_widget_nav">
						<h4 class="widget-title"><i class="fa fa-building"></i>&nbsp; 모니터링 과제</h4>
						<ul>
							<li class=" <c:if test="${menu.depth3 eq 'monitoring' }"> current</c:if>">
							   <a href="<c:url value='/front/monitoring/monitoring/list.do'/>">현장과제</a>
							</li>
							<li class=" <c:if test="${menu.depth3 eq 'survey' }"> current</c:if>">
							   <a href="<c:url value='/front/monitoring/survey/list.do'/>">설문과제</a>
							</li>
						</ul>
					</aside>
				</div>
					
			</div>
			<!-- 좌측 메뉴 -->

</c:if>

<c:if test="${menu.depth2 eq 'community'}">

	<!-- 서브 타이틀 -->
		<div class="page_title">
			<div class="container">
				<c:if test="${menu.depth3 eq 'story' }">
				<div class="title"><p style="text-align:right; padding:20px;"> 게시판 > 이야기방   </p></div>
		    	</c:if>
		    	<c:if test="${menu.depth3 eq 'photo' }">
				<div class="title"><p style="text-align:right; padding:20px;"> 게시판 > 포토갤러리 </p></div>
		    	</c:if>
			</div>
		</div>
	<div class="container">	
			<!-- 좌측 메뉴 -->
			<div class="left_sidebar"> 
				
		 
				<div class="shortcode-widget">
					<aside class="sc_widget_nav">
						<h4 class="widget-title"><i class="fa fa-building"></i>&nbsp; 게시판</h4>
						<ul>
							<li class=" <c:if test="${menu.depth3 eq 'story' }"> current</c:if>">
							   <a href="<c:url value='/front/community/story/story_list.do'/>">이야기방</a>
							</li>
							<li class=" <c:if test="${menu.depth3 eq 'photo' }"> current</c:if>">
							   <a href="<c:url value='/front/community/photo/photo_list.do'/>">포토갤러리</a>
							</li>
						</ul>
					</aside>
				</div>
					
			</div>
			<!-- 좌측 메뉴 -->

</c:if>



<c:if test="${menu.depth2 eq 'mypage'}">

	<!-- 서브 타이틀 -->
		<div class="page_title">
			<div class="container">
				<c:if test="${menu.depth3 eq 'info' }">
				<div class="title"><p style="text-align:right; padding:20px;"> 마이페이지 > 내 정보 관리</p></div>
		    	</c:if>
		    	<c:if test="${menu.depth3 eq 'history' }">
				<div class="title"><p style="text-align:right; padding:20px;"> 마이페이지 > 참여내역 </p></div>
		    	</c:if>
		    	<c:if test="${menu.depth3 eq 'out' }">
				<div class="title"><p style="text-align:right; padding:20px;"> 마이페이지 > 회원 탈퇴 </p></div>
		    	</c:if>
			</div>
		</div>
	<div class="container">	
			<!-- 좌측 메뉴 -->
			<div class="left_sidebar"> 
				
		 
				<div class="shortcode-widget">
					<aside class="sc_widget_nav">
						<h4 class="widget-title"><i class="fa fa-building"></i>&nbsp; 마이페이지</h4>
						<ul>
							<li class=" <c:if test="${menu.depth3 eq 'info' }"> current</c:if>">
							   <a href="<c:url value='/front/mypage/info/list.do'/>">내 정보 관리</a>
							</li>
							<li class=" <c:if test="${menu.depth3 eq 'history' }"> current</c:if>">
							   <a href="<c:url value='/front/mypage/history/list.do'/>">참여내역</a>
							</li>
							<li class=" <c:if test="${menu.depth3 eq 'out' }"> current</c:if>">
							   <a href="<c:url value='/front/mypage/out/out_list.do'/>">회원 탈퇴</a>
							</li>
						</ul>
					</aside>
				</div>
					
			</div>
			<!-- 좌측 메뉴 -->

</c:if>


<c:if test="${menu.depth2 eq 'member'}">

	<!-- 서브 타이틀 -->
		<div class="page_title">
			<div class="container">
				<c:if test="${menu.depth3 eq 'login' }">
					<div class="title"><p style="text-align:right; padding:20px;">  로그인  </p></div>
		    	</c:if>
			</div>
		</div>
	<div class="container">	
			<!-- 좌측 메뉴 -->
			<div class="left_sidebar"> 
				
		 
				<div class="shortcode-widget">
					<aside class="sc_widget_nav">
						<h4 class="widget-title"><i class="fa fa-building"></i>&nbsp; 로그인</h4>
						<ul>
							<li class=" <c:if test="${menu.depth3 eq 'login' }"> current</c:if>">
							   <a href="<c:url value='/front/member/login/login.do'/>">로그인</a>
							</li>
						</ul>
					</aside>
				</div>
					
			</div>
			<!-- 좌측 메뉴 -->

</c:if>


