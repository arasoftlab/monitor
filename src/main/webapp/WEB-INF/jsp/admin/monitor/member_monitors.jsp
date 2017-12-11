<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<link href="<c:url value='/css/bootstrap.min.css'/>"  rel="stylesheet" />
	
	<link href="<c:url value='/css/fancybox/jquery.fancybox.css'/>" rel="stylesheet">
	<link href="<c:url value='/css/flexslider.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/style.css'/>" rel="stylesheet" />
	
	<link href="<c:url value='/css/front/css/reply.css'/>" rel="stylesheet" />
	
	<!-- Theme skin -->
	<link href="<c:url value='/skins/default.css'/>" rel="stylesheet" />
	
	<link href="<c:url value='/css/datepicker.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/datepicker3.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/daterangepicker-bs3.css'/>" rel="stylesheet" />

	<script src="<c:url value='/js/jquery.js'/>"></script>
	<script src="<c:url value='/js/jquery-ui.js'/>"></script>
	<script src="<c:url value='/js/jquery.form.js'/>"></script>
	<script src="<c:url value='/js/jquery.slimscroll.js'/>"></script>
	<script src="<c:url value='/js/jquery.cookie.js'/>"></script>
		
	<script src="<c:url value='/js/bootstrap-datepicker.js'/>"></script>
	<script src="<c:url value='/js/bootstrap-datepicker.kr.js'/>"></script>
	<script src="<c:url value='/js/moment.js'/>"></script>
	<script src="<c:url value='/js/daterangepicker.js'/>"></script>
	<script src="<c:url value='/js/validate.js'/>"></script>
	
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>

 <div style="width: 95%;margin: 2%;">

						<h4>▥ 신청 및 참여과제 리스트</h4>

						<label class="pull-right">
						총 신청횟수 <b class="modal_b">${act.apply_cnt }회</b> /&nbsp; 
						총 선정횟수 <b class="modal_b">${act.selected_cnt }회</b> /&nbsp;  
						미응답 <b class="modal_b">${act.tmp_sum1 }회</b></label>

						<table class="table table-bordered table-striped table2 modal_table" style=" font-size: 9pt">
							<colgroup>
								<col width="6%;">
								<col width="6%;">			
								<col width="*;">
								<col width="5%;">
								<col width="9%;">
								<col width="7%;">					
							</colgroup>
							
							<thead>
								<tr>
									<th>No.</th>
									<th>기수</th>
									<th>과제명</th>
									<th>선정</th>
									<th>수행과제수</th>
									<th>제출수</th>
								</tr>
							</thead>
							<tbody>
							
								<c:choose>
									<c:when test="${!empty list }">
										<c:forEach var="item" items="${list }">
											<tr>
												<td>${item.rn }</td>
												<td>${item.poll_num }</td>												
												<td class="text-left" onclick="javascript:location.href='/monitor/admin/subject/info/view.do?subject_id=${item.subject_id }'">
													${item.title }
												</td>
												<td>
													<c:if test="${item.is_selection eq 'Y'}">O</c:if>
												</td>
												<td>${item.question_cnt }</td>
												<td>
													<c:if test="${item.question_cnt <= item.apply_cnt}">완료</c:if>
													<c:if test="${item.question_cnt > item.apply_cnt}">${item.apply_cnt }</c:if>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="9">등록된 글이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
									
							</tbody>
							
						</table>
					
						<jsp:include page="/WEB-INF/inc/paging.jsp"></jsp:include>
</div>
