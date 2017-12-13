<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<style>	
	.s_q{font-weight:bold !important;}
	.sub_q{color:#acacac; font-size:8px;}
	.horizontal{margin:5px 0; border:1px solid #ccc;}
	</style>


<style>

body {overflow-X:hidden}

</style>

<script>
//테스트리스트 입장시 가장 처음에 있는 질의문을 불러오기위해 초기화

//공통 속성 설정 자동완성기능 해제
$(document).ready(function(){
	$("input").attr("autocomplete", "off");
});

var is_maxpage = 100;

getNextQuestion('${list[0].question_id }','${list[0].question_num}','1' ,0);

//console.log('${list.size()}');

function goEndpage(){
	alert('${headertitle.close_comment}');
	window.close();
}

function goEndCommentpage(com)
{
	alert(com);
	window.close();
}

function historyDelete(question_id,history_org){
	
	var history_arr = history_org.split(",");
	var ret_history = "";
	
	//console.log(history_arr.length);
		
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
			
			//console.log(history_arr[i]);
		}
		
		var back_num = history_arr[history_arr.length-2];
		
		//console.log(ret_history);
		getPreviewQuestion(question_id , ret_history,back_num);
	}	
}

function historyAppend(question_id , history_org , this_num , bifurcation){
	
	bifurcation = typeof bifurcation !== 'undefined' ? bifurcation : 0;
	
	var history_arr = history_org + "," +this_num;
		
	getNextQuestion(question_id,history_arr,this_num , bifurcation);
}

function getPreviewQuestion(question_id,history_arr,back_num ){
		
	//console.log(history_arr);
	
	is_maxpage = back_num;
	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/subject/test/previewpage.do'/>",
		data : {
			"question_id" : question_id, 
			"history_arr" : history_arr,
			"back_num" : back_num},
		success : function(data){
			
			$("#test_target").html(data);			
			$("#test_index").text(back_num);
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

function getNextQuestion(question_id,history_arr,this_num , bifurcation){
	
	var params = {};
	
	var maxpage = '${list.size()}';
	
	/*
	if (is_maxpage == this_num)
	{
		
		if ( is_maxpage == maxpage)
		{
			goEndpage();
		}
	}
	*/
	
	if (!this_num)
	{
		if ( is_maxpage == maxpage)
		{
			goEndpage();
		}
	}
	
	is_maxpage = this_num;	
	
	/*
	//console.log(history_arr);
	//console.log(this_num);
	*/
	params = $("form").serialize();
	//console.log("param : "+params);
	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/subject/test/nextpage.do'/>",
		data : {"question_id" : question_id,
				"history_arr" : history_arr,
				"params" : params ,
				"bifurcation" : bifurcation },
		success : function(data){
			
			$("#test_target").html(data);			
			$("#test_index").text(this_num);
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

</script>
	
<jsp:include page="inc/header.jsp"></jsp:include>


	<section id="content" style="    padding-bottom: 170px">
	<div class="container">
		
		<div id="test_target"></div>
				
		<hr class="horizontal"/>
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


<!--
<jsp:include page="/base_design/inc/footer.jsp"></jsp:include> -->