<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:set var="history_ans" value="" />

<c:if test="${!empty history_answer}">
	<c:forEach begin="1" var="ans_item" items="${history_answer }">
		<c:set var="history_ans" value="${history_ans}/${ans_item }" />
	</c:forEach>
</c:if> 


<script>

var history_ans = '${history_ans}';


var chk_max = '${fn:length(optionList)}';

var str_arr = "";

var num_arr = "";

var num_idx = 0;



function get_chked_values(){
	  var chked_val = "";
	  $(":checkbox[id='answers_chk']:checked").each(function(pi,po){
	    chked_val += ","+po.value;
	  });
	  if(chked_val!="")chked_val = chked_val.substring(1);
	 	  
	  return chked_val;
}

function get_chked_cnt(){
	  var chked_cnt = 0;
	  $(":checkbox[id='answers_chk']:checked").each(function(pi,po){
		  chked_cnt++;
	  });
		
	  return chked_cnt;
}



function chkValidation()
{
	var answers = get_chked_values();
		
	if (!answers) 
	{
		alert("아무것도 선택하지 않으셨습니다.");
	}else{
		
		if (get_chked_cnt() == '${vo.required_cnt}')
		{
			historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}',0 ,  '${history_params}');	
		}
		else{
			alert("최소 "+'${vo.required_cnt}'+"개 만큼 선택하셔야 합니다." );
		}
		
	}
	
}

function resize(obj) {
	////console.log(obj);
	
    obj.style.height = "1px";
    obj.style.height = (20+obj.scrollHeight)+"px";
}



function onSetArr(num,str)
{
	var arr_cnt = ${vo.required_cnt};
	
	str = str+",";
	
	// oncheck 혹은 outcheck  
	if ($(":checkbox[name=answers_"+num+"]:checked").val())
	{
		str_arr += str ;
		num_arr += num+ ",";
	}else{
		str_arr = str_arr.replace(str , "");		
		num_arr = num_arr.replace(num+"," , "");		
	}
	
	var str_temp = new Array();
	
	str_temp = str_arr.split(',');
	
	for (var i = 1 ; i < arr_cnt+1 ;i++)
	{
		$("#lable_"+i).text(str_temp[i-1]);
	}		
	
	$("#answers").val(num_arr);
}

</script>

	
	<div style="background: lightblue;
    border-radius: 6px 6px 0 0;padding:15px;">
		<div style="width: 100%;font-size: 14pt;font-weight: bold;border: 0px;">
			${vo.question_num}. 
			${vo.title }
		</div>
		
		<div style="color:#8C8C8C;font-size: 12pt;padding-top:5px;padding-bottom:5px">		
			${vo.description }
		</div>
	</div>


<form name="testData" style="padding-top:10px; padding-bottom:10px;display: table;width:100%">
	
	<input type="hidden" id="type" name="type" value="${vo.type}">
	<input type="hidden" id="q_num" name="q_num" value="${vo.question_num}">

	
	<!-- 서열형 응답은 좀 특이하게 -->
	
	<input type="hidden" id="answers" name="answers" value="">
	
<div style="width: 100%;float: left;padding-bottom: 20px;">

<c:forEach begin="1" end="${vo.required_cnt}" var="lable_num">
	
	<div style="float:left; width:50%;padding-bottom:10px;">
		<div style="margin-left:10px;width:90%;border-bottom: 1px solid black;">
			<b>${lable_num }.</b> &nbsp;<span id="lable_${lable_num }" style=></span>
		</div>
	</div>
		
</c:forEach>



</div>

		<hr class="horizontal" style="margin-right: 10px;margin-left: 10px;    border-bottom: 1px solid #eee;">

<c:forEach var="item" items="${optionList }" varStatus="o_num">

<div style="font-size:10pt;padding-left: 10px;width:100%; padding-top:5px;padding-bottom:5px">
  

<!--
		<div id="num_${item.options_num}" 
		style="float: left;width: 30px;
    	height: 13px;padding-left: 10px;" >
    	</div>
-->		
<!--  
		<input type="checkbox" onclick="onNumbering('${item.options_num}')" id="answers" name="answers_${item.options_num}" value="${item.options_num}"
			<c:forEach var="h_item" items="${history_answer}" varStatus="j"> 	
				<c:if test="${!empty history_answer && item.options_num eq history_answer[j.index+1] }">checked</c:if>	
			</c:forEach>
		>
-->
		<div style="text-align:left;width:80%;float:left;">
		${o_num.index+1})
		
				
		${item.label_front }
		 
				<c:forEach var="file" items="${item.fileList }">
					<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>"
						style="width: 150px;">
				</c:forEach>
		</div>
				
		<div style="text-align:right;width:20%;float:left;">
			<input style="margin-right: 12px;" type="checkbox" onclick="onSetArr('${item.options_num}','${item.label_front }')" id="answers_chk" name="answers_${item.options_num}" value="${item.options_num}">
		</div>
		

</div>

		<div style="width:100%;margin-top:25px;">
		<hr class="horizontal" style="margin-right: 10px;margin-left:10px;margin-top:10px;border-bottom: 1px solid #eee;">
		</div>

</c:forEach>

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

<jsp:include page="inc/footer_O.jsp"></jsp:include>

<script>
$(document).ready(function() {
//	document.getElementById('bbs_cont').onkeyup();
//	document.getElementById('bbs_dsc').onkeyup();

	var his_temp = new Array();
	
	his_temp = history_ans.split('/');
	
	for (var i = 1; i < his_temp.length ; i++)
	{
		$(":checkbox[name=answers_"+his_temp[i]+"]").click();	
		$(":checkbox[name=answers_"+his_temp[i]+"]").trigger("click");	
		$(":checkbox[name=answers_"+his_temp[i]+"]").prop('checked',true);
	}


});

</script>

