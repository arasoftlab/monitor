<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
function fnSearch(){
	$("form").attr("action","list.do").submit();
}

</script>

<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h4>이야기방</h4>
				<div class="form-inline">
					<div id="search-box1" class="col-lg-8" style="padding:0;">
						<form class="pull-left">
							<select class="list_form" name="searchCategory" style="display: inline;">
								<!-- option value="" <c:if test="${empty vo.searchCategory }">selected</c:if>>선택</option -->
								<option value="title" <c:if test="${vo.searchCategory eq 'title' }">selected</c:if>>제목</option>
								<option value="description" <c:if test="${vo.searchCategory eq 'description' }">selected</c:if>>내용</option>
							</select>
							<input type="text" class="list_form" name="searchText" value="${vo.searchText }" style="display: inline; width:200px;">
							<input type="button" id="search-button1" value="검색" onclick="fnSearch();">
						</form>
						
					</div>
				</div>
				<div class="col-lg-4" style="padding:0;">

					<button class="btn btn-theme  pull-right btn-primary button_blue button_white" onclick="location.href='<c:url value='smodify.do'/>'">글쓰기</button>		

				</div>
				
				<table class="table table-bordered table-striped modal_table" style="margin-top:6%;">
					<colgroup>
						<col width="5%;">
						<col width="*;" >
						<col width="7%;">
						<col width="10%;">
						<col width="7%;">
						<col width="7%;">
					</colgroup>
					<thead>
						<tr>
							<th>No.</th>
							<th>제목</th>
							<th>아이디</th>
							<th>작성자</th>
							<th>등록일</th>
							
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>					
					
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">					
								<tr>
									<td>${item.rn }</td>
									<td class="text-left">										
										<!--span class="notice_subject"><a href='<c:url value='sview.do?cont_uuid=${item.cont_uuid}'/>'>${item.title }</a></span -->
										<c:choose>
											<c:when test="${item.is_password eq 'Y' }">
												<span class="notice_subject"><img src="/monitor/img/closed.JPG"><a href='<c:url value='sview.do?cont_uuid=${item.cont_uuid}'/>'>${item.title } &nbsp; <c:if test="${item.ncnt > 0 }" ><b>[ ${item.ncnt} ]</b></c:if></a></span>
											</c:when>
											<c:otherwise>
													<span class="notice_subject"><a href='<c:url value='sview.do?cont_uuid=${item.cont_uuid}'/>'>${item.title }&nbsp; <c:if test="${item.ncnt > 0 }" ><b>[ ${item.ncnt} ]</b></c:if></a></span>
												</c:otherwise>
											</c:choose>
									</td>
									<td><a href="javascript:view_member('${item.member_id }','${item.poll_num }');" style="font-weight: bold;"> ${item.member_id }</a></td>
									<td><a href="javascript:view_member('${item.member_id }','${item.poll_num }');" style="font-weight: bold;">	${item.member_name }</td>
									<td><fmt:formatDate value="${item.regdate }" pattern="yyyy/MM/dd" /></td>
									
									<td>${item.hits }</td>
								</tr>
								</c:forEach>
							</c:when>
							
							<c:otherwise>
								<tr>
									<td colspan="7" style="text-align:center">등록된 글이 없습니다.</td>
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
	
	<%@ include file="/WEB-INF/inc/memberInfo.jsp" %>	
	