<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script>

$(document).ready(function() {
	document.getElementById('bbs_cont').onkeyup();
	document.getElementById('bbs_dsc').onkeyup();
});

function chkValidation()
{
	var answers = $(":input:radio[name=answers]:checked").val();
	var bifurcation = $(":radio[name=answers]:checked").val();
	
	if (!answers) 
	{
		alert("아무것도 선택하지 않으셨습니다.");
	}else{
		if (bifurcation != 0)
		{
			if (bifurcation == 2016)
			{
				historyAppend('${vo.question_id }' , '${history_arr}', bifurcation , bifurcation);
			}else{
			
			historyAppend('${nextpage.question_id }' , '${history_arr}', bifurcation , bifurcation);
			}
		}
		else
		{
			historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}' , bifurcation);
		}
	}
	
}

function resize(obj) {
	//console.log(obj);
	
    obj.style.height = "1px";
    obj.style.height = (20+obj.scrollHeight)+"px";
}
</script>
	<input type="hidden" id="type" name="type" value="${vo.type}">
	<input type="hidden" id="q_num" name="q_num" value="${vo.question_num}">
	
	<div>
		<h2>
			<!-- 굳이  읽기 전용 텍스트에리어를 쓴 이유는 웹단에 뿌리는 데이터베이스 저장값은 \r\n 개행 문자형태이므로
			    <br>태그로 치환하기엔 모호성이 있다고 판단되었다.
			 -->
			<textarea id="bbs_cont" name="bbs_cont" onkeyup="resize(this)" readonly style="width: 100%;overflow: hidden;resize:none;font-weight: bold;border: 0px;">${vo.title }</textarea>
		</h2>
	</div>
	
	<div style="color:#8C8C8C">		
		<textarea id="bbs_dsc" name="bbs_dsc" onkeyup="resize(this)" readonly style="width: 100%;overflow: hidden;resize:none;font-weight: bold;border: 0px;">${vo.description }</textarea>
	</div>
	


	<hr class="horizontal">
	

<c:forEach var="item" items="${optionList }" >

	<c:choose>
		<c:when test="${item.endpoint eq 'Y'}">
			<div>
				<input type="radio" name="answers" value="2016">
				${item.label_front } 
				
				<c:forEach var="file" items="${item.fileList }">
					<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>"
						style="width: 150px;">
				</c:forEach>
				
			</div>
		</c:when>

		<c:otherwise>
			<div>
				<input type="radio" name="answers" value="${item.next_num }">
				${item.label_front } 
				
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
		
				<hr class="horizontal"/>
		
			<c:forEach var="item" items="${settingsList }">
				<c:forEach var="file" items="${item.fileList }">
					<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" style="width: 150px;">
				</c:forEach>
			</c:forEach>
		</c:otherwise>
	</c:choose>

<jsp:include page="inc/footer_C.jsp"></jsp:include>
