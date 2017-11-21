<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">

fnCheckSession();

function replaceAll(str, target, replacement) {
    return str.split(target).join(replacement);
};


function onSave()
{
	if ($("#title").val() == "")
	{
		alert("제목을 입력해주세요.")
		return false;		
	}
	
	var isp = $("input[name='is_password']").prop("checked");
	var pw = $("input[name='password']").val();
	
	if(isp){
            
        var pw = $("input[name='password']").val();
        if(pw == ""){
        	alert("비밀글로 할경우 비밀번호를 입력해야 합니다.");
        	return false;
        }
    }
	
	
	$("#description").val($("#description").val().replace(/\n/g, "<br>"));
		
	$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/front/community/story/save.do'/>",
			data : $("form").serialize(),
			success : function(data){
				if(data.result == "success"){
					location.href="<c:url value='/front/community/story/story_list.do'/>";
				}else{
					alert("저장된 데이터가 없습니다.");
				}
			},
			error : function(request,status,error) {
				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
}	

$(window).load( function() {
	$("input[name='password']").val("");
    $("input[name='password']").attr("readonly",true);
    $("input[name='password']").attr("disabled",true);
    
    
	$("input[name='is_password']").change(function(){
	    var isChk = false;
		if(this.checked){
	        isChk = "체크박스 체크했음!";
	        
	        //$("input[name='password']").prop('disabled',false);
	        $("input[name='password']").attr("readonly",false);
	        $("input[name='password']").attr("disabled",false);

	    }else{
	    	//$("input[name='password']").prop('disabled',true);
	        $("input[name='password']").attr("readonly",true);
	        $("input[name='password']").attr("disabled",true);
	    	
	        isChk = "체크박스 체크 해제!";

	    }
	});
});
		
</script>


	<div class="content_right" style="display:block">
		<h3>이야기방</h3>	
		<form>
		
			<input type="hidden" name="cont_uuid" value="${vo.cont_uuid}">
			<input type="hidden" name="type" value="S">
		
		
			<table class="table_02">
				<colgroup>
					<col width="25%;">
					<col width="75%;">
				</colgroup>
				<tbody>
					<tr>
						<th>제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
						<td colspan=3 class="left">
							<input type="text" name="title" id="title" value="${vo.title }" style="width:100%;">
						</td>
					</tr>
					
					<tr>
						<th>작&nbsp;성&nbsp;자</th>
						<td colspan=3 class="left">
							<input type="text" name="member_id" id="member_id" style="width:50%;" value="${member_id }" readonly>
						</td>
					</tr>
					
					<tr>
						<th>비밀번호</th>
						<td colspan=3 class="left">
							<input type="password" name="password" style="width:50%;" >
							<br />
							<input type="checkbox" name="is_password" value="Y" <c:if test="${vo.is_password eq 'Y'}">checked</c:if>/> 체크시 비밀글로 등록
						</td>
					</tr>
					<tr>
						<th>내&nbsp;&nbsp;&nbsp;&nbsp;용</th>
						<td colspan=3 class="left editor1">
							<textarea style="width:100%;" rows="5" id="description"name="description">${vo.description}</textarea>
						</td>
					</tr>

				</tbody>
			</table>
		</form>
		
		<div style="text-align:right;margin-top:20px;">
			<button type="button" class="btn btn-primary button_blue button_white" onclick="onSave()">등록</button>
			<button type="button" class="btn btn-default button_blue button_white" onclick="location.href='<c:url value='story_list.do'/>'">취소</button>
		</div>
		
		<div class="clearfix divider_dashed7"></div>
	</div>


<c:if test="${!empty vo.description }">



	<script>
	
	$(document).ready(function() {
		//document.getElementById('bbs_cont').onkeyup();
		//document.getElementById('bbs_dsc').onkeyup();
		$("#description").val($("#description").val().replace(/<br>/g, "\r\n"));
			    
	});
	
	</script>

</c:if>
