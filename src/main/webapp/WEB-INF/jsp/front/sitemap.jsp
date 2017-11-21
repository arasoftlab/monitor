<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 메인콘텐츠 02 -->
<style>
	.table_02   { width:100%; border-top:2px #4fb3d2 solid; border-bottom:2px #4fb3d2 solid; border-left:1px #e5e5e5 solid; padding:0;border-spacing:0;}
	.table_02 td  { border-bottom:1px #e5e5e5 solid; border-right:1px #e5e5e5 solid; padding:5px;padding-left:10px; }
	.table_02 th  { border-bottom:1px #e5e5e5 solid; border-right:1px #e5e5e5 solid; background:lightsteelblue;}
		
</style>
<div class="fusection8" style="margin-bottom:10px;padding-bottom: 0;">
	<div class="container">
		<div class="one_third">
			<table class="table_02">
				<tr>
					<th>꼼꼼한 서울씨</th>
				</tr>
				<tr>
					<td><a href="<c:url value='/front/info/join/info_list.do'/>">꼼꼼한 서울씨 소개</a></td>
				</tr>
<!--- 주석 2017/04/18			
				<tr>
					<td style="padding-left:30px;"><a href="<c:url value='/front/info/join/join_list.do'/>">- 꼼꼼한 서울씨 가입</a></td>
				</tr>
---->				
				<tr>
					<td><a href="<c:url value='/front/info/institution/view.do'/>">꼼꼼한 서울씨 연혁</a></td>
				</tr>
				<tr>
					<td><a href="<c:url value='/front/info/monitor_activity.do'/>">꼼꼼한 서울씨 활동방법</a></td>
				</tr>				
				
				<tr>

			</table>
		</div>
		<div class="one_third">
			<table class="table_02">
				<tr>
					<th>공지사항</th>
				</tr>
				<tr>
					<td><a href="<c:url value='/front/notice/all/list.do'/>">전체공지</a></td>
				</tr>
				<tr>
					<td><a href="<c:url value='/front/notice/subject/list.do'/>">현장과제 참여공지</a></td>
				</tr>
			</table>
			
			<table class="table_02" style="margin-top:20px;">
				<tr>
					<th>모니터링 과제</th>
				</tr>
				<tr>
					<td><a href="<c:url value='/front/monitoring/monitoring/list.do'/>">현장과제</a></td>
				</tr>
				<tr>
					<td><a href="<c:url value='/front/monitoring/survey/list.do'/>">설문과제</a></td>
				</tr>
			</table>
		</div>
		
		<div class="one_third">
			<table class="table_02">
				<tr>
					<th>게시판</th>
				</tr>
				<tr>
					<td><a href="<c:url value='/front/community/story/story_list.do'/>">이야기방</a></td>
				</tr>
				<tr>
					<td><a href="<c:url value='/front/community/photo/photo_list.do'/>">포토갤러리</a></td>
				</tr>
			</table>
			
			<table class="table_02" style="margin-top:20px;">
				<tr>
					<th>마이페이지</th>
				</tr>
				<tr>
					<td><a href="<c:url value='/front/mypage/info/list.do'/>">내 정보 관리</a></td>
				</tr>
				<tr>
					<td><a href="<c:url value='/front/mypage/history/list.do'/>">현장과제 참여내역</a></td>
				</tr>
				<tr>
					<td><a href="<c:url value='/front/mypage/out/out_list.do'/>">회원 탈퇴</a></td>
				</tr>
			</table>
		</div>
		
		<div class="clearfix divider_dashed7"></div>
	</div>
</div>