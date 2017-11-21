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


function get_chked_values(){
	  var chked_val = "";
	  $(":radio[name='answers']:checked").each(function(pi,po){
	    chked_val += ","+po.value;
	  });
	  if(chked_val!="")chked_val = chked_val.substring(1);
	  return chked_val;
	}

function chkValidation()
{
	//var answers = get_chked_values();

	var answers ="";
	var i , j;
	
	var is_all_chk = 0;
	
	for(i=0,j=-2 ; i > j ; i++)
	{
		if ( $(":input:radio[name=answers_"+i+"]:checked").val())
		{
			answers += ","+$(":input:radio[name=answers_"+i+"]:checked").val();
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
		alert("아무것도 선택하지 않으셨습니다.");
	}else{
		
		if (is_all_chk != '${optionList.size()}')
		{
			alert('지문당 하나씩은 선택하셔야 합니다.');	
		}
		else{
			historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}');
		}
		
		//alert(answers);
		//getNextQuestion('${nextpage.question_id }');
		//
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
	


					<div>
						<c:forEach var="item" items="${optionList }" varStatus="i">
																
							<div>
								${item.label_front }
							</div>																
								
								<c:choose>
									<c:when test="${item.form eq 5}">

									<table class="table_five" style="width:100%">
									<tr>
										<td>
											<div class="five_text" style="width:100%">${item.label_1 }</div>
										</td>
										<td>
											<div class="five_text" style="width:100%">${item.label_2 }</div>
										</td>
										<td>
											<div class="five_text" style="width:100%">${item.label_3 }</div>
										</td>
										<td>
											<div class="five_text" style="width:100%">${item.label_4 }</div>
										</td>
										<td>
											<div class="five_text" style="width:100%">${item.label_5 }</div>
										</td>
									</tr>
									
									</c:when>

									<c:when test="${item.form eq 7}">

									<table class="table_seven" style="width:100%">
										<tr>
											<td colspan="7">
												<table style="width:100%;">
													<tr>
														<td style="width:33%; text-align:left;">${item.label_1 }</td>
														<td style="width:33%;">${item.label_2 }</td>
														<td style="width:32%; text-align:right;">${item.label_3 }</td>
														<td style="width:2%;"></td>
													</tr>
												</table>
												
											</td>
										</tr>
									</c:when>
				
									<c:when test="${item.form eq 9}">

									<table class="table_nine" style="width:100%">
										<tr>
											<td colspan="9">
												<table style="width:100%;">
													<tr>
														<td style="width:33%; text-align:left;">${item.label_1 }</td>
														<td style="width:33%;">${item.label_2 }</td>
														<td style="width:32%; text-align:right;">${item.label_3 }</td>
														<td style="width:2%;"></td>
													</tr>
												</table>
												
											</td>
										</tr>
									</c:when>
									
									<c:when test="${item.form eq 10}">

									<table class="table_ten" style="width:100%">
										<tr>
											<td colspan="10">
												<table style="width:100%;">
													<tr>
														<td style="width:33%; text-align:left;">${item.label_1 }</td>
														<td style="width:33%;">${item.label_2 }</td>
														<td style="width:32%; text-align:right;">${item.label_3 }</td>
														<td style="width:2%;"></td>
													</tr>
												</table>
												
											</td>
										</tr>
									</c:when>

									<c:when test="${item.form eq 11}">

									<table class="table_eleven" style="width:100%">
										<tr>
											<td colspan="11">
												<table style="width:100%;">
													<tr>
														<td style="width:33%; text-align:left;">${item.label_1 }</td>
														<td style="width:33%;">${item.label_2 }</td>
														<td style="width:32%; text-align:right;">${item.label_3 }</td>
														<td style="width:2%;"></td>
													</tr>
												</table>
												
											</td>
										</tr>							
									
									</c:when>
									
									<c:otherwise>
										<table class="table_three" style="width:100%">
										
										<tr>
											<td>
												<div class="three_text" style="margin-left:0; width:100%">${item.label_1 }</div>
											</td>
											<td>
												<div class="three_text" style="margin-left:0; width:100%">${item.label_2 }</div>
											</td>
											<td>
												<div class="three_text" style="margin-left:0; width:100%">${item.label_3 }</div>
											</td>
										</tr>									
									</c:otherwise>
								</c:choose>
								



								<tr>
											<c:forEach var="answers" begin="1" end="${item.form}" varStatus="j">
											<td>
												<input type="radio" name="answers_${i.index }" value="${j.index }">
											</td>
											</c:forEach>									
								</tr>
								
								</table>
							<c:choose>
								<c:when test="${ i.count eq fn:length(optionList) }">
														
								</c:when>														
								<c:otherwise>
									<hr class="horizontal">
								</c:otherwise>							
							</c:choose>
								
						</c:forEach>
					</div>




	<c:choose>
		<c:when test="${vo.cont_type eq 'V'}">

		<hr class="horizontal"/>

			<c:forEach var="item" items="${settingsList }" >
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
		
			<c:forEach var="item" items="${settingsList }" >
				<c:forEach var="file" items="${item.fileList }">
					<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" style="width: 150px;">
				</c:forEach>
			</c:forEach>
		</c:otherwise>
	</c:choose>




<jsp:include page="inc/footer_R.jsp"></jsp:include>
