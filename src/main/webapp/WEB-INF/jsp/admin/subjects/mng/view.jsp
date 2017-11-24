<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!--  
작성자 : JINX 
목적 : 전역 file에 대한 limit 값을 지정함. 해당 question 페이지 내에 지정되는 모든 파일에 대한 제한값을 걸어놓음.
     해당 jstl 변수를 걸어놓은 이유는 [ 이후에 바로 로딩될 js파일에 해당 변수값이 정의되기 때문. ]
-->

<c:set var="fileUpMaxCnt" value="3"/>
<c:set var="fileMaxSize" value="20"/>
<c:set var="fileObjects" value="bmp,gif,jpg,jpeg,png,txt,xls,xlsx,doc,docx,hwp,ppt,pptx,pdf,zip,mp4"/>

<script src="<c:url value='/js/video.js'/>"></script>
<script src="<c:url value='/js/question-setting.js'/>"></script>
<script src="<c:url value='/js/option-img.js'/>"></script>

<style>
	.table_text tr td{text-align:left;}
	
	.vjs-control-bar{visibility: hidden;}
</style>

<script>

$(document).ready(function() {
	
	//document.getElementById('bbs_cont').onkeyup();
	//document.getElementById('bbs_dsc').onkeyup();
	
	//alert( $('textarea#bbs_dsc').get(0).scrollHeight );
	
});

function resize(obj) {
	//console.log(obj);
	
    obj.style.height = "1px";
    obj.style.height = (20+obj.scrollHeight)+"px";
}



$(function(){
	
	//$("#btn_go").trigger('click');
	//$("#btn_close").trigger('click');
	//fnQuestionList("${vo.subject_id}");
	$("#loading_img").css('display','block');
	
	fnQuestionStart();
	fnQuestionEnd();
	


});

function fnQuestionList(subject_id){
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/subject/mng/question/list.do'/>",
		data : {"subject_id" : subject_id},
		success : function(data){
			$("#q_list").html(data);
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

function fnRefreshQuestion(question_id,formName){
	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/subject/mng/question/modify.do'/>",
		data : {"question_id" : question_id},
		success : function(data){			
			$(formName).replaceWith(data);			
			fnBtnView("Q");
			
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

function fnQuestion(question_id){
	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/subject/mng/question/modify.do'/>",
		data : {"question_id" : question_id},
		success : function(data){	
			$("#modal-body").html(data);
			//fnBtnView("Q");			
			$("#btn_go").trigger('click');
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

function fnQuestionStart(){
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/subject/mng/question/start.do'/>",
		data : {"subject_id" : "${vo.subject_id}"},
		success : function(data){
			$("#q_start").html(data);
			fnBtnView("START");
			
			$("#loading_img").css('display','none');
		},
		error : function(request,status,error) {
			////////////////////////////////////// 
			//
			// 과제 등록 > 등록 화면에서 상단의 [과제관리] 누를 경우 subject_id 값이 공백이다.  
			// 이 경우를 위해 해당 error 캐치 부분에서 파라메타를 조사 할 필요가 있다.
			//
			// 작성자 : JINX 
			//////////////////////////////////////
			
			var subID_temp = "${vo.subject_id}"; 
			
			if (subID_temp == "")
			{
				alert("등록된 과제가 아닙니다. 과제등록 후 사용바랍니다.");
				history.back();
			}
			else{
			
				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		}
	});
}

function fnQuestionEnd(){
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/subject/mng/question/end.do'/>",
		data : {"subject_id" : "${vo.subject_id}"},
		success : function(data){
			$("#q_end").html(data);
			fnBtnView("END");
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

function fnInsertQuestion(){
	
	if($("#insert_form select[name='type']").val().length === 0){
		return;
	}
	
	$.cookie("scrollStart", "bottom");
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/subject/mng/question/insert.do'/>",
		data : $("#insert_form").serialize(),
		success : function(data){
			if(data.result == "success"){
				var question = data.question;
//				fnQuestionList(question.subject_id);
//				fnQuestion(question.question_id);
				fnQuestionStart();
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


function fnUpdateQuestion(form){
	
	
	$.ajax({
		async : true,
		type : "POST",
		url : "/monitor/admin/subject/mng/question/update.do",
		data : $(form).serialize(),
		success : function(data){
			if(data.result == "success"){
				alert("저장 되었습니다.");
				$("#btn_close").trigger('click');
				fnQuestionStart();
				var question = data.question;
				//fnQuestionList(question.subject_id);
				
				//fnQuestionStart();

			}else{
				alert("저장된 데이터가 없습니다.");
			}
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!1!");
		}
	});
	
}

function fnUpdateStartpage(){

	var description = $("#description").val();
	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/subject/mng/updateStart.do'/>",
		data : {"subject_id" : "${vo.subject_id}",
				"description" : description},
		success : function(data){
			if(data.result == "success"){
				alert("저장 되었습니다.");
				//var question = data.question;
				//fnQuestionList(question.subject_id);
				
				//fnQuestionStart();
				
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

function fnUpdateEndpage(){

	var close_comment = $("#close_comment").val();
	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/subject/mng/updateEnd.do'/>",
		data : {"subject_id" : "${vo.subject_id}",
				"close_comment" : close_comment},
		success : function(data){
			if(data.result == "success"){
				alert("저장 되었습니다.");
				//var question = data.question;
				//fnQuestionList(question.subject_id);
				
				//fnQuestionStart();
				
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


function fnDeleteQuestion(form){
	
	if(confirm("삭제 하시겠습니까?")){
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/admin/subject/mng/question/delete.do'/>",
			data : $(form).serialize(),
			success : function(data){
			
//				fnClearOption();
						
				if(data.result == "success"){
/*
					var question = data.question;
					fnQuestionList(question.subject_id);
					$("#q_modify").html("");

					fnQuestionList(question.subject_id);
					
					fnQuestionStart();
*/
					
					location.reload();
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

function fnInsertQuestionSettings(form){
	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/subject/mng/questionsettings/insert.do'/>",
		data : $(form).serialize(),
		success : function(data){
			
			if(data.result == "success"){
				var question = data.question;
//				fnQuestion(question.question_id);
				fnRefreshQuestion(question.question_id,form);
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

function fnInsertOptions(form){
	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/subject/mng/option/insert.do'/>",
		data : $(form).serialize(),
		success : function(data){
			
			if(data.result == "success"){
				var question = data.question;
//				fnQuestion(question.question_id);
				fnRefreshQuestion(question.question_id,form);
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

function fnInsertOptionsR(form){
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/subject/mng/option/insertR.do'/>",
		data : $(form).serialize(),
		success : function(data){
			if(data.result == "success"){
				var question = data.question;
//				fnQuestion(question.question_id);
				fnRefreshQuestion(question.question_id,form);
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

function fnDeleteOption(options_id){
	if(confirm("삭제 하시겠습니까?")){
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/admin/subject/mng/option/delete.do'/>",
			data : {"options_id" : options_id},
			success : function(data){
				if(data.result == "success"){
					$("#"+options_id).remove();
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

function fnDeleteSettings(idx){
	if(confirm("삭제 하시겠습니까?")){
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/admin/subject/mng/questionsettings/delete.do'/>",
			data : {"idx" : idx},
			success : function(data){
				if(data.result == "success"){
					$("#setting_"+idx).remove();
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

// 과제 삭제시 해당 과제에 있는 옵션을 모두 지움.
// by JINX 
function fnClearOption(question_id){
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/admin/subject/mng/option/clear.do'/>",
			data : $("#q_form").serialize(),
			success : function(data){
				//console.log(data);
			},
			error : function(request,status,error) {
				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("함수위치 : fnClearOption. ajax에러 !!");
			}
		});
}

function fnBtnView(type){
	/*
	if("START" === type){
		$("#btn_group").hide();
	}else if("END" === type){
		$("#btn_group").hide();
		$(".btn-warning").hide();
	}else{
		$("#btn_group").show();
		$("#btn_group button").show();
	}*/
}

function onSetting_TypeChange(question_id , form)
{
	$.ajax({
		async : true,
		type : "POST",
		url : "/monitor/admin/subject/mng/question/update.do",
		data : $(form).serialize(),
		success : function(data){
			if(data.result == "success"){
				fnRefreshQuestion(question_id , form);
			}else{
				alert("폼에 문제있음.");
			}
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!! to change");
		}
	});
	

}

function getSubjectMovePage(id){
	var popUrl = "/monitor//admin/subject/mng/question/list.do?subject_id="+id;	//팝업창에 출력될 페이지 URL
	var popOption = "width=250, height=560, top=200 ,left=0 , resizable=no, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	
}

function fnCopyQuestion(question_id ){
	
    
	var param = 
	{
		"question_id" : question_id,
	}
	
	//console.log(param);
	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/subject/mng/question/copy.do'/>",
		data : param,
		success : function(data){
			//console.log(data);
			
			fnQuestionStart();
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("함수위치 : fnClearOption. ajax에러 !!");
		}
	});
}


</script>

<section id="content">
	<div class="container">
		<div class="row" style="margin-bottom:0;">
			
			<div style="margin-bottom:20px;">
				<button class="btn btn-theme" onclick="getSubjectMovePage('${vo.subject_id}')">과제 항목 이동</button>
			</div>
			
			<div>
				<h1>[${vo.title }]</h1>
			</div>
			
	
			
			<div id="loading_img" style="text-align:center;display:none;">
				<img src="/monitor/img/progressBar.gif" style="width: 35%;">
			</div>
			
			<div id="q_start" class="col-lg-9 mngcontent" style="width:100%;margin-left: 0; margin-bottom:20px;text-align:center">

			</div>

			<!-- 과제 내용 출력  -->
			

			
			<div id="search-box1" style="padding:0;margin-top:20px; margin-bottom: 15px; height: 50px; background-color: #BDBDBD; float:left;width:100%">
					<form id="insert_form" style="padding: 10px;">
						<input type="hidden" name="subject_id" value="${vo.subject_id }">
						
						<select class="select" name="type" style="height:24px; font-size:13px;">
							<option value="">선택</option>
							<option value="S">단일 응답형</option>
							<option value="C">분기 응답형</option>
							<option value="M">중복(복수) 응답형</option>
							<option value="O">서열(순서) 응답형</option>
							<option value="R">척도 응답형</option>
							<option value="W">서술 응답형</option>
							<option value="B">게시판(정보제공)형</option>
							<option value="T" >파일 첨부형</option>
						</select>
						<input type="button" id="search-button1" value="추가" onclick="fnInsertQuestion();">
					</form>								
			</div>
	
			<div id="q_end" class="col-lg-9 mngcontent" style="width:100%;margin-left: 0;">
				
			</div>

			<button id="btn_go" type="button" class="modal_btn" data-toggle="modal" data-target=".info_modal"></button>

				<div class="modal fade info_modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >

				<div id="set_loading" style="
				position: absolute;
			    width: 100%;
			    height: 100%;
			    top: 30%;
			    left: 0;
			    z-index: 99;
			    text-align: center;display:none">
			    
					<img src="/monitor/img/progressBar.gif" style="width: 65%;">
				</div>

				  <div class="modal-dialog" style="width:800px">
				    <div class="modal-content">
				      <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" id="btn_close">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
				      </div>

				      <div class="modal-body" id="modal-body">
						
   				      </div>

				      <div class="modal-footer">
				      <!--  
						<button type="button" class="btn btn-theme modal_btn">등록/수정</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						-->
				      </div>
				    </div>
				  </div>
				</div>
				
		</div>
	</div>
</section>























