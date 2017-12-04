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
			<label class="information">√ 과제 등록 시 [활동비] 있음에 체크한 과제 목록 및 활동비 현황</label><br/>
			<label class="information">√ [입금신청일]은 과제관리에서 [활동비 입급신청일] 입력 시 노출됩니다.</label>
				<div id="search-box1" class="col-lg-12" style="padding:0;padding-top:10px;">
					<form class="pull-left;">
						<select class="list_form" name="searchCategory" style="display: inline;">
							<option value="title" <c:if test="${vo.searchCategory eq 'title' }">selected</c:if>>제목</option>
<!--  
							<option value="description" <c:if test="${vo.searchCategory eq 'description' }">selected</c:if>>내용</option>
-->
						</select>
						<input type="text" class="list_form" name="searchText" value="${vo.searchText }" style="display: inline; width:200px;">
						<input type="button" id="search-button1" value="검색" onclick="fnSearch();">
					</form>
					
				</div>
				
				<table class="table table-bordered table-striped table2 ">
					<colgroup>
						<col width="5%;">
						<col width="*%;">
						<col width="13%;" >
						<col width="7%;">
						<col width="7%;">
						<col width="7%;">
						<col width="7%;">
						<col width="9%;">
						<col width="9%;">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>과제명</th>
							<th>보고서 제출 기간</th>
							<th>선정인원</th>
							<th>과제수</th>
							<th>결과제출</th>
							<th>활동비</th>
							<th>총계(단위:원)</th>
							<th>입급신청일</th>
						</tr>
					</thead>
					<tbody>
					
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">
									<tr>
										<td>${item.rn }</td>
										<td class="text-left" onclick="javascript:location.href='<c:url value='/admin/subject/money/list.do?subject_id=${item.subject_id }'/>'">
											${item.title }
										</td>
										<td>
											<fmt:formatDate value="${item.submit_s_date }" pattern="yy/MM/dd" /> ~
											<fmt:formatDate value="${item.submit_e_date }" pattern="yy/MM/dd" />
										</td>
										
										<td>${item.apply_cnt }</td>										
										<td>${item.question_cnt }</td>
										<td>${item.send_cnt }</td>
										<td><fmt:formatNumber value="${item.pay_sum }" pattern="#,###" />
										</td>
										<td><fmt:formatNumber value="${item.pay_sum * item.send_cnt }" pattern="#,###" /></td>
										<td><fmt:formatDate value="${item.pay_date }" pattern="yy/MM/dd" /></td>
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
				
				
				<div class="col-lg-12">
					<div class="col-lg-10 center"><jsp:include page="/WEB-INF/inc/paging.jsp"></jsp:include></div>
				</div>
				
			</div>
		</div>
	</div>
</section>