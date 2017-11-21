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
	
		<div>
			${item.label_front }
			<div style="padding-top:5px;padding-bottom:5px;"> 
				<input type="text" id="answers_${i.index }" name="answers_${i.index }" value="" style="width:80%">
				${item.label_rear }
			</div>
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
