<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 
각 8개 페이지를 나누고 그마다 벨리데이션을 따로 지정한다.
 -->
<script>

var chk_max = '${fn:length(optionList)}';

$(document).ready(function() {
	//document.getElementById('bbs_cont').onkeyup();
	//document.getElementById('bbs_dsc').onkeyup();
});


function chkValidation()
{
	var answers = $(":input:radio[name=answers]:checked").val();
	var test = $("#answers_text_"+answers).val();
	var history_params = "${history_params}";
		
	if (!answers) 
	{
		alert("아무것도 선택하지 않으셨습니다.");
	}else{
		
		if($("#answers_text_"+answers).val() != 'undefined')
		{
			if (test == '')
			{
				alert("서술형 답변을 작성해 주시기바랍니다.");
			}
			else{
				historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}' , 0,  history_params);
			}		
		}
		else{
			historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}' , 0,  history_params);
		}
		
		//alert(answers);
		//getNextQuestion('${nextpage.question_id }');
		//historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}');
	}
	
}

function resize(obj) {
	////console.log(obj);
	
    obj.style.height = "1px";
    obj.style.height = (20+obj.scrollHeight)+"px";
}

function onChk(num){

	
	for (var i = 1 ; i < chk_max+1 ; i ++ )  
	{
		$("#answers_text_"+i).attr("disabled",true);
	}	
	
	$("#answers_text_"+num).attr("disabled",false);
	
}

</script>



	<div style="background: lightblue; border-radius: 6px 6px 0 0;padding:10px;">
		<div style="width: 100%;font-size: 14pt;font-weight: bold;border: 0px;">
			${vo.question_num}. 
			${vo.title }
		</div>
		
		<div style="color:#8C8C8C;font-size: 10pt;padding-top:5px;padding-bottom:5px">		
			${vo.description }
		</div>
	</div>
	
<form name="testData" style="padding-top:10px; padding-bottom:10px;display: table;width:100%" onkeydown="return captureReturnKey(event)">
	<input type="hidden" id="type" name="type" value="${vo.type}">
	<input type="hidden" id="q_num" name="q_num" value="${vo.question_num}">

<div style="font-size:10pt;padding-left: 10px;width:100%; padding-top:5px;padding-bottom:5px;">
	<c:forEach var="item" items="${optionList }" varStatus="o_num">
		<c:choose>
			<c:when test="${item.descyn eq 'Y'}">
				<div style="font-size:10pt;width:100%">
					<div style="text-align:left;float:left;">
					${o_num.index+1})
					${item.label_front }&nbsp;&nbsp;&nbsp; 
					<input type="text" onKeyUp="onChkESQ(this)" disabled id="answers_text_${item.options_num}" name="answers_text_${item.options_num}" <c:if test="${!empty history_answer && item.options_num eq history_answer }">value="${history_answer_text}"</c:if>>
					${item.keyword }
					</div>

					<div style="text-align:right;float:right;">
						<input style="margin-right: 12px;" type="radio" id="answers" onchange="onChk('${item.options_num}')" name="answers" value="${item.options_num}"
						<c:if test="${!empty history_answer && item.options_num eq history_answer }">checked</c:if>
						>
					</div>
					
					<div style="width:100%;float:left">
						<c:forEach var="file" items="${item.fileList }">
							<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" >
						</c:forEach>
					</div>				
					
					<div style="width:100%;float:left">
						<hr class="horizontal" style="margin-right: 10px;margin-top:10px; border-bottom: 1px solid #eee;">
					</div>
				</div>

			</c:when>
	
			<c:otherwise>
				<div style="font-size:10pt;width:100%">
					<div style="text-align:left;width:80%;float:left;">
					${o_num.index+1})
					${item.label_front }
					</div>
					
					
					<div style="text-align:right;width:20%;float:right;">
					<input style="margin-right: 12px;" type="radio" id="answers" onchange="onChk('${item.options_num}')" name="answers" value="${item.options_num}" 
						<c:if test="${!empty history_answer && item.options_num eq history_answer }">checked</c:if>
					>
					
					</div>

					<div style="width:100%;float:left">
						<c:forEach var="file" items="${item.fileList }">
							<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" style="width:250px;">
						</c:forEach>
					</div>	

					<div style="width:100%;float:left;padding-bottom:5px">
						<hr class="horizontal" style="margin-right: 10px;margin-top:10px; margin-bottom:10px; border-bottom: 1px solid #eee;">
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>

<!--- 옵션 이미지(동영상) --->
<div style="width:100%;float:left;margin-left:10px;text-align:center">
	<c:choose>
		<c:when test="${vo.cont_type eq 'V'}">
			<c:forEach var="item" items="${settingsList }" varStatus="j">
				<c:forEach var="file" items="${item.fileList }">
					<div style="width:100%;text-align:center;">
						<video width="250px" controls="controls"
							class="video-js vjs-default-skin" data-setup="{}"> 
							<source	src="<c:url value='${file.savePath }/${file.unqFileName }'/>"
							type="video/mp4" /> 
						</video>
					</div>
	  		</c:forEach>
			</c:forEach>
		</c:when>

		<c:otherwise>
			<c:forEach var="item" items="${settingsList }" varStatus="i">
				<c:forEach var="file" items="${item.fileList }">
					<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" style="width:400px;">
				</c:forEach>
			</c:forEach>
		</c:otherwise>

	</c:choose>
</div>
</form>

<%@ include file="inc/footer_common.jsp" %>

<jsp:include page="inc/footer_S.jsp"></jsp:include>



