<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">

function fnSearch(){
	$("form").attr("action","list.do").submit();
}

	
function getTestPopupPage(id){
	var popUrl = "/monitor/admin/subject/test/list.do?subject_id="+id;	//팝업창에 출력될 페이지 URL
	var popOption = "width=550, height=560, resizable=no, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	
	location.href="/monitor/admin/subject/mng/view.do?subject_id="+id;
}

</script>

<script src="<c:url value='/js/video.js'/>"></script>

<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<label class="information" style="padding-bottom: 10px;" >√ 진행상태: 신청기간 전이면 [테스트]버튼 노출 → (신청기간 내) 모집중 → 모집마감 → (과제기간 내) 과제진행 → 과제마감<br/>
					&nbsp;&nbsp;&nbsp; → (활동비 있는 경우, 보고서 제출기간 + 7일 후에) 정산중으로 자동변경 → (과제내용에서 지급신청일 입력시) 정산완료 표시
				</label>
				<div id="search-box1" class="col-lg-8" style="padding:0;">
					<form class="pull-left">
						<select class="list_form" name="type" style="display: inline;">
							<option value=""  <c:if test="${empty vo.type  }">selected</c:if>>전체</option>
							<option value="F" <c:if test="${vo.type eq 'F' }">selected</c:if>>현장과제</option>
							<option value="V" <c:if test="${vo.type eq 'V' }">selected</c:if>>설문과제</option>
						</select>
						<select class="list_form" name="searchCategory" style="display: inline;">
							<option value="title" <c:if test="${vo.searchCategory eq 'title' }">selected</c:if>>제목</option>
<!--  
							<option value="description" <c:if test="${vo.searchCategory eq 'description' }">selected</c:if>>내용</option>
-->
						</select>
						<input type="text" class="list_form" name="searchText" value="${vo.searchText }" style="display: inline; width:200px;">
						<input type="button" id="search-button1" value="검색"  onclick="fnSearch();">
					</form>
					
				</div>
				<div class="col-lg-4" style="padding:0;">
					<button class="btn btn-theme  pull-right" onclick="location.href='<c:url value='/admin/subject/info/modify.do'/>';">과제등록</button>
				</div>
				
				<table class="table table-bordered table-striped table2">

					<colgroup>
						<col width="5%;">
						<col width="*;">
						<col width="12%;">
						<col width="10%;">
						<col width="5%;">
						<col width="5%;">
						<col width="7%;">
						<col width="5%;">
						<col width="7%;">
					</colgroup>

					<thead>
						<tr>
							<th style="vertical-align: middle;">No.</th>
							<th style="vertical-align: middle;">과제명</th>
							<th style="vertical-align: middle;">신청기간</th>
							<th style="vertical-align: middle;" >과제 제출기간</th>
							<th>모집인원</th>
							<th>선정인원</th>
							<th style="vertical-align: middle;">신청자</th>
							<th>응답자료</th>
							<th style="vertical-align: middle;">진행상태</th>
						</tr>
					</thead>
					<tbody>
					
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">
									<tr>
										<td>${item.rn }</td>
										<td class="text-left" onclick="javascript:location.href='<c:url value='/admin/subject/info/view.do?subject_id=${item.subject_id }'/>'">
											<div style="display: inline-block; width: 400px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
												${item.title }
											</div>
										</td>
										<td><fmt:formatDate value="${item.apply_s_date }" pattern="yy/MM/dd" />~<fmt:formatDate value="${item.apply_e_date }" pattern="yy/MM/dd" /></td>
										<td><fmt:formatDate value="${item.submit_s_date }" pattern="MM/dd" />~<fmt:formatDate value="${item.submit_e_date }" pattern="MM/dd" /></td>
										<td>${item.men_total }</td>
										<td>${item.apply_cnt }</td>
										<td>
											<c:if test="${item.type eq 'F'}">
												<a href="/monitor/admin/subject/applicant/view.do?subject_id=${item.subject_id}"><u>보기</u></a>
											</c:if>
										</td>
										<td>
											<a href="/monitor/admin/subject/answer/view.do?subject_id=${item.subject_id}"><u>보기</u></a>
										</td>
										<td>
											<c:choose>
												<c:when test="${item.status eq '01' }"><button class="btn btn-mini btn-success" onclick="getTestPopupPage(${item.subject_id})">테스트</button></c:when>
												<c:when test="${item.status eq '02' }">모집중</c:when>
												<c:when test="${item.status eq '03' }">모집마감</c:when>
												<c:when test="${item.status eq '04' }">과제진행</c:when>
												<c:when test="${item.status eq '05' }">과제마감</c:when>
												<c:when test="${item.status eq '06' }">정산중</c:when>
												<c:when test="${item.status eq '07' }">정산완료</c:when>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="8">등록된 글이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
						
					</tbody>
				</table>
				<jsp:include page="/WEB-INF/inc/paging.jsp"></jsp:include>
			</div>
		</div>
	</div>
</section>