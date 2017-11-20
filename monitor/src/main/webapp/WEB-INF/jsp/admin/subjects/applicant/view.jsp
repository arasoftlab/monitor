<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
function fnSearch(){
	$("form").attr("action","view.do").submit();
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
function fnPresent(){
	location.href="present.do";
}


function onExcel(){	
	location.href="/monitor/admin/ex/excel_transform_controller.do?target=applicant&subject_id=${vo.subject_id}";
}

function onExcel_apply(){	
	location.href="/monitor/admin/ex/excel_transform_controller.do?target=applicant_apply&subject_id=${vo.subject_id}";
}

function onApply( is_select )
{
	var index = 0;
	
	var checkboxValues = [];
	$("input[name='chk']:checked").each(function(i) {
	    checkboxValues.push($(this).val());
	    index ++;
	});
	
	if (index <= 0)
	{
		alert("하나 이상 신청자를 선택해야합니다.");
		return false;
	}
	
	var allData = {
			"select_arr" : checkboxValues ,
			"is_select" :	is_select	
	};
		
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/subject/applicant/apply.do'/>",
		data : allData,
		success : function(data){
			if (data.result=="success")
			{
				alert("변경되었습니다.");
				window.location.reload();
			}
			
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

function view_team(subject_id)
{
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/subject/applicant/team_view.do'/>",
		data : {"subject_id" : subject_id},
		success : function(data){

			$("#modal-body_team").html(data);
			//fnBtnView("Q");			
			$("#btn_go").trigger('click');
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

			$("#modal-body_team_info").html(data);
			//fnBtnView("Q");			
			$("#btn_memberinfo").trigger('click');
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}


function view_team_info_pop(id,poll_num)
{	
	var popUrl = "/monitor/admin/monitor/info.do?member_id="+id+"&poll_num="+poll_num;	//팝업창에 출력될 페이지 URL
	var popOption = "left="+(screen.availWidth-1020)/2+",top="+(screen.availHeight-640)/2+" , width=1020px,height=640px, resizable=no, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);		
	/*
	$.ajax({
		async : true,
		type : "POST",
		url : "info.do",
		data : {
			"id" : id,
			"poll_num" : poll_num
			},
		success : function(data){

			$("#modal-body_monitor").html(data);
			$("#btn_go_info").trigger('click');
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});*/
}

</script>

<button id="btn_memberinfo" type="button" class="modal_btn" data-toggle="modal" data-target=".memberinfo"></button>									

<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="col-lg-12">
					<h4 style="float:left; margin-right:10px;">${vo.title} &nbsp;&nbsp;&nbsp; <font color="blue">▷ 총 ${total_cnt}명</font></h4>
				</div>
				
				
				
				<div id="search-box1" class="col-lg-7" style="padding:0;">
					<form class="pull-left;">

						<input type="hidden" name="subject_id" value="${vo.subject_id}">

						<select class="list_form" name="team_num" style="display: inline;">
							<option value="" >조 선택</option>
							  <c:forEach begin="1" end="${vo.team_cnt }" var="team_n">
  								<option value="${team_n }" >${team_n }</option>
							  </c:forEach>
						</select>
						<select class="list_form" name="is_selection" style="display: inline;">
							<option value="" >선정여부</option>
							<option value="Y" >YES</option>
							<option value="N" >NO</option>
						</select>
						<select class="list_form" name="searchCategory" style="display: inline;">
							<!-- option value="" >전체</option -->
							<option value="member_name" >이름</option>
							<option value="member_id" >아이디</option>
							<option value="phone" >연락처</option>
						</select>
						<input type="text" class="list_form" name="searchText" value="${vo.searchText }" style="display: inline; width:100px;">
						<input type="button" id="search-button1" value="검색" onclick="fnSearch();">
					</form>
					
				</div>
				
				<div class="col-lg-5 pull-right" style="padding:0; text-align:right">

					<button id="btn_go" type="button" class="modal_btn" data-toggle="modal" data-target=".present"></button>									

					<button class="btn btn-theme  " onclick="view_team('${vo.subject_id}')">신청,선정 현황</button>
					<button class="btn btn-theme  " onclick="onExcel()">신청자 목록 다운</button>
					<button class="btn btn-theme  " onclick="onExcel_apply()">선정 결과 다운</button>
				</div>
				
				<table class="table table-bordered table-striped modal_table" style="margin-top:8%;font-size:12px">
					<colgroup>
						<col width="3%;">
						<col width="4%">
						<col width="5%;">
						<col width="8%;">
                                                <col width="8%;">
						<col width="7%;">
						<col width="7%;">						
						<col width="4%;">
						<col width="14%;">
						<col width="*;">
						<col width="5%;">
						<col width="4%;">
						<col width="4%;">
						<col width="5%;">
						<col width="4%">
						
					</colgroup>
					<thead>
						<tr>
							<th style="vertical-align: middle;"><input type="checkbox" id="checkall"> </th>
							<th style="vertical-align: middle;">번호</th>
							<th style="vertical-align: middle;">신청일</th>
							<th style="vertical-align: middle;">이름</th>
                                                        <th style="vertical-align: middle;">아이디</th>
							<th style="vertical-align: middle;">생년월일</th>
							<th style="vertical-align: middle;">직업</th>
							<th style="vertical-align: middle;">기수</th>
							<th style="vertical-align: middle;">주소</th>
							<th style="vertical-align: middle;">기타사항</th>
							<th style="vertical-align: middle;">신청조</th>
							<th>응모횟수</th>
							<th>선정횟수</th>
							<th style="vertical-align: middle;">미응답</th>
							<th>선정여부</th>
						</tr>
					</thead>
					<tbody>
					
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">
									<tr>
										<td><input type="checkbox" name="chk" value="${item.idx}"></td>
										<td>${item.rn }</td>
										<td><fmt:formatDate value="${item.regdate}" pattern="MM/dd" /> </td>
										<td>
											<a href="javascript:view_member('${item.member_id }','${item.poll_num }');" style="font-weight: bold;">	${item.member_name }</a>
										</td>
										<td>
											<a href="javascript:view_member('${item.member_id }','${item.poll_num }');" style="font-weight: bold;"> ${item.member_id }</a>
										</td>
										<td>${fn:substring(item.birth,0,8) }</td>																				
										<td>${item.job }</td>																				
										<td>${item.poll_num }</td>
										<td>${item.sido } ${item.gugun } ${item.dong }</td>
										<td style="text-align:left;margin-left:5px;">${item.description }</td>
										<td>${item.team_num }</td>										
										<td>${item.apply_cnt }</td>
										<td>${item.selected_cnt }</td>
										<td>
											<c:choose>
												<c:when test="${!empty item.tmp_sum1 }">
												${item.tmp_sum1 }
												</c:when>
												
												<c:otherwise>
												0
												</c:otherwise>
											</c:choose>

										</td>
										<td>
											<c:if test="${item.is_selection eq 'Y'}">
												<img src="/monitor/img/Check-icon.png" style="width: 15px;">
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="14">등록된 글이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
					
				</table>




				
				<!-- 모달 팝업 1 회원정보-->
				<div class="modal fade member_modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				      <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">회원정보</h4>
				      </div>
				      <div class="modal-body">
						<h5>서울시 회원정보</h5>
						<table class="table table-bordered table-margin">
							<tbody>
								<tr>
									<td class="td1">이름</td>
									<td class="left"> 홍길동(남자)</td>
									<td class="td1">아이디</td>
									<td class="left">honggildong</td>
								</tr>
								<tr>
									<td class="td1">생년월일</td>
									<td class="left">2000/12/31</td>
									<td class="td1">직업</td>
									<td class="left">자영업</td>
								</tr>
								<tr>
									<td class="td1">연락처</td>
									<td class="left">010-1111-1123</td>
									<td class="td1">이메일</td>
									<td class="left">aaa@aaa.com</td>
								</tr>
								<tr>
									<td class="td1">거주지</td>
									<td colspan="3" class="left">서울시 종로구 동숭동</td>
								</tr>
								<tr>
									<td class="td1">가입일자</td>
									<td class="left">2014/05/17</td>
									<td class="td1">수정일자</td>
									<td class="left">2016/08/23</td>
								</tr>
							</tbody>
						</table>
				      </div>
				      <div class="modal-footer">
						<button type="button" class="btn btn-theme modal_btn" data-toggle="modal" data-target=".subject_list">신청 및 참여과제리스트</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				
				<!-- 모달 팝업 2 신청 및 참여과제 리스트-->
				<div class="modal fade subject_list" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
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
				
				
				<!-- 모달 팝업 3 신청,선정 현황-->
				<div class="modal fade present" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				      <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">모니터 신청 현황 및 선정 결과보기</h4>
				      </div>
				      <div class="modal-body" id="modal-body_team">

				      </div>
				      
				      
				      <div class="modal-footer">
				      	<div class="col-lg-12" style="text-align:left;">
				      		<i class="fa fa-users" aria-hidden="true"></i> 모집인원 : (${vo.team_cnt})개 조 (${vo.men_total})명<br/>
				      		<i class="fa fa-users" aria-hidden="true"></i> 신청인원 : (${vo.team_cnt})개 조 (${apply_total})명
				      	</div>
				      	<div class="col-lg-12">
				      		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      	</div>
						
				      </div>
				    </div>
				  </div>
				</div>
				
				<!-- 모달 팝업 회원정보 -->
				<div class="modal fade memberinfo" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
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
				
				
				<div class="col-md-6">
						<button class="btn btn-theme  " onclick="onApply('Y')">선정</button>
						<button class="btn btn-theme  " onclick="onApply('N')">X 선정 취소</button>
				</div>
				
				<div class="col-lg-12">
					<div class="col-lg-4">
						<div  class="col-md-5 pull-left"  style="margin-right:10px;margin-top:10px;">
							<select class="list_form" name="team_num" style="display: inline;">
								<option value="" >조 선택</option>
								<option value="D" ></option>
								<option value="Z" ></option>
							</select>
						</div>
						<div class="col-md-6">
							<button class="btn btn-theme  " onclick="onApply('Y')">변경</button>
						</div>
					</div>
					<div class="col-lg-8"></div>
				</div>
				
			</div>
		</div>
	</div>
</section>
