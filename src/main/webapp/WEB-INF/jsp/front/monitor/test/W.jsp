<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<style>
.modal {
	display: none;
    position: fixed; 
    top: 3%; 
    right: 3%; 
    left: 3%; 
    width: 320px; 
    margin: 0; 
}
.modal-body { 
    height: 60%; 
}
</style>
<script>

//숫자만 입력받도록 하는 스크립트 키다운과 키업이 한쌍임 편집키 허용 한글 비허용 
$(document).on("keyup", "input[type='number']", function(event) {
	$(this).css("ime-mode","disabled");
	
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if (( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
	{	
		event.target.value = event.target.value.replace(/[^0-9]/gi,'');
		return true;
	}else{
		alert("숫자만 입력가능 합니다.");
	    event.target.value = event.target.value.replace(/[^0-9]/gi,'');
	}
}); 

function chkValidation()
{
	window.event.preventDefault();
	var answers ="";
	var i , j;
	
	var is_all_chk = 0;
	
	//alert($("#answers_0").val());
	
	var w_temp_cnt = "${fn:length(optionList)}";
	
	for (var a = 0 ; a < w_temp_cnt ; a++)
	{
		$("#answers_"+a).val($("#answers_"+a).val().replace(/\n/g, "<br>"));	
	}
	
	
	
	for(i=0,j=-2 ; i > j ; i++)
	{
		if ( $(":input[name=answers_"+i+"]").val())
		{
			answers += ","+$(":input[name=answers_"+i+"]").val();
			is_all_chk++;
		}
		else
		{
			answers = answers.substring(1);
			j = 100;	
		}
	}

	
	
	if (!answers) 
	{
		alert("아무것도 입력하지 않으셨습니다.");
	}else{
		if (is_all_chk != '${optionList.size()}')
		{
			alert('서술형 응답은 모두 기입해 주셔야합니다.');	
		}else{
			//alert(answers);
			historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}', 0 ,  '${history_params}');
		}
	}
		
	//getNextQuestion('${nextpage.question_id }');
	//historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}');
	
//	}
	
}

function resize(obj) {
	////console.log(obj);
	
    obj.style.height = "1px";
    obj.style.height = (20+obj.scrollHeight)+"px";
}
</script>


	<div style="background: lightblue; border-radius: 6px 6px 0 0;padding:10px;">
		<div style="width: 100%;font-size: 14pt;font-weight: bold;border: 0px;">
			${vo.question_num}. 
			${vo.title }
		</div>
		
		<div style="color:#8C8C8C;padding-top:5px;padding-bottom:5px">		
			${vo.description }
		</div>
	</div>
		
<form name="testData" style="padding-top:10px; padding-bottom:10px;display: table;width:100%" onkeydown="return captureReturnKey(event)">
	
	<input type="hidden" id="type" name="type" value="${vo.type}">
	<input type="hidden" id="q_num" name="q_num" value="${vo.question_num}">

<div style="font-size:10pt;padding-left: 10px;width:100%; padding-top:5px;padding-bottom:5px;">
	
	<c:forEach var="item" items="${optionList }" varStatus="i">
	
		<div style="font-size:10pt">
			${i.index+1 })
				<c:if test="${item.label_1 eq null || item.label_1 eq 'text'}">
    			${item.label_front }
					<input type="text" onKeyUp="onChkESQ(this)" id="answers_${i.index }" name="answers_${i.index }" value="${history_answer[i.index+1]}" style="width:60%">
					${item.label_rear }
				</c:if>
				
				<c:if test="${item.label_1 eq null || item.label_1 eq 'num'}">
    			${item.label_front }				
					<input type="number" id="answers_${i.index }" name="answers_${i.index }" value="${history_answer[i.index+1]}" style="width:20%" autocomplete=off>
					${item.label_rear }
				</c:if>
				
				<c:if test="${item.label_1 eq 'memo'}">
    			${item.label_front }						
    			<div style="margin-left:0px;padding-top:5px;padding-bottom:5px;">
					<textarea rows="3" onKeyUp="onChkESQ(this)" style="width: 95%" id="answers_${i.index }" name="answers_${i.index }">${history_answer[i.index+1]}</textarea>
					${item.label_rear }
	  			</div>
				</c:if>		
		</div>

		<div style="width:100%;float:left">
			<hr class="horizontal" style="margin-right: 10px;margin-top:10px;margin-bottom:10px; border-bottom: 1px solid #eee;">
		</div>
	
	</c:forEach>
	
</div>	

<div style="width:100%;float:left;margin-left:10px;text-align:center">		
	<c:choose>
		<c:when test="${vo.cont_type eq 'V'}">


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
					<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" style="width:360px;">
				</c:forEach>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
	
</form>


<%@ include file="inc/footer_common.jsp" %>

<jsp:include page="inc/footer_W.jsp"></jsp:include>



