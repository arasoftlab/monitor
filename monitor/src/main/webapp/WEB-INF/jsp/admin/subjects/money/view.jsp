<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
function fnSearch(){
	$("form").attr("action","view.do").submit();
}
</script>

<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h4 style="float:left; margin-right:10px;">2016 제3차 현장과제 모니터링</h4>
			</div>
			<div class="col-lg-12">
				<div id="search-box1" class="col-lg-12" style="padding:0;">
					<form class="pull-left;">
						<select class="list_form" name="type" style="display: inline;">
							<option value="" >기수</option>
							<option value="18" >18기</option>
							<option value="17" >17기</option>
						</select>
						<select class="list_form" name="type" style="display: inline;">
							<option value="" >전체</option>
							<option value="I" >아이디</option>
							<option value="N" >이름</option>
						</select>
						<input type="text" class="list_form" name="searchText" value="${vo.searchText }" style="display: inline; width:200px;">
						<input type="button" id="search-button1" value="검색" onclick="fnSearch();">
						<input type="button" id="search-button1" value=" 활동비 목록 다운" style="width:110px;">
					</form>
					
				</div>
				
				<table class="table table-bordered table-striped table2 modal_table">
					<colgroup>
						<col width="5%;">
						<col width="7%;">
						<col width="7%;" >
						<col width="5%;">
						<col width="10%;">
						<col width="12%;">
						<col width="8%;">
						<col width="8%;">
						<col width="7%;">
						<col width="*%;">
						<col width="9%;">
						<col width="7%;">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>기수</th>
							<th>생년월일</th>
							<th>전화번호</th>
							<th>입급유형</th>
							<th>은행명</th>
							<th>예금주</th>
							<th>계좌번호</th>
							<th>제출 과제수</th>
							<th>공급가액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>32</td>
							<td>fdsfsv</td>
							<td>강감찬</td>
							<td>18</td>
							<td>19980507</td>
							<td>010-0000-0000</td>
							<td>계좌이체</td>
							<td>국민</td>
							<td>강감찬</td>
							<td>123456789123</td>
							<td>1</td>
							<td>20,000</td>
						</tr>
						<tr>
							<td>31</td>
							<td>asdfasdfg12</td>
							<td>홍길동</td>
							<td>17</td>
							<td>19951215</td>
							<td>010-0000-0000</td>
							<td>계좌이체</td>
							<td>신한</td>
							<td>홍길동</td>
							<td>123412356789123</td>
							<td>2</td>
							<td>40,000</td>
						</tr>
						<tr>
							<td>30</td>
							<td>efew</td>
							<td>김혜수</td>
							<td>18</td>
							<td>19880831</td>
							<td>010-0000-0000</td>
							<td>계좌이체</td>
							<td>우리</td>
							<td>김혜수</td>
							<td>12342356789123</td>
							<td>2</td>
							<td>40,000</td>
						</tr>
					</tbody>
					
				</table>
				
				
				<div class="col-lg-12">
					<div class="col-lg-10 center"><jsp:include page="/WEB-INF/inc/paging.jsp"></jsp:include></div>
					<div class="col-lg-2 pull-right"><label class="pull-right">총 000명(1/00)</label></div>
				
				</div>
				
			</div>
		</div>
	</div>
</section>