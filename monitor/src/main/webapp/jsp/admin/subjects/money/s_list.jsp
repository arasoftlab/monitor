<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
function fnSearch(){
	$("form").attr("action","list.do").submit();
}

function onExcel(){	
	location.href="/monitor/admin/ex/excel_transform_controller.do?target=money&subject_id=${vo.subject_id}";
}

</script>

<section id="content">
	<div class="container">
		<div class="row">
			<h4 style="float:left; margin-right:10px;">${s_vo.title}</h4>
			<div class="col-lg-12">
			<label class="information">√ 과제 등록 시 [활동비] 있음에 체크한 과제 목록 및 활동비 현황</label><br>
			<label class="information">√ [입금신청일]은 과제관리에서 [활동비 입급신청일] 입력 시 노출됩니다.</label><br>
				<div id="search-box1" class="col-lg-12" style="padding:0; padding-top:10px;">
					<form class="pull-left;">					
						<select class="list_form" name="searchCategory" style="display: inline;">
							<option value="id" <c:if test="${vo.searchCategory  eq 'id'}">selected</c:if> >아이디</option>
							<option value="M001_NM" <c:if test="${vo.searchCategory  eq 'M001_NM'}">selected</c:if> >이름</option>
							<option value="M001_PHONE" <c:if test="${vo.searchCategory  eq 'M001_PHONE'}">selected</c:if> >연락처</option>							
						</select>
						<input type="text" class="list_form" name="searchText" value="${vo.searchText }" style="display: inline; width:200px;">
						<input type="button" id="search-button1" value="검색" onclick="fnSearch();">
						<input type="button" id="search-button1" value="활동비 목록 다운" onclick="onExcel()" style="    width: 120px;">

						<input type="hidden" name="subject_id" value="${vo.subject_id}">
					</form>
					
				</div>				
				
				<table class="table table-bordered table-striped table2 modal_table">
					<colgroup>
						<col width="5%;">
						<col width="10%;">
						<col width="7%;">
						<col width="8%;">
						<col width="12%;">
						<col width="12%;">
						<col width="*%;">
						<col width="5%;">
						<col width="10%;">
						<col width="10%;">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>생년월일</th>							
							<th>전화번호</th>
							<th>은행</th>
							<th>계좌번호</th>
							<th>제출</th>
							<th>공급가액</th>
						</tr>
					</thead>
					<tbody>
					
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">
									<tr>
										<td>${item.rn }</td>
										<td class="text-left">${item.member_id }</td>
										<td>${item.member_name }</td>
										<td>${fn:substring(item.birth,0,8) }</td>	
										<td>${item.phone}</td>
										<td>${item.bank}</td>
										<td class="text-left">${item.bank_num}</td>
										<td>${item.send_cnt}</td>
										<td><fmt:formatNumber value="${item.pay * item.send_cnt}" pattern="#,###" />원</td>
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