<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
function fnSearch(){
	$("form").attr("action","view.do").submit();
}
$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=chk]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=chk]").prop("checked",false);
        }
    });
});

</script>

<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="col-lg-12">
					<h4 style="float:left; margin-right:10px;">2016 제3차 현장과제 모니터링</h4>
					<h6>▷ 총 103명 (1/9)</h6>
				</div>
				
				
				
				<div id="search-box1" class="col-lg-7" style="padding:0;">
					<form class="pull-left;">
						<select class="list_form" name="type" style="display: inline;">
							<option value="" >조 선택</option>
							<option value="N" >1조</option>
							<option value="I" >2조</option>
							<option value="P" >3조</option>
						</select>
						<select class="list_form" name="type" style="display: inline;">
							<option value="" >선정여부</option>
							<option value="yes" >YES</option>
							<option value="no" >NO</option>
						</select>
						<select class="list_form" name="type" style="display: inline;">
							<option value="" >전체</option>
							<option value="N" >이름</option>
							<option value="I" >아이디</option>
							<option value="P" >연락처</option>
						</select>
						<input type="text" class="list_form" name="searchText" value="${vo.searchText }" style="display: inline; width:100px;">
						<input type="button" id="search-button1" value="검색" onclick="fnSearch();">
					</form>
					
				</div>
				
				<div class="col-lg-5 pull-right" style="padding:0; text-align:right">
					<button class="btn btn-theme  " onclick="fnView();">신청자보기</button>
				</div>
				
				<table class="table table-bordered table-striped modal_table" style="margin-top:8%;width:18%;float:left;">
					
					<thead>
						<tr>
							<th>조</th>
							<th>신청</th>
							<th>선정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>3</td>
							<td>1</td>
						</tr>
					</tbody>
					
				</table>
				<table class="table table-bordered table-striped modal_table" style="margin-top:8%;width:18%; margin-left:2%;float:left;">
					
					<thead>
						<tr>
							<th>조</th>
							<th>신청</th>
							<th>선정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>3</td>
							<td>1</td>
						</tr>
					</tbody>
					
				</table>
				<table class="table table-bordered table-striped modal_table" style="margin-top:8%;width:18%; margin-left:2%;float:left;">
					
					<thead>
						<tr>
							<th>조</th>
							<th>신청</th>
							<th>선정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>3</td>
							<td>1</td>
						</tr>
					</tbody>
					
				</table>
				<table class="table table-bordered table-striped modal_table" style="margin-top:8%;width:18%; margin-left:2%;float:left;">
					
					<thead>
						<tr>
							<th>조</th>
							<th>신청</th>
							<th>선정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>3</td>
							<td>1</td>
						</tr>
					</tbody>
					
				</table>
				<table class="table table-bordered table-striped modal_table" style="margin-top:8%;width:18%; margin-left:2%;float:left;">
					
					<thead>
						<tr>
							<th>조</th>
							<th>신청</th>
							<th>선정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>3</td>
							<td>1</td>
						</tr>
					</tbody>
					
				</table>
				
			</div>
		</div>
	</div>
</section>