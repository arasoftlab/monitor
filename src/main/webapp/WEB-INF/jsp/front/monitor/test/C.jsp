<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    

<script>

$(document).ready(function() {
	//document.getElementById('bbs_cont').onkeyup();
	//document.getElementById('bbs_dsc').onkeyup();
});

function chkValidation()
{
	var answers = $(":input:radio[name=answers]:checked").val();
	
	var bifurcation = $(":input[id=answers_"+answers+"]").val();
	
	if (!answers) 
	{
		alert("아무것도 선택하지 않으셨습니다.");
	}else{
		if (bifurcation != 0)
		{
			if (bifurcation == 2016)
			{
				historyAppend('${vo.question_id }' , '${history_arr}', bifurcation , bifurcation ,  '${history_params}');
			}else{
			
			historyAppend('${nextpage.question_id }' , '${history_arr}', bifurcation , bifurcation , '${history_params}');
			}
		}
		else
		{
			historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}' , bifurcation , '${history_params}');
		}
	}
	
}

function resize(obj) {
	////console.log(obj);
	
    obj.style.height = "1px";
    obj.style.height = (20+obj.scrollHeight)+"px";
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

	<c:forEach var="item" items="${optionList }" varStatus="o_num">
	
		<c:choose>
			<c:when test="${item.endpoint eq 'Y'}">
			
				<div style="font-size:10pt;width:100%">
			
					<div style="text-align:left;width:80%;float:left;">
						<input type="hidden" id="answers_${item.options_num}" value="2016">

						${o_num.index+1 })
						
						${item.label_front } 
					</div>					

					<div style="text-align:right;width:20%;float:right;">
						<input style="margin-right: 12px;" type="radio" name="answers" value="${item.options_num}"
						<c:if test="${!empty history_answer && item.options_num eq history_answer }">checked</c:if>
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
				<div style="font-size:10pt">
					<div style="text-align:left;width:80%;float:left;">
						<input type="hidden" id="answers_${item.options_num}" value="${item.next_num }">
						${o_num.index+1 })
						${item.label_front } 
					</div>


					<div style="text-align:right;width:20%;float:right;">
						<input style="margin-right: 12px;" type="radio" name="answers" value="${item.options_num}"
						<c:if test="${!empty history_answer && item.options_num eq history_answer }">checked</c:if>
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
		
			<c:forEach var="item" items="${settingsList }" varStatus="j">
				<c:forEach var="file" items="${item.fileList }">
					<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" style="max-width: 80%;">
				</c:forEach>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
</form>
<jsp:include page="inc/footer_C.jsp"></jsp:include>
