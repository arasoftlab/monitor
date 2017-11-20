<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 
각 8개 페이지를 나누고 그마다 벨리데이션을 따로 지정한다.
 -->
<script>

$(document).ready(function() {
//	document.getElementById('bbs_cont').onkeyup();
	document.getElementById('bbs_dsc').onkeyup();
});

function resize(obj) {
	////console.log(obj);
	
    obj.style.height = "1px";
    obj.style.height = (20+obj.scrollHeight)+"px";
}

function chkValidation()
{
	//getNextQuestion('${nextpage.question_id }');
	
	historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}',0 , '${history_params}');
	
	/*
	var answers = $(":input:radio[name=answers]:checked").val();
	
	if (!answers) 
	{
		alert("아무것도 선택하지 않으셨습니다.");
	}else{
		//alert(answers);
		getNextQuestion('${nextpage.question_id }');
	}*/
	
}

</script>



	<div style="background: lightblue;width:100%
    border-radius: 6px 6px 0 0;padding:15px;">
		<div style="width: 100%;font-size: 14pt;font-weight: bold;border: 0px;">
			${vo.question_num}. 
			${vo.title }
		</div>
		
	</div>
		

	<div style="font-size:10pt;padding-left: 10px;width:100%; padding-top:5px;padding-bottom:5px;">
		
		<div style="color:#8C8C8C">		
			<textarea id="bbs_dsc" name="bbs_dsc" onkeyup="resize(this)" readonly style="width: 100%;font-size: 10pt;overflow: hidden;resize:none;font-weight: bold;border: 0px;color:#5D5D5D">${vo.description }</textarea>
		</div>
	</div>		
<form name="testData" style="padding-top:10px; padding-bottom:10px;display: table;width:100%">

	<input type="hidden" id="type" name="type" value="${vo.type}">
	<input type="hidden" id="q_num" name="q_num" value="${vo.question_num}">
	
	<input type="hidden" id="answers" name="answers" value="">
	
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
					<a target="_blank" href="https://research.seoul.go.kr<c:url value='${file.savePath }/${file.unqFileName }'/>">
						<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" style="width: 150px;">
					</a>
				</c:forEach>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>	
</form>
<jsp:include page="inc/footer_B.jsp"></jsp:include>
