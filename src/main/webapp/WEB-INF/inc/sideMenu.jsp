<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.side_p{font-size:8pt;}
</style>

<nav class="slimscroll"> 
	<ul class="nav bs-docs-sidenav"> 
		<li> 과제항목</li> 
		<li>
			<div id="search-box1" style="padding:0;">
				<form id="search-form1">
					<select class="select">
						<option value="">선택</option>
						<option value="quest1">단일 응답형</option>
						<option value="quest2">분기 응답형</option>
						<option value="quest3" >중복(복수) 응답형</option>
						<option value="quest4" >서열(순서) 응답형</option>
						<option value="quest5" >척도 응답형</option>
						<option value="quest6" >서술 응답형</option>
						<option value="quest7" >게시판(정보제공)형</option>
						<option value="quest8" >파일 첨부형</option>
					</select>
					<input type="button" id="search-button1" value="추가" onclick="fnAdd();">
				</form>								
			</div>
		</li>
		<li> 
			<a href="<c:url value='/admin/subject/mng/view.do'/>">시작페이지</a> 
			<ul class=nav>
				<li><a href="<c:url value='/admin/subject/mng/question1.do'/>">질문1입니다.<br />
					<p class="side_p">[단일응답형]</p></a></li>
				<li><a href=#js-data-attrs>질문2입니다.<br />
					<p class="side_p">[분기응답형]</p></a></li>
				<li><a href=#js-programmatic-api>질문3입니다.<br />
					<p class="side_p">[중복(복수)응답형]</p></a></li>
				<li><a href=#js-noconflict>질문4입니다.<br />
					<p class="side_p">[서열(순서)응답형]</p></a></li>
				<li><a href=#js-events>다음은 서울시청의...<br />
					<p class="side_p">[척도응답형]</p></a></li>
				<li><a href=#js-version-nums>서술형 응답의 여러...<br />
					<p class="side_p">[서술응답형]</p></a></li>
				<li><a href=#js-disabled>질문7입니다.<br />
					<p class="side_p">[게시판(정보제공)형]</p></a></li>
				<li><a href=#callout-third-party-libs>질문8입니다.<br />
					<p class="side_p">[파일첨부형]</p></a></li>
				<li><a href=#callout-third-party-libs>질문8입니다.<br />
					<p class="side_p">[파일첨부형]</p></a></li>
				<li><a href=#callout-third-party-libs>질문8입니다.<br />
					<p class="side_p">[파일첨부형]</p></a></li>
				<li><a href=#callout-third-party-libs>질문8입니다.<br />
					<p class="side_p">[파일첨부형]</p></a></li>
				<li><a href=#callout-third-party-libs>질문8입니다.<br />
					<p class="side_p">[파일첨부형]</p></a></li>
			</ul>
		</li> 
		<li> 
			<a href=#js-overview>종료페이지</a> 
		</li>
	</ul>
</nav>