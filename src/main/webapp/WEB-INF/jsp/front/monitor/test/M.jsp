<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    

<script>

var chk_max = '${fn:length(optionList)}';

function get_chked_values(){
	  var chked_val = "";
	  $(":checkbox[id='answers']:checked").each(function(pi,po){
	    chked_val += ","+po.value;
	  });
	  if(chked_val!="")chked_val = chked_val.substring(1);
	  return chked_val;
}

function get_chked_cnt(){
	  var chked_cnt = 0;
	  $(":checkbox[id='answers']:checked").each(function(pi,po){
		  chked_cnt++;
	  });

	  return chked_cnt;
}

function chkValidation()
{
	var answers = get_chked_values();
	var test = $("#answers_text_"+answers).val();
	
		
	if (!answers) 
	{
		alert("아무것도 선택하지 않으셨습니다.");
		return;
	}else{
		
		if(get_chked_cnt() >= '${vo.required_cnt}')
		{
			if (typeof test !== 'undefined' && test == '')
			{
				alert("서술형 답변을 작성해 주시기바랍니다.");
				return;
			}
			
			historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}',0 ,  '${history_params}');
					
		}
		else{
			alert("최소 "+'${vo.required_cnt}'+"개 만큼 선택하셔야 합니다." );
		}
		
//		alert(answers);
//		getNextQuestion('${nextpage.question_id }');
		
	}
	
}

function resize(obj) {
	//console.log(obj);
	
    obj.style.height = "1px";
    obj.style.height = (20+obj.scrollHeight)+"px";
}


function onChk(num){

	for (var i = 1 ; i < chk_max+1 ; i ++ )  
	{
		$("#answers_text_"+i).attr("disabled",true);
	}	
	var $ans = $("input[name='answers_"+ num + "']");
	
	if($ans.is(":checked")){
		$("#answers_text_"+num).attr("disabled",false);	
	}else{
		$("#answers_text_"+num).attr("disabled",true);
	}
	
	

}

</script>
	
	<div style="background: lightblue;
    border-radius: 6px 6px 0 0;padding:15px;">
		<div style="width: 100%;font-size: 14pt;font-weight: bold;border: 0px;">
			${vo.question_num}. 
			${vo.title }
		</div>
		
		<div style="color:#8C8C8C;padding-top:5px;padding-bottom:5px">		
			${vo.description }
		</div>
	</div>
	


	
<form name="testData" style="padding-top:10px; padding-bottom:10px;display: table;width:100%">
	
	<input type="hidden" id="type" name="type" value="${vo.type}">
	<input type="hidden" id="q_num" name="q_num" value="${vo.question_num}">

<div style="font-size:10pt;padding-left: 10px;width:100%; padding-top:5px;padding-bottom:5px;">

	<c:forEach var="item" items="${optionList }"  varStatus="i">
		<c:choose>
			<c:when test="${item.descyn eq 'Y'}">
				<c:set var="footerCommon" value="Y" />
				<div style="font-size:10pt;width:100%">
					<div style="text-align:left;width:80%;float:left;">	
					
						${i.index+1 }) ${item.label_front }&nbsp;&nbsp;&nbsp; 
					
						<input type="text" onKeyUp="onChkESQ(this)" 
						${ (!empty history_answer_text) ? '' : 'disabled' }
						id="answers_text_${item.options_num}" name="answers_text_${item.options_num}"  value="${history_answer_text}">
					${item.keyword }				
					</div>
					
					<div style="text-align:right;width:20%;float:right;">
						<input style="margin-right: 12px;" type="checkbox" id="answers" onchange="onChk('${item.options_num}')" name="answers_${item.options_num}" value="${item.options_num}"
 	
						<c:if test="${!empty history_answer_text }">checked</c:if>	

						>
					</div>			
		
					<div style="width:100%;float:left">
						<c:forEach var="file" items="${item.fileList }">
							<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>"
								style="width: 150px;">
						</c:forEach>
					</div>	
			
					<div style="width:100%;float:left">
						<hr class="horizontal" style="margin-right: 10px;margin-top:10px;border-bottom: 1px solid #eee;">
					</div>
		
				</div>					
			</c:when>
			
			<c:otherwise>
				<c:set var="footerCommon" value="N" />
				<div style="font-size:10pt;width:100%">
					<div style="text-align:left;width:80%;float:left;">	
					${i.index+1 })
						${item.label_front } 				
					</div>
					
					<div style="text-align:right;width:20%;float:right;">
						<input style="margin-right: 12px;" type="checkbox" id="answers" name="answers_${item.options_num}" value="${item.options_num}"
							<c:forEach var="h_item" items="${history_answer}" varStatus="j"> 	
								<c:if test="${!empty history_answer && item.options_num eq history_answer[j.index+1] }">checked</c:if>	
							</c:forEach>
						>
					</div>			
		
					<div style="width:100%;float:left">
						<c:forEach var="file" items="${item.fileList }">
							<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>"
								style="width: 150px;">
						</c:forEach>
					</div>	
			
					<div style="width:100%;float:left">
						<hr class="horizontal" style="margin-right: 10px;margin-top:10px;border-bottom: 1px solid #eee;">
					</div>
		
				</div>
			</c:otherwise>
		</c:choose>

	
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
					
					<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" style="width: 150px;">
				</c:forEach>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
</form>

<c:if test="${footerCommon eq 'Y'}">
	<jsp:include page="inc/footer_common.jsp"></jsp:include>
</c:if>

<jsp:include page="inc/footer_M.jsp"></jsp:include>
