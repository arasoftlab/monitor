
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>

function getTestPopupPage(id){
	var popUrl = "/monitor/front/subject/list.do?subject_id="+id;	//팝업창에 출력될 페이지 URL
	var popOption = "width=550, height=560, resizable=no, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	
}

</script>


	<!-- 서브 콘텐츠 -->
	<div class="content_right" style="display:block">
  <h3>모니터링과제(설문과제)</h3>
		<!-- 게시판 시작 -->
		
		<jsp:include page="/WEB-INF/jsp/front/inc/monitor_mobile.jsp"></jsp:include>

		<table class="pc_notice_table" style="width:100%;background:#fff;padding:0;border:none;border-spacing:0;">
			<tr>
				<td>
				<!-- //카테고리 -->
					<table class="table_02" style="font-size: 9pt;">
						<!-- 타이틀 -->
						<tr align="center" height="30" style="background:lightsteelblue;">
						<!-- # 항목 -->
							<td class="att_title" style="min-width:36px;">
								<font style='color:#000000;'>번호</font>
							</td>
							<td class="att_title">
								<font style='color:#000000;'>과제명</font>
							</td>
							<td class="att_title" style="min-width:116px;">
								<font style='color:#000000;'>신청기간</font>
							</td>
							<td class="att_title" style="min-width:87px;">
								<font style='color:#000000;'>과제 제출기간</font>
							</td>
							<td class="att_title" style="min-width:62px;">
								<font style='color:#000000;'>상태</font>
							</td>
							<td class="att_title" style="min-width:49px;">
								<font style='color:#000000;'>과제수</font>
							</td>
							<td class="att_title" style="min-width:36px;">
								<font style='color:#000000;'>제출</font>
							</td>
						</tr>
						  <!-- 내용 -->
						  
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">
									<tr align='center' style="cursor:pointer" >
										<td class="bbsno">${item.rn }</td>
										<td class='bbsnewf5' align='left'>
											
											<c:choose>
												<c:when test="${item.status eq '04' }">
													<span class="monitor_subject"><a href='<c:url value='/front/monitoring/monitoring/view.do?subject_id=${item.subject_id }'/>'  style="color: blue;font-weight: bold;">${item.title }</a></span>
												</c:when>
												<c:otherwise>
													<span class="monitor_subject" ><a href='<c:url value='/front/monitoring/monitoring/view.do?subject_id=${item.subject_id }'/>'>${item.title }</a></span>
												</c:otherwise>
											</c:choose>
										</td>
										<td class="bbsetc_dateof_write">
											<fmt:formatDate value='${item.apply_s_date }' pattern='MM/dd' />~<fmt:formatDate value='${item.apply_e_date }' pattern='MM/dd' />
										</td>
										
										<td class="bbsetc_dateof_write">
											<fmt:formatDate value='${item.submit_s_date }' pattern='MM/dd' />~<fmt:formatDate value='${item.submit_e_date }' pattern='MM/dd' />									
										</td>										
										<td class="bbsetc_dateof_write">
											<c:choose>
												<c:when test="${item.status eq '01' }"></c:when>
												<c:when test="${item.status eq '02' }">모집중</c:when>
												<c:when test="${item.status eq '03' }">모집마감</c:when>
												<c:when test="${item.status eq '04' }">과제진행</c:when>
												<c:when test="${item.status eq '05' }">과제마감</c:when>
												<c:when test="${item.status eq '06' }">정산중</c:when>
												<c:when test="${item.status eq '07' }">정산완료</c:when>
											</c:choose>
										</td>

										<td class="bbsetc_dateof_write"> ${item.question_cnt } </td>
										<td class="bbsetc_dateof_write">0</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7" style="text-align: center;">등록된 글이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>


					</table>


					<jsp:include page="/WEB-INF/inc/paging.jsp"></jsp:include>

					<!-- 검색 -->
					<!-- 검색 -->
					<form name='com_board_search' method='post'>
						<div id="ext_search" style="text-align:center; padding-top:20px;">
							<table style="width:100%;">
								<tr>
									<td>
										<table id="search_table">
											
											<tr>
												<td class="est_cate_cell">
													<select title="select" name='searchCategory' class="cateform" style="height:100%;">
														<option value='title' >과제 제목</option>
														<!-- option value='description' >내용</option -->
													</select>
												</td>
												<td class="est_keyword_cell">
													<div id='search_display1' style='display:block;'>
														<input title="input" alt="" type='text' class="keywordform"  name='searchText' chk="y"  style="font-size:16px;height:100%;" />
													</div>
												</td>
												<td class="est_btn_cell">
													<input title="input" alt="" type='image' src='<c:url value='/img/front/search.gif'/>' style="height:100%;border:none;" >
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>
					</form>
					<!-- //검색 -->
				</td>
			</tr>
		</table>
		<!-- 게시판 끝 -->
		

		<div class="clearfix divider_dashed7"></div>
 
	</div>


</div>