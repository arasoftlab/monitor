<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link href="<c:url value='/css/bootstrap.min.css'/>"  rel="stylesheet" />
	
	<link href="<c:url value='/css/fancybox/jquery.fancybox.css'/>" rel="stylesheet">
	<link href="<c:url value='/css/flexslider.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/style.css'/>" rel="stylesheet" />
	
	<!-- Theme skin -->
	<link href="<c:url value='/skins/default.css'/>" rel="stylesheet" />
	
	<link href="<c:url value='/css/datepicker.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/datepicker3.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/daterangepicker-bs3.css'/>" rel="stylesheet" />

	<script src="<c:url value='/js/jquery.js'/>"></script>
	<script src="<c:url value='/js/jquery-ui.js'/>"></script>
	<script src="<c:url value='/js/jquery.form.js'/>"></script>
	<script src="<c:url value='/js/jquery.slimscroll.js'/>"></script>
	<script src="<c:url value='/js/jquery.cookie.js'/>"></script>


<style>
.ui-state-highlight { height: 65px; line-height: 1.2em; background-color: #ddf3ff; border: 1px solid #ccc;}
</style>

<script type="text/javascript">
$(function(){
	$(".question-list").sortable({
		placeholder: "ui-state-highlight",
		start: function(event, ui) {
	        ui.item.startPos = ui.item.index();
	    },
	    stop: function(event, ui) {
	       	var subject_id = $(ui.item.context).data("subject_id");
	        var question_id = $(ui.item.context).data("question_id");
	        //var question_num = $(ui.item.context).data("question_num");
	        var from_num = (ui.item.startPos+1);
	        var to_num = (ui.item.index()+1);
	        
	        if(from_num != to_num){
	        	$.ajax({
		    		async : true,
		    		type : "POST",
		    		url : "<c:url value='/admin/subject/mng/question/move.do'/>",
		    		data : {
		    			"subject_id" : subject_id,
		    			"question_id" : question_id,
		    			"question_num" : from_num,
		    			"to_num" : to_num
		    		},
		    		success : function(data){
		    			if(data.result == "success"){
		    				var question = data.question;
		    				$(".question").each(function(index, item){
		    					$(item).find("#question_num").html(index+1);
		    				});
		    				fnQuestion(question.question_id);
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
	    }
	});
	$(".question-list").disableSelection();
	
	//var scroll;
	if($('#testDiv').length > 0){
		if($.cookie("scrollStart") == "bottom"){
			$('#testDiv').slimscroll({
				height: $(window).height()-100+"",
				start : "bottom"
			});
			$.cookie("scrollStart", null);
		}else{
			$('#testDiv').slimscroll({
				height: $(window).height()-100+""
			});
		}
		
		//리스트 위치
		if($(document).scrollTop() > 110) {
			$(".slimscroll").css("top", "116px");
		}else{
			$(".slimscroll").css("top", 228-$(document).scrollTop()+"px");
		}
		
	}
	
});

function fnClickedList(question_id){
	$.cookie("settingVisible", "in");
	fnQuestion(question_id);
}


function oppenr_refresh()
{
	window.opener.location.reload();
	window.close();
}

</script>

<nav class="slimscroll" style=""> 
<!--  
<ul class="nav">

		<li> 과제항목</li> 
			<li>
				<div id="search-box1" style="padding:0;">
					<form id="insert_form">
						<input type="hidden" name="subject_id" value="${vo.subject_id }">
						
						<select class="select" name="type">
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
			</li>
	</ul>
	-->
	<div id="testDiv">
		<ul class="nav bs-docs-sidenav">
			<li> 
				<!--  
					<a href="javascript:fnQuestionStart();">시작페이지</a> 
				-->
				
				<ul class="nav question-list">
					<c:forEach var="item" items="${list }">
						<li class="question" data-subject_id="${item.subject_id }" data-question_id="${item.question_id }">
							<a href="javascript:fnClickedList('${item.question_id }');">
								<span id="question_num">${item.question_num}</span>.
								<c:if test="${empty item.title }"><span style="color: #ccc;">질문없음</span></c:if>
								<c:if test="${!empty item.title }"><span style="
								display: inline-block;
								width: 160px;
								white-space: nowrap;
								overflow: hidden;
								text-overflow: ellipsis;">${item.title } </span></c:if>
								<br/>
								<span style="font-size: 8pt;">[${item.typeText }] </span>
							</a>
						</li>
					</c:forEach>
				</ul>
				<!--  
				<a href="javascript:fnQuestionEnd();">종료페이지</a> 
				-->
				

			</li>
		</ul>	
	</div>
</nav>
			<div style="float:right;padding-right:20px;">
				<input type="button" value="확인" onclick="oppenr_refresh()">
			</div>