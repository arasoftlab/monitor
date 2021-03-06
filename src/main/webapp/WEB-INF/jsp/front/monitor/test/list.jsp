<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>	
	.s_q{font-weight:bold !important;}
	.sub_q{color:#acacac; font-size:8px;}
	.horizontal{margin:5px 0; border:1px solid #ccc;}
	body {overflow-X:hidden}
</style>


<script>
//자동완성기능 해제
$(document).ready(function(){
	$("input").attr("autocomplete", "off");
	
	$("input[type='file']").on("change", function() {
		//console.log("access change");
	});
});


fnCheckSession();

function fnCheckSession(){
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/member/checkSession.do'/>",
		success : function(data){
			if(data.result == "success"){
				
				//location.href="<c:url value='/member/profile.do'/>";
				$("#account_id").text(data.account.name);

				$("#login_form").attr("display" , "none");
				$("#logout_form").attr("display" , "block");
			}else{
				window.close();
			}
		},
		error : function(request,status,error) {
			////console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);				
		}
	});
}


function noEvent() {
    if (event.keyCode == 116) {
        event.keyCode= 2;
        return false;
    }
    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
    {
        return false;
    }
}

document.onkeydown = noEvent;


function captureReturnKey(e) { 
    if(e.keyCode==13 && e.srcElement.type != 'textarea') 
    return false; 
} 

//테스트리스트 입장시 가장 처음에 있는 질의문을 불러오기위해 초기화
var answers_id = '${answers_id}';
var is_payment = '${is_payment}';
var subject_id = '${subject_id}';
var is_maxpage = 100;

answers_id = (answers_id == "") ? "1567" : answers_id;

<c:set var="search" value="'" />
<c:set var="replace" value="" />

var is_modify = '<c:out value="${fn:replace(history_params, search, replace)}"/>';
var is_member = '${m_vo.id}';
var is_pollnum = '${m_vo.poll_num}';
var report_num = '${report_num}';

function onEnter()
{
	if (is_modify =="") 
	{
		console.log("next >>>");
		getNextQuestion('${list[0].question_id }','${list[0].question_num}','1' ,0 , '');
	}
	else
	{
		console.log("prev <<<");
		// 나중에 이전 기능 살릴땐 지나온 번지수를 컬럼에 뿌렷다가 같이 던져주자.
		getPreviewQuestion('${list[now_num-1].question_id }' , '' , '${now_num }' , is_modify);
	}
}

function onBankPopup()
{	
	location.href = "/monitor/front/subject/bank.do?subject_id="+subject_id+"&poll_num="+is_pollnum+"&member_id="+is_member+"&report_num"+ report_num;
}

function goEndpage(history_params , answers_id, com, isA){
	var params = {};	
	params = $("form").serialize();
	var endMsg = "";
	
	
	if(isA =="1") {
		endMsg = com;
	}else{
		endMsg = "${headertitle.close_comment}";
	}

	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/front/subject/complete.do'/>",
		data : {
			"history_params" : history_params,
			"params" : params, 
			"report_num" : report_num,
			"answers_id" : answers_id
			},
		success : function(data){
			
			if (is_payment == "Y")
			{
				//alert('${headertitle.close_comment}');
				alert(endMsg);
				onBankPopup();
			}else{			
				alert(endMsg);
				//alert('${headertitle.close_comment}');
				window.close();
			}
		},
		error : function(request,status,error) {
			////console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	

}

function goEndCommentpage(com , history_params, isA )
{	
	goEndpage(history_params, answers_id, com, isA);
}

function historyDelete(question_id,history_org , history_params){
	var history_arr = history_org.split(",");
	var ret_history = "";
		
	if (history_arr.length == 1)
	{
		alert("첫 화면입니다.");
	}
	else
	{
		for (var i =0 ; i < history_arr.length-1 ; i++)
		{
			if(i > 0)
			{
				ret_history += ",";
			}
			
			ret_history +=history_arr[i];			
			////console.log(history_arr[i]);
		}		
		var back_num = history_arr[history_arr.length-2];		
		////console.log(ret_history);
		getPreviewQuestion(question_id , ret_history,back_num , history_params);
	}	
}

function historyAppend(question_id , history_org , this_num , bifurcation , history_params){
	
	bifurcation = typeof bifurcation !== 'undefined' ? bifurcation : 0;
	history_params = typeof history_params !== 'undefined' ? history_params : '';
	
	var history_arr = history_org + "," +this_num;	
	getNextQuestion(question_id, history_arr, this_num , bifurcation , history_params);
	
	
	$("input").each(function(i, e){
		console.log(i, e);
	});
	
	//console.log(question_id , history_org , this_num , bifurcation , history_params);
}

function getPreviewQuestion(question_id,history_arr,back_num , history_params ){
	is_maxpage = back_num;
	console.log("question_id:"+ question_id);
	console.log("history_arr:" + history_arr);
	console.log("history_par:" + history_params);
	console.log("back_num :" + back_num);
	console.log("answers_id:" + answers_id);
	console.log("report_num:" + report_num);
	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/front/subject/previewpage.do'/>",
		data : {
			"question_id" : question_id, 
			"history_arr" : history_arr,
			"history_params" : history_params,
			"back_num" : back_num , 
			"answers_id" : answers_id,
			"report_num" : report_num
			},
		success : function(data){
			console.log("prev call rst : " + back_num);
			console.log(data);
			$("#test_target").html(data);			
			$("#test_index").text(back_num);
		},
		error : function(request,status,error) {
			console.log("code:"+request.status+"\n"+"error:"+error);
			alert("잘못된 접근이거나 이미 완료된 과제입니다.");
		}
	});
}

function getNextQuestion(question_id , history_arr, this_num , bifurcation , history_params){
	var params = {};
	var maxpage = '${list.size()}';
		
	if (!this_num)
	{
		if ( is_maxpage == maxpage)
		{
			//goEndpage(history_params, answers_id);
		}
	}
	
	is_maxpage = this_num;	
	
	params = $("form").serialize();
	//console.log("param : "+params);
	
	
	console.log("question_id:"+ question_id);
	console.log("history_arr:" + history_arr);
	console.log("history_par:" + history_params);
	console.log("answers_id:" + answers_id);
	console.log("report_num:" + report_num);
	console.log("form_param:" + params);
	
	
	$.ajax({
				async : true,
				type : "POST",
				url : "nextpage.do",
				data : {
						"question_id" : question_id,
						"history_arr" : history_arr,
						"history_params" : history_params,
						"params" : params ,
						"bifurcation" : bifurcation,
						"answers_id" : answers_id,
						"report_num" : report_num
						},
				success : function(data){
					if (data != "")
					{						
						$("#test_target").html(data);			
						$("#test_index").text(this_num);
						////console.log(this_num);
					}
				},
				error : function(request,status,error) {
					////console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
	});
	
	
}



function on_testPop_close(){
	window.close();
}

$(window).load(function(){
	onEnter();
	opener.location.reload();
	
});
</script>
	

<div class="col-xs-12" >test</div>


	<section id="content" style="    padding-bottom: 170px">
	<div class="container cos-xs-12">
		
		<div id="test_target" style=" border: 2px solid #ccc;  border-radius: 10px 10px 10px 10px;">
		
		
		</div>
				
	</div>
	</section>

	<div  
		style="
		margin-top: -170px;
	    position: absolute;
	    width: 100%;
	    color: black;
	    margin-left:45%;
	    font-weight: 500;">
		
		( <span id="test_index">1</span>/ ${list.size()} )  
	</div>
	<div class="row">
		<div class="col-xs-12">
			<button class="btn btn-theme center-block" onclick="on_testPop_close()" style="background: #8C8C8C;">
				<i class="fa fa-times" aria-hidden="true" style="font-size: 25px;"></i>		
			<br/><span style="font-size:8pt;">창 닫기</span></button>
		</div>
	</div>


