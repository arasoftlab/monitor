<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.modal { display:none;} 
</style>

<script>
function view_team(subject_id)
{
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/subject/applicant/team_view.do'/>",
		data : {"subject_id" : subject_id},
		success : function(data){
			//alert(data);
			$("#modal-body_team").html(data);
			//fnBtnView("Q");			
			$("#btn_go").trigger('click');
			//$("#member_join").modal('show');
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

function view_member(id,poll_num)
{	
	$.ajax({
		async : true,
		type : "POST",
		url : "/monitor/admin/monitor/member_view.do",
		data : {
			"id" : id,
			"poll_num" : poll_num
			},
		success : function(data){
			//console.log(data);
			$("#modal-body_team_info").html(data);
			//fnBtnView("Q");			
			$("#btn_memberinfo").trigger('click');
			//$("#member_join_info").modal('show');
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}


function view_team_info_pop(id,poll_num)
{	
	var lsize = (screen.availWidth-1020)/2;
	var topsize = (screen.availHeight-640)/2;
	var popUrl = "/monitor/admin/monitor/info.do?member_id="+id+"&poll_num="+poll_num;	//팝업창에 출력될 페이지 URL
	var popOption = "left="+lsize+",top="+topsize+" , width=1020px,height=640px, resizable=no, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);	
	console.log(popUrl);
}

</script>

<button id="btn_memberinfo" type="button" class="modal_btn" data-toggle="modal" data-target="#member_join_info" style="display:none;"></button>

<!-- 모달 팝업 1 회원정보-->

<!-- 모달 팝업 2 신청 및 참여과제 리스트-->
<div class="modal fade subject_list" id="subject_list" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
	
      </div>
      <div class="modal-body">
		<h5>신청 및 침여과제 리스트</h5>
		<label class="pull-right">총 응모횟수 <b class="modal_b">4회</b> / 총 선정횟수 <b class="modal_b">3회</b>/ 미응답 <b class="modal_b">1회</b></label>
		<table class="table table-bordered table-striped table2 modal_table">
			<colgroup>
				<col width="10%;">
				<col width="*;">
				<col width="20%;" >
				<col width="20%;">
			</colgroup>
			<thead>
				<tr>
					<th>No.</th>
					<th>과제명</th>
					<th>선정</th>
					<th>과제</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>1번과제</td>
					<td>O</td>
					<td>완료</td>
				</tr>
				<tr>
					<td>2</td>
					<td>2번과제</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>3</td>
					<td>3번과제</td>
					<td>O</td>
					<td>미완료</td>
				</tr>
				<tr>
					<td>4</td>
					<td>4번과제</td>
					<td>O</td>
					<td>완료</td>
				</tr>
			</tbody>
			
		</table>
	
      </div>
      <div class="modal-footer">
		<jsp:include page="/WEB-INF/inc/paging.jsp"></jsp:include>
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>





<!-- 모달 팝업 회원정보 -->
<div class="modal fade memberinfo" id="member_join_info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">회원정보</h4>
      </div>
      <div class="modal-body" id="modal-body_team_info">

      </div>

    </div>
  </div>
</div>		

