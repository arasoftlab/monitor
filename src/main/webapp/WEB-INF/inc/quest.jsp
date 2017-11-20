<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.highlight { height: 34px; line-height: 1.2em; background-color: #ddf3ff; border: 1px solid #ccc; margin-bottom: 10px;}
</style>



<script type="text/javascript">

$(document).ready(function() {
	/*
	document.getElementById('bbs_cont').onkeyup();
	document.getElementById('bbs_dsc').onkeyup();
	*/
	//alert( $('textarea#bbs_dsc').get(0).scrollHeight );
});

function resize(obj) {
	//console.log(obj);
	
    obj.style.height = "1px";
    obj.style.height = (20+obj.scrollHeight)+"px";
}


$(function(){
	$(".answer").sortable({
		placeholder: "highlight",
		handle: '.droppable',
		start: function(event, ui) {
	        ui.item.startPos = ui.item.index();
	    },
	    stop: function(event, ui) {
	       	var question_id = $(ui.item.context).data("question_id");
	        var options_id = $(ui.item.context).data("options_id");
	        var from_num = (ui.item.startPos+1);
	        var to_num = (ui.item.index()+1);
	        
	        if(from_num != to_num){
	        	$.ajax({
		    		async : true,
		    		type : "POST",
		    		url : "<c:url value='/admin/subject/mng/option/move.do'/>",
		    		data : {
		    			"question_id" : question_id,
		    			"options_id" : options_id,
		    			"options_num" : from_num,
		    			"to_num" : to_num
		    		},
		    		success : function(data){
		    			if(data.result == "success"){
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
	//$(".option-list").disableSelection();
});
</script>
	
	<div style="background:lightblue;border-radius: 6px 6px 0 0;">
		<table>
			<tr>
				<td style="padding-left: 20px;"><i class="fa fa-edit" style="font-size: xx-large;"></i></td>
				<td style="padding-left: 10px;"><h1> 질문   ${vo.question_num } </h1></td>
				<td style="padding-left: 20px;">
					<c:choose>
						<c:when test="${vo.type eq 'S'}"> <span> 단일 응답형 </span></c:when>
						<c:when test="${vo.type eq 'C'}"> <span> 분기응답형  </span></c:when>
						<c:when test="${vo.type eq 'M'}"> <span> 중복(복수)응답형 </span></c:when>
						<c:when test="${vo.type eq 'O'}"> <span> 서열(순서)응답형 </span></c:when>
						<c:when test="${vo.type eq 'R'}"> <span> 척도 응답형 </span></c:when>
						<c:when test="${vo.type eq 'W'}"> <span> 서술 응답형 </span></c:when>
						<c:when test="${vo.type eq 'B'}"> <span> 게시판(정보제공) 형</span></c:when>
						<c:when test="${vo.type eq 'T'}"> <span> 파일 첨부형 </span></c:when>
					</c:choose>	
				</td>
			</tr>
		</table>	
	</div>

	<table class="table table-bordered table-margin" style="margin-bottom:0;border-bottom: 0;height:auto">
		<tbody>
			<tr>
			<c:choose>
				<c:when test="${item.type eq 'B'}">

					<td class="td1">질문 입력</td>
					<td colspan=3 class="left">
						<div>
							<textarea id="title" name="title" onkeyup="resize(this)"class="quest_form" style="width: 100%;height:70px;">${vo.title }</textarea>
						</div>
					</td>
					
				</c:when>
				<c:otherwise>
					<td class="td1">질문 입력</td>
					<td colspan=3 class="left">
						<div>
							<textarea id="title" name="title" onkeyup="resize(this)"class="quest_form"  style="width: 100%;height:70px;">${vo.title }</textarea>
						</div>
					</td>
				</c:otherwise>
			</c:choose>
			</tr>
			
			<tr>
				<td class="td1" style="border-bottom:0;">질문 설명 </td>
				<td colspan=3 class="left" style="border-bottom:0;">
					<textarea rows="20" name="description" id="description" onkeyup="resize(this)" class="quest_form" style="height:70px;max-width:698px;">${vo.description }</textarea>
				</td>
			</tr>
		</tbody>
	</table>




