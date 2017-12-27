<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<style>
input[type="text"] {padding:0px;}
</style>

<!-- 
각 8개 페이지를 나누고 그마다 벨리데이션을 따로 지정한다.
 -->
<script>

$(document).ready(function() {
	document.getElementById('bbs_cont').onkeyup();
	document.getElementById('bbs_dsc').onkeyup();
});


function chkValidation()
{
	var answers = $(":input:radio[name=answers]:checked").val();
	
	var test = $("#answers_text_"+answers).val();
	
	
	
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
				historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}');
			}
			
		}
		else{
			historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}');
		}
		
		//alert(answers);
		//getNextQuestion('${nextpage.question_id }');
		//historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}');
	}
	
}

function resize(obj) {
	//console.log(obj);
	
    obj.style.height = "1px";
    obj.style.height = (20+obj.scrollHeight)+"px";
}
</script>


<form name="testData">

	<input type="hidden" id="type" name="type" value="${vo.type}">
	<input type="hidden" id="q_num" name="q_num" value="${vo.question_num}">
	
	<div>
		<h2>
			<textarea id="bbs_cont" name="bbs_cont" onkeyup="resize(this)" readonly style="    font-size: 16pt;width: 100%;overflow: hidden;resize:none;font-weight: bold;border: 0px;">${vo.question_num}) ${vo.title }</textarea>
		</h2>
	</div>
	
	<div style="color:#8C8C8C">		
		<textarea id="bbs_dsc" name="bbs_dsc" onkeyup="resize(this)" readonly style="    margin-top: -35px;width: 100%;overflow: hidden;resize:none;font-weight: bold;border: 0px;">${vo.description }</textarea>
	</div>
		
	
	<hr class="horizontal">
	
	
	<c:forEach var="item" items="${optionList }" >
	
		<c:choose>
			<c:when test="${item.descyn eq 'Y'}">
				<div>
					<input type="radio" id="answers" name="answers" value="${item.options_num}">
					${item.label_front }&nbsp;&nbsp;&nbsp; 
					<input type="text" id="answers_text_${item.options_num}" name="answers_text_${item.options_num}" >
					${item.keyword }
				</div>

				<div>
					<c:forEach var="file" items="${item.fileList }">
						<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>"
							style="width: 150px;">
					</c:forEach>
				</div>

			</c:when>
	
			<c:otherwise>
				<div>
					<input type="radio" id="answers" name="answers" value="${item.options_num}">
					${item.label_front }
				</div>
				
				<div>
					<c:forEach var="file" items="${item.fileList }">
						<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>"
							style="width: 150px;">
					</c:forEach>
				</div>
				
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<c:choose>
		<c:when test="${vo.cont_type eq 'V'}">

		<hr class="horizontal"/>

			<c:forEach var="item" items="${settingsList }">
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
			<c:forEach var="item" items="${settingsList }">
				<c:forEach var="file" items="${item.fileList }">
					<hr class="horizontal"/>
					<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" style="width: 150px;">
				</c:forEach>
			</c:forEach>
		</c:otherwise>

	</c:choose>

			<input type="hidden" id="desText" name="desText" value="">
</form>
<jsp:include page="inc/footer_S.jsp"></jsp:include>
