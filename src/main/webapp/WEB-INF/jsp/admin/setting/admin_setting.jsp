<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">

$(function(){
	$('input:text[numberOnly]').keypress(function (event) {
		if(event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) {
			event.preventDefault();
	    }
	});
	$(document).on("keyup", "input:text[numberOnly]", function() {
		$(this).val($(this).val().replace(/[^0-9]/gi,""));
	});
	$(document).on("focusout", "input:text[numberOnly]", function() {
		if($(this).val() == "") $(this).val("0");
	});
	$(document).on("focusin", "input:text[numberOnly]", function() {
		if($(this).val() == "0") $(this).val("");
	});
	
	$("input[name='pay_sum']").keyup(function(){
		if(Number($(this).val()) > 0){
			$("input[name='pay_yn'][value='Y']").attr("checked", true);
		}
	});
	
	$(".date").datepicker({
		language: 'kr',
		format:'yyyy/mm/dd',
		todayHighlight: true
	}).on('changeDate', function(e) {
	       return get_url_and_refresh_link();
	});
});

function onApply_admin()
{	
	/*
	if ($("#id").val()=="")
	{
		alert("아이디를 입력하세요");
		return false;
	}	
	
	if ($("#password").val()=="")
	{
		alert("비밀번호를 입력하세요");
		return false;
	}	*/
	
	$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/admin/setting/setting_apply.do'/>",
			data : $("form").serialize(),
			success : function(data){
				if (data.result == "success") 
				{
					alert("수정 되었습니다.")
				}
				
			},
			error : function(request,status,error) {
				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
	});
}


function fnSearch(){
	$("form").attr("action","info.do").submit();
}
$(document).ready(function(){
	

	
	
    //최상단 체크박스 클릭
    $("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=chk]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=chk]").prop("checked",false);
        }
    });
});
</script>

<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12" >
				<form>
					
					<table class="table table-bordered table-margin" style="width:40%;margin: 0 auto;">
						<tbody>
							<tr>
								<td class="td1"> 기수 활동기간 </td>
								<td colspan=3 class="left">
									<div class="radio" style="height:20px;">
										<label class="col-sm-3" style="width:45%"><input type="text"  class="form-control date" id="poll_start_date" value="<fmt:formatDate value="${vo.poll_start_date }" pattern="yyyy/MM/dd" />" name="poll_start_date"/></label>
										<label class="col-sm-1">&nbsp;&nbsp;&nbsp;~</label>
										<label class="col-sm-3" style="width:45%"><input type="text" class="form-control date" id="poll_end_date" value="<fmt:formatDate value="${vo.poll_end_date }" pattern="yyyy/MM/dd" />" name="poll_end_date"/></label>
									</div> 
								</td>
							</tr>
							
							<tr>
								<td class="td1">기수</td>
								<td colspan=3 class="left">
									<div class="radio" style="height:20px;">
										<label><input type="text" value="${vo.poll_num }" style="width: 90%; margin-top: -10px;" name="poll_num" id="poll_num" class="text-right" numberonly="true" >&nbsp;&nbsp;기</label>
									</div>
								</td>
							</tr>
							
						</tbody>
					</table>
				</form>
				
				
			</div>
			
					<div class="col-lg-3 pull-right right"  style=" text-align: center;  width: 64%; margin-top: 15px;">
						<button class="btn btn-theme " onclick="onApply_admin();">저장</button>
					</div>
			
		</div>
	</div>
	</section>
