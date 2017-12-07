<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
 
<script>

$(document).ready(function() {
	//document.getElementById('bbs_cont').onkeyup();
	//document.getElementById('bbs_dsc').onkeyup();
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
	window.event.preventDefault();
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
			historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}',0 ,  '${history_params}');
		}
		
		//alert(answers);
		//getNextQuestion('${nextpage.question_id }');
		//
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
		
		<div style="color:#8C8C8C;font-size: 10pt;padding-top:5px;padding-bottom:5px">		
			${vo.description }
		</div>
	</div>
	


	

<form name="testData" style="padding-top:10px; padding-bottom:10px;display: table;width:100%">
	
	<input type="hidden" id="type" name="type" value="${vo.type}">
	<input type="hidden" id="q_num" name="q_num" value="${vo.question_num}">

<div class="r_subQuestTitle" >
						<c:forEach var="item" items="${optionList }" varStatus="i">
																
							<div>
								<strong>
							${i.index+1 })
								${item.label_front }
								</strong>
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
												<input type="radio" name="answers_${i.index }" value="${j.index }"
													<c:if test="${!empty history_answer && j.index eq history_answer[i.index+1] }">checked</c:if>	
												>
											</td>
											</c:forEach>									
								</tr>
								
								</table>
							<c:choose>
								<c:when test="${ i.count eq fn:length(optionList) }">
														
								</c:when>														
								<c:otherwise>
									<hr class="horizontal" style="margin-right: 10px;">
								</c:otherwise>							
							</c:choose>
								
						</c:forEach>
					</div>



<div style="width:100%;float:left;margin-left:10px;text-align:center;margin-top:10px;">
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

<jsp:include page="inc/footer_R.jsp"></jsp:include>
