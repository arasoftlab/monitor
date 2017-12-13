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
	document.getElementById('bbs_cont').onkeyup();
	document.getElementById('bbs_dsc').onkeyup();
	

});

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
	var answers ="";
	var i , j;
	
	var is_all_chk = 0;
	
	//alert($("#answers_0").val());
	
	
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
			historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}');
		}
	}
//		getNextQuestion('${nextpage.question_id }');
		//historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}');
	
//	}
	
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
		<h4>
			<!-- 굳이  읽기 전용 텍스트에리어를 쓴 이유는 웹단에 뿌리는 데이터베이스 저장값은 \r\n 개행 문자형태이므로
			    <br>태그로 치환하기엔 모호성이 있다고 판단되었다.
			 -->
			<textarea id="bbs_cont" name="bbs_cont" onkeyup="resize(this)" readonly style="width: 100%;overflow: hidden;resize:none;font-weight: bold;border: 0px;">${vo.title }</textarea>
		</h4>
	</div>
	
	<div style="color:#8C8C8C">
		
		<textarea id="bbs_dsc" name="bbs_dsc" onkeyup="resize(this)" readonly style="width: 100%;overflow: hidden;resize:none;font-weight: bold;border: 0px;">${vo.description }</textarea>
	</div>
		
	
	<hr class="horizontal">
	
	<c:forEach var="item" items="${optionList }" varStatus="i">
<%-- 	
		<div>
			${item.label_front }
			<div style="padding-top:5px;padding-bottom:5px;"> 
				<input type="text" id="answers_${i.index }" name="answers_${i.index }" value="" style="width:80%">
				${item.label_rear }
			</div>
		</div>
		
 --%>		
 		<div style="padding-top:5px;padding-bottom:5px;">
			${i.index+1 })
				<c:if test="${item.label_1 eq null || item.label_1 eq 'text'}">
    			${item.label_front }
					<input type="text" id="answers_${i.index }" name="answers_${i.index }" value="${history_answer[i.index+1]}" style="width:60%" autocomplete=off>
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
					<textarea rows="3" style="width: 95%" id="answers_${i.index }" name="answers_${i.index }">${history_answer[i.index+1]}</textarea>
					${item.label_rear }
	  			</div>
				</c:if>		
		</div>
		<div style="width:100%;float:left">
			<hr class="horizontal" style="margin-right: 10px;margin-top:10px;margin-bottom:10px; border-bottom: 1px solid #eee;">
		</div>
			
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
		
				<hr class="horizontal"/>
		
			<c:forEach var="item" items="${settingsList }">
				<c:forEach var="file" items="${item.fileList }">
					<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" style="width: 150px;">
				</c:forEach>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	
	<input type="hidden" id="desText" name="desText" value="">
	
</form>
<jsp:include page="inc/footer_W.jsp"></jsp:include>
