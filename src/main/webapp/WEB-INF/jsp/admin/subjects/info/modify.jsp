<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="<c:url value='/js/smartEditor/js/HuskyEZCreator.js'/>"></script>
<script type="text/javascript">
var oEditors = [];

$(function(){
	

	$.datepicker.setDefaults($.datepicker.regional['ko']);

	
	$('input:text[numberOnly]').keypress(function (event) {
		if(event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) {
			event.preventDefault();
	    }
	});
	$(document).on("keyup", "input:text[numberOnly]", function() {
		$(this).val($(this).val().replace(/[^0-9]/gi,""));
	});
	$(document).on("focusout", "input:text[numberOnly]", function() {
		if($(this).val() == "") $(this).val("0");
	});
	$(document).on("focusin", "input:text[numberOnly]", function() {
		if($(this).val() == "0") $(this).val("");
	});
	
	$("input[name='pay_sum']").keyup(function(){
		if(Number($(this).val()) > 0){
			$("input[name='pay_yn'][value='Y']").attr("checked", true);
		}
	});
	
	$(".date").datepicker({
		language: 'ko',
		format:'yyyy/mm/dd',
		todayHighlight: true
	}).on('changeDate', function(e) {
	       //return get_url_and_refresh_link();
	});
});

function fnSave(){
	oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);	//description
	
	//파일 업로드 시 저장 전 필수
	fnFileChecked();
	
	
	if ( $("#title").val() == "" )
	{
		alert("제목을 입력하세요.");
		return false;	
	}	
	
	if ( $(':radio[name="type"]:checked').length < 1 )
	{
		alert("과제종류를 선택하세요.");
		return false;
	}
	
	if ( $("#asmDate1").val() == "" || $("#asmDate2").val() == "") 
	{
		alert("과제 제출기간을 선택해 주세요.");
		return false;
	}
	
	if ( $(':radio[name="pay_yn"]:checked').length < 1 )
	{
		alert("활동비 지급 형태를 선택해주세요.");
		return false;
	}
	

	if ( $(':radio[name="type"]:checked').val() == "F" )
	{
		if ($("#monitorDate1").val() == "" || $("#monitorDate2").val() == "") 
		{
			alert("현장과제는 모니터 신청기간을 선택해야합니다.");
			return false;	
		}
	}
	
	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/subject/info/save.do'/>",
		data : $("form").serialize(),
		success : function(data){
			if(data.result == "success"){
				location.href="<c:url value='/admin/subject/list.do'/>";
			}else{
				alert("저장된 데이터가 없습니다.");
			}
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

function fnDelete(){
	if(confirm("삭제 하시겠습니까?")){
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/admin/subject/info/delete.do'/>",
			data : $("form").serialize(),
			success : function(data){
				if(data.result == "success"){
					location.href="<c:url value='/admin/subject/list.do'/>";
				}else{
					alert("삭제된 데이터가 없습니다.");
				}
			},
			error : function(request,status,error) {
				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
	}
}

function fnSumMen(){
	var men_total = Number($("input[name='team_cnt']").val())*Number($("input[name='men_cnt']").val());
	$("input[name='men_total']").val(men_total);
}

function fnPayChecked(val){
	if(val === "N"){
		$("input[name='pay_sum']").val("0");
		$("input[name='pay_sum']").attr("disabled", true);
	}else{
		$("input[name='pay_sum']").attr("disabled", false);
	}
}

function fnSubjectChecked(val){
	if(val === "Y"){
		$("input[name='apply_s_date']").val("");
		$("input[name='apply_e_date']").val("");
		
		$("input[name='question_cnt']").val("");
		$("input[name='team_cnt']").val("");
		$("input[name='men_cnt']").val("");
		$("input[name='men_total']").val("");
				
		$("input[name='apply_s_date']").attr("disabled", true);
		$("input[name='apply_e_date']").attr("disabled", true);
		
		$("input[name='question_cnt']").attr("disabled", true);
		$("input[name='team_cnt']").attr("disabled", true);
		$("input[name='men_cnt']").attr("disabled", true);
		$("input[name='men_total']").attr("disabled", true);
		
	}else{
		$("input[name='apply_s_date']").attr("disabled", false);
		$("input[name='apply_e_date']").attr("disabled", false);
		
		$("input[name='question_cnt']").attr("disabled", false);
		$("input[name='team_cnt']").attr("disabled", false);
		$("input[name='men_cnt']").attr("disabled", false);
		$("input[name='men_total']").attr("disabled", false);
	}
}

</script>

	<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
			<label class="information">√ 과제종료 후 활동비 입금일에 날짜를 입력하면 회원들이 [마이페이지] > [참여내역] > 입금신청일 부분에서 확인할 수 있습니다.
				</label>
				<form>
					<input type="hidden" name="subject_id" value="${vo.subject_id }">
					<input type="hidden" name="cont_uuid" value="${vo.cont_uuid }">
					
					<input type="hidden" name="close_comment" value="${vo.close_comment }">
					
					<table class="table table-bordered table-margin">
						<tbody>
							<tr>
								<td class="td1">*과제제목</td>
								<td colspan=3 class="left">
									<input type="text" value="${vo.title }"  class="form-control" name="title" id="title">
								</td>
							</tr>
							<tr>
								<td class="td1">의뢰부서</td>
								<td colspan=3 class="left">
									<input type="text" value="${vo.reqdep }" class="form-control" name="reqdep">
								</td>
							</tr>
							<tr>
								<td class="td1">*과제종류</td>
								<td colspan=3 class="left">
									<div class="radio">
										<label class="col-xs-4"><input type="radio" name="type" value="F" onclick="fnSubjectChecked('N')" <c:if test="${vo.type eq 'F'}">checked</c:if> >현장과제(참여모집 공고)</label>
										<label class="col-xs-4"><input type="radio" name="type" value="V" onclick="fnSubjectChecked('Y')" <c:if test="${vo.type eq 'V'}">checked</c:if> >설문과제(지정과제)</label>
									</div>
									<span style="font-size: 12px; color: #ababab;">* 참여자 모집 없이 아무나 참여할 수 있는 과제일 경우, 설문과제(지정과제) 선택</span>
								</td>
							</tr>
							<tr>
								<td class="td1">모니터 신청기간</td>
								<td colspan=3 class="left">
									<div class="col-xs-12" style="padding:0;">
										<label class="col-xs-3"><input type="text" class="form-control date " id="monitorDate1" value="<fmt:formatDate value="${vo.apply_s_date }" pattern="yyyy/MM/dd" />" name="apply_s_date"/></label>
										<label class="col-xs-1">&nbsp;&nbsp;&nbsp;~</label>
										<label class="col-xs-3"><input type="text" class="form-control date " id="monitorDate2" value="<fmt:formatDate value="${vo.apply_e_date }" pattern="yyyy/MM/dd" />" name="apply_e_date"/></label>
									</div> 
								</td>
							</tr>
							<tr>
								<td class="td1">*과제 제출기간</td>
								<td colspan=3 class="left">
									<div class="col-xs-12" style="padding:0;">
										<label class="col-xs-3"><input type="text" class="form-control date " id="asmDate1" value="<fmt:formatDate value="${vo.submit_s_date }" pattern="yyyy/MM/dd" />" name="submit_s_date"/></label>
										<label class="col-xs-1">&nbsp;&nbsp;&nbsp;~</label>
										<label class="col-xs-3"><input type="text" class="form-control date " id="asmDate2" value="<fmt:formatDate value="${vo.submit_e_date }" pattern="yyyy/MM/dd" />" name="submit_e_date"/></label>
									</div> 
								</td>
							</tr>
							
							<tr>
								<td class="td1">모니터링 조건</td>
								<td colspan=3 class="left">
									<label>과제 수행 수 <input type="text" class="text-right" value="${vo.question_cnt }" style="width:12%;" name="question_cnt" numberonly="true"> 개</label>
									<label>
										<input type="text" class="text-right" value="${vo.team_cnt }" style="width:10%;" name="team_cnt" onkeyup="fnSumMen();" numberonly="true"> 조 &nbsp;X&nbsp;
									 	각 조<input type="text" class="text-right" value="${vo.men_cnt }" style="width:10%;" name="men_cnt" onkeyup="fnSumMen();" numberonly="true"> 명
									 	 &nbsp;=&nbsp;<input type="text" class="text-right" value="${vo.men_total }" style="width:10%;" name="men_total" readonly="readonly" numberonly="true"> 명
									 </label>
								</td>
							</tr>
							<tr>
								<td class="td1">*활동비지급</td>
								<td colspan=3 class="left">
									<div class="radio" style="height:20px;">
										<label class="col-xs-4">
											<input type="radio" value="N" name="pay_yn" <c:if test="${vo.pay_yn eq 'N'}">checked</c:if> onchange="fnPayChecked('N');" >없음
										</label>
										<label class="col-xs-1">
											<input type="radio" value="Y" name="pay_yn" <c:if test="${vo.pay_yn eq 'Y'}">checked</c:if> onchange="fnPayChecked('Y');" >있음
										</label>
										<label><input type="text" value="${vo.pay_sum }" style="width: 15%; margin-top: -10px;" name="pay_sum" class="text-right" numberonly="true" <c:if test="${vo.pay_yn eq 'N'}">disabled</c:if>>원</label>
									</div>
								</td>
							</tr>
							<tr>
								<td class="td1">활동비 입금 신청일</td>
								<td colspan=3 class="left">
									<label class="col-xs-3"><input type="text" class="form-control date" value="<fmt:formatDate value="${vo.pay_date }" pattern="yyyy/MM/dd" />" name="pay_date"/></label>
									<label>&nbsp;&nbsp; * 과제기간 종료 후 재무과나 주무과에 입금 신청한 날을 선택</label>
								</td>
							</tr>
							<tr>
								<td class="td1">*조사 설명</td>
								<td colspan=3 class="left">
									<jsp:include page="/WEB-INF/inc/editor1.jsp"></jsp:include>
									<label class="information">√ 현장과제 경우 현장에서 과제 수행하는 방법이나 필수사항에 대해 자세히 기재</label>
								</td>
							</tr>
							
							<tr>
								<td class="td1">첨부파일</td>
								<td colspan=3 class="left">
									<jsp:include page="/WEB-INF/inc/fileUpload.jsp"></jsp:include>
									<label class="information">√ 설문지를 첨부하면 모니터들이 미리 설문내용을 확인하고 과제를 수행할 수 있습니다.</label>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="col-xs-12 pull-right right">
				<c:if test="${!empty vo.subject_id }">
					<button class="btn btn-default" onclick="location.href='view.do?subject_id=${vo.subject_id}';">취소</button>
					<button class="btn btn-warning" onclick="fnDelete();">삭제</button>
				</c:if>
				<button class="btn btn-theme " onclick="fnSave();">저장</button>
				<button class="btn btn-info " onclick="location.href='<c:url value='/admin/subject/list.do'/>';">목록</button>
			</div>
		</div>
	</div>
	</section>
	