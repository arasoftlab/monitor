<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
function fnSearch(){
	$("form").attr("action","list.do").submit();
}
</script>

<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="form-inline">
				<div id="search-box1" class="col-lg-8" style="padding:0; padding-bottom:10px;">
					<form class="pull-left">
						<select class="form-control" name="type" style="display: inline;">
							<option value=""  <c:if test="${empty vo.type  }">selected</c:if>>전체</option>
							<option value="S" <c:if test="${vo.type eq 'S' }">selected</c:if>>단순공지</option>
							<option value="F" <c:if test="${vo.type eq 'F' }">selected</c:if>>현장과제</option>
							<option value="V" <c:if test="${vo.type eq 'V' }">selected</c:if>>설문과제</option>
						</select>
						<select class="list_form" name="searchCategory" style="display: inline;">
							<option value="title" <c:if test="${vo.searchCategory eq 'title' }">selected</c:if>>제목</option>
							<option value="description" <c:if test="${vo.searchCategory eq 'description' }">selected</c:if>>내용</option>
						</select>
						<input type="text" class="list_form" name="searchText" value="${vo.searchText }" style="display: inline; width:200px;">
						<input type="button" id="search-button1" value="검색" onclick="fnSearch();">
					</form>
					
				</div>
				</div>
				<div class="col-lg-4" style="padding:0;">
           <button class="btn btn-theme  pull-right" onclick="location.href='modify.do';">공지등록</button>
				</div>
				
				<table class="table table-bordered table-striped table2">
					<colgroup>
						<col width="5%;">
						<col width="*;" >
						<col width="10%;">
						<col width="10%;">
						<col width="7%;">
						<col width="7%;">
						<col width="7%;">
					</colgroup>
					<thead>
						<tr>
							<th>No.</th>
							<th>제목</th>
							<th>공지종류</th>
							<th>등록일</th>
							<th>홈 공개</th>
							<th>신청자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">
									<tr onclick="javascript:location.href='view.do?notice_id=${item.notice_id }'">
										<td>${item.rn }</td>
										<td class="text-left">${item.title }</td>
										<td>${item.typeText }</td>
										<td><fmt:formatDate value="${item.regDate }" pattern="yy/MM/dd" /></td>
										<td>${item.open }</td>
										<td> 
											<c:if test="${!empty item.subject_id}">
												<c:if test="${item.type eq 'F' }">
												<a href="/monitor/admin/subject/applicant/view.do?subject_id=${item.subject_id}">
													<span class="text_underline">보기</span>
												</a>	
												</c:if>

											</c:if>								
										</td>
										<td>${item.hits }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7">등록된 글이 없습니다.</td>
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