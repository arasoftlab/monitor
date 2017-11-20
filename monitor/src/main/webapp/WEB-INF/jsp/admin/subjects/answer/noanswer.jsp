<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
function fnSearch(){
	$("form").attr("action","noanswer.do").submit();
}
function fnView(){
	location.href="view.do?subject_id=${vo.subject_id}";	
}
</script>


<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h4 style="float:left; margin-right:10px;">${s_vo.title} &nbsp;&nbsp;&nbsp;&nbsp; 미응답자 총 ${total_cnt}건 (미제출자 및 부분제출자 포함)</h4>
			</div>
			<div class="col-lg-12">
				<div id="search-box1" class="col-lg-12" style="padding:0;">
					<form class="pull-left;">
						<select class="list_form" name="type" style="display: inline;">
							<option value="" >조 선택</option>
							  <c:forEach begin="1" end="${s_vo.team_cnt }" var="team_n">
  								<option value="${team_n }" >${team_n }</option>
							  </c:forEach>

						</select>
						<select class="list_form" name="type" style="display: inline;">
							<!-- option value="" >전체</option -->
   						<option value="N" >이름</option>							
							<option value="I" >아이디</option>	
						</select>
						<input type="text" class="list_form" name="searchText" value="${vo.searchText }" style="display: inline; width:200px;">
						<input type="button" id="search-button1" value="검색" onclick="fnSearch();">
						
						<input type="button" id="search-button1" value="응답목록으로 돌아가기" style="width:135px;" onclick="fnView();">
					</form>
					
				</div>
				
				<table class="table table-bordered table-striped table2 modal_table">
					<colgroup>
						<col width="7%;">
						<col width="7%;">
						<col width="12%;">
						<col width="12%;">
						<col width="14%;">
						<col width="14%;">
						<col width="*%;">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>신청조</th>
							<th>아이디</th>
							<th>이름</th>
							<th>전화번호</th>							
	            <th>생년월일</th>
	            <th>직업</th>
						</tr>
					</thead>
					<tbody>
					
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }" varStatus="j">
									<tr>
										<td>${item.rn}</td>
										<td>${item.team_num}</td>										
										<td>${item.member_id } </td>
										<td>${item.member_name}</td>
										<td>${item.phone}</td>
										<td>${fn:substring(item.birth,0,8)}</td>
										
										<td>${item.job}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
							
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