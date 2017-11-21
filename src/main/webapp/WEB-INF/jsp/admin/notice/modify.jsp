<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="<c:url value='/js/smartEditor/js/HuskyEZCreator.js'/>"></script>
<script type="text/javascript">

$(function(){

//onTypeSet('${vo.type}');

})

var oEditors = [];
function fnSave(){
	oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);	//description
	oEditors[1].exec("UPDATE_CONTENTS_FIELD", []);	//applyform
	
	if ( $("#title").val() == "" )
	{
		alert("제목을 입력하세요.");
		return false;	
	}
	
		
	if ($(":input:radio[name=type]:checked").val() != "S") 	
	{
		if ( $("#subject_s_id").val() == "" )
		{
			alert("연결과제를 선택하세요.");
			return false;	
		}
	}

	if ( $(':radio[name="open"]:checked').length < 1 )
	{
		alert("공개 여부를 선택해 주세요.");
		return false;
	}
	
	
	
	
	//파일 업로드 시 저장 전 필수
	fnFileChecked();
	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/notice/save.do'/>",
		data : $("form").serialize(),
		success : function(data){
			console.log(data);
			if(data.result == "success"){
								
				if ($("#notice_id").val()=="0") 
				{
					location.href="<c:url value='/admin/notice/list.do'/>";
				}else{
					location.href="<c:url value='/admin/notice/view.do?notice_id='/>"+$("#notice_id").val();		
				}
				
			}else{
				alert("저장된 데이터가 없습니다.");
			}
		},
		error : function(request,status,error) {
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

function fnDelete(){
	if(confirm("삭제 하시겠습니까?")){
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/admin/notice/delete.do'/>",
			data : $("form").serialize(),
			success : function(data){
				if(data.result == "success"){
					location.href="<c:url value='/admin/notice/list.do'/>";
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

function fnSetDate(obj){
	var apply_s_date = $(obj).find("option[value='"+$(obj).val()+"']").data("apply_s_date");
	var apply_e_date = $(obj).find("option[value='"+$(obj).val()+"']").data("apply_e_date");
	var submit_s_date = $(obj).find("option[value='"+$(obj).val()+"']").data("submit_s_date");
	var submit_e_date = $(obj).find("option[value='"+$(obj).val()+"']").data("submit_e_date");
	
	//console.log(apply_s_date);
	
	$("#apply_s_date").html(apply_s_date);
	$("#apply_e_date").html(apply_e_date);
	$("#submit_s_date").html(submit_s_date);
	$("#submit_e_date").html(submit_e_date);
}

function onTypeSet(type)
{	
	//console.log($("#type").val());
	//console.log($("#subject_id").val());
	//console.log($("#notice_id").val());
	

	if (type == 'F')
	{
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/admin/notice/unlinkrefresh.do'/>",
			data : {
				"type" : type,
				"subject_id" : $("#subject_id").val(),
				"notice_id" : $("#notice_id").val()
			},
			success : function(data){
				$("#unlink").html(data);
			},
			error : function(request,status,error) {
				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
		
		$("#link_subject").css("display","table-row");
		$("#link_subject_date").css("display","table-row");
	}
	
	if (type == 'V')
	{
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/admin/notice/unlinkrefresh.do'/>",
			data : $("form").serialize(),
			success : function(data){
				$("#unlink").html(data);
			},
			error : function(request,status,error) {
				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
		
		$("#link_subject").css("display","table-row");		
		$("#link_subject_date").css("display","table-row");
	}
	
	if (type == 'S')
	{
		$("#unlink").html("");
		
		$("#link_subject").css("display","none");
		$("#link_subject_date").css("display","none");
	}
}

</script>

<section id="content" >
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h4>공지사항</h4>
				<label class="information">√ 모니터 신청을 받는 경우에는 꼭! 현장과제(참여자 모집)체크 및 연결과제 설정</label>
				<form>
					<input type="hidden" name="notice_id" id="notice_id" value="${vo.notice_id }">
					<input type="hidden" name="cont_uuid" value="${vo.cont_uuid }">
					<input type="hidden" id="subject_id" value="${vo.subject_id }">
										
					<table class="table table-bordered table-margin">
						<tbody>
							<tr>
								<td class="td1">*공지제목</td>
								<td colspan=3 class="left">
									<input type="text" class="form-control" name="title" id="title" value="${vo.title }">
								</td>
							</tr>
							<tr>
								<td class="td1">*공지종류</td>
								<td colspan=3 class="left">
									<div class="radio">
										<label class="col-sm-4"><input type="radio" onclick="onTypeSet('S')" name="type" id="type" value="S" <c:if test="${vo.type eq 'S'}">checked</c:if> >단순, 일반공지</label>
										<label class="col-sm-4"><input type="radio" onclick="onTypeSet('F')" name="type" id="type" value="F" <c:if test="${vo.type eq 'F'}">checked</c:if> >현장과제(참여모집 공고)</label>								
										<label class="col-sm-4"><input type="radio" onclick="onTypeSet('V')" name="type" id="type" value="V" <c:if test="${vo.type eq 'V'}">checked</c:if> >설문과제(지정과제)</label>
									</div>
								</td>
							</tr>
							<tr id="link_subject">
								<td class="td1">*연결과제</td>
								<td colspan=3 class="left">
									<div class="col-lg-12" id="unlink">
										
									</div>
								</td>
							</tr>
							<tr id="link_subject_date">
								<td class="td1">모니터 신청기간</td>
								<td class="left">
									<label id="apply_s_date"><fmt:formatDate value='${vo.subjectVO.apply_s_date }' pattern='yyyy/MM/dd' /></label> ~ 
									<label id="apply_e_date"><fmt:formatDate value='${vo.subjectVO.apply_e_date }' pattern='yyyy/MM/dd' /></label>
								</td>
								<td class="td1">과제제출 기간</td>
								<td class="left">
									<label id="submit_s_date"><fmt:formatDate value='${vo.subjectVO.submit_s_date }' pattern='yyyy/MM/dd' /></label> ~ 
									<label id="submit_e_date"><fmt:formatDate value='${vo.subjectVO.submit_e_date }' pattern='yyyy/MM/dd' /></label>
								</td>
							</tr>
							<tr>
								<td class="td1">*홈 공개 여부</td>
								<td colspan=3 class="left">
									<div class="radio">
										<label class="col-sm-4"><input type="radio" value="Y" name="open" id="open" <c:if test="${vo.open eq 'Y'}">checked</c:if>  >&nbsp;홈 공개</label>
										<label class="col-sm-4"><input type="radio" value="N" name="open" id="open" <c:if test="${vo.open eq 'N'}">checked</c:if>  >&nbsp;홈 비공개</label>
									</div>
								</td>
							</tr>
							<tr>
								<td class="td1">*공지내용</td>
								<td colspan=3 class="left editor1"><jsp:include page="/WEB-INF/inc/editor1.jsp"></jsp:include></td>
							</tr>
							<tr>
								<td class="td1">신청방법</td>
								<td colspan=3 class="left"><jsp:include page="/WEB-INF/inc/editor2.jsp"></jsp:include></td>
							</tr>
							<tr>
								<td class="td1">첨부파일</td>
								<td colspan=3 class="left">
									<%@ include file="/WEB-INF/inc/fileUpload.jsp" %>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				
			</div>
			<!--  
			<label class="information">√ 파일 첨부는 공지 저장 후에 이용 가능</label>
			-->
			<div class="col-lg-3 pull-right right">
				<c:if test="${!empty vo.notice_id }">
					<button class="btn btn-default" onclick="location.href='view.do?notice_id=${vo.notice_id}';">취소</button>
					<button class="btn btn-warning" onclick="fnDelete();">삭제</button>
				</c:if>
				<button class="btn btn-theme" onclick="fnSave();">저장</button>
				<button class="btn btn-info" onclick="location.href='list.do';">목록</button>
			</div>
		</div>
	</div>
	</section>
	
<script type="text/javascript">

$(function(){
onTypeSet('${vo.type}');

})

</script>
	
