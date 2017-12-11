<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
function fnSearch(){
	$("form").attr("action","list.do").submit();
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

function onGradeApply()
{
	var index = 0;
	
	var grade = $("#grade_chn").val();
	
	var checkboxValues = [];
	$("input[name='chk']:checked").each(function(i) {
	    checkboxValues.push($(this).val());
	    index ++;
	});
	
	if (index <= 0)
	{
		alert("하나 이상 회원을 선택해야합니다.");
		return false;
	}
	
	if (grade =="N")
	{
		alert("변경 등급을 선택해주세요.");	
		return false;
	}
	
	var allData = {
			"select_arr" : checkboxValues ,
			"grade" : grade	
	};
		
	$.ajax({
		async : true,
		type : "POST",
		url : "grade_apply.do",
		data : allData,
		success : function(data){
			if (data.result=="success")
			{
				alert("변경 되었습니다.");
				window.location.reload();
			}
			
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}




function onApply()
{
	var index = 0;
	
	var secession_disc = $("#secession_disc").val();
	
	var checkboxValues = [];
	$("input[name='chk']:checked").each(function(i) {
	    checkboxValues.push($(this).val());
	    index ++;
	});
	
	if (index <= 0)
	{
		alert("하나 이상 회원을 선택해야합니다.");
		return false;
	}
	
	if (secession_disc =="")
	{
		alert("탈퇴사유를 기입해 주세요.");	
		return false;
	}
	
	var allData = {
			"select_arr" : checkboxValues ,
			"secession_disc" : secession_disc	
	};
		
	$.ajax({
		async : true,
		type : "POST",
		url : "apply.do",
		data : allData,
		success : function(data){
			if (data.result=="success")
			{
				alert("탈퇴처리 되었습니다.");
				window.location.reload();
			}
			
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

function view_team(id,poll_num)
{	
	$.ajax({
		async : true,
		type : "POST",
		url : "member_view.do",
		data : {
			"id" : id,
			"poll_num" : poll_num
			},
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

function view_team_info_pop(id,poll_num)
{	
	var popUrl = "/monitor/admin/monitor/info.do?member_id="+id+"&poll_num="+poll_num;	//팝업창에 출력될 페이지 URL
	var popOption = "left="+(screen.availWidth-1020)/2
		+ ",top="+(screen.availHeight-640)/2
		+ " , width=1020px,height=640px, resizable=no, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)
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

function save_memo(id){
	var memo = $("input[name='memo']").val();
	alert(memo);
	$.ajax({
		type:"POST",
		url:"memo.do",
		data:{
			"id" : id,
			"memo" : memo
		},
		success : function(data){
			alert("메모가 저장되었습니다.");
		},
		error: function(request, status, error){
			alert("메모가 저장되지 않았습니다.");
		}
		
	});
}

function onViewEnter()
{
	location.href = "view.do";
}

</script>

<button id="btn_go" type="button" class="modal_btn" data-toggle="modal" data-target=".member_modal"></button>									
<button id="btn_go_info" type="button" class="modal_btn" data-toggle="modal" data-target=".subject_list"></button>									

<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<label class="information">√ 연락처 등의 개인정보는 회원이 직접 사이트에 로그인 해서 서울시 통합회원 정보를 수정해야 함. 관리자가 수정 불가</label>
				<!-- h5>총 ${sido_cnt}명 (탈퇴자까지 포함된 숫자. 단순참고용. 실제 숫자는 엑셀자료로 확인!)</h5 -->
  			<h5>18기부터 있음. 기수별 실가입자수는 엑셀자료를 다운받아 확인!</h5>
				<!--				
				<p>가정주부 267명/대학생 253명/회사원 209명/전문,자유직 180명/자영업 85명/무직 79명/교육직 53명/공무원 29명/기타 27명</p>
				-->				

				<div id="search-box1" class="col-lg-6" style="padding:0;">
					<form class="pull-left;">
						${vo.poll_num }
						<select class="list_form" name="poll_num" style="display: inline;">
							<option value="" <c:if test="${empty vo.poll_num  }">selected</c:if> >기수(전체)</option>
							<c:forEach begin="18" end="${a_vo.poll_num}" var="pollNum">
								<option value="${pollNum }" <c:if test="${a_vo.poll_num eq pollNum }">selected</c:if>>${pollNum }기</option>
							</c:forEach>							
							
						</select>
						
						<select class="list_form" name="searchCategory" style="display: inline;">
							<!-- option value="" <c:if test="${empty vo.searchCategory  }">selected</c:if> >회원 전체</option -->
							<option value="M001_NM" <c:if test="${vo.searchCategory  eq 'M001_NM'}">selected</c:if> >이름</option>
							<option value="M001_PHONE" <c:if test="${vo.searchCategory  eq 'M001_PHONE'}">selected</c:if> >연락처</option>		
							<option value="id" <c:if test="${vo.searchCategory  eq 'id'}">selected</c:if> >아이디</option>
						</select>
												
						<select class="list_form" name="grade" style="display: inline;">
							<option value="" <c:if test="${empty vo.grade  }">selected</c:if> >전체</option>
							<option value="nomal" <c:if test="${vo.grade eq 'nomal' }">selected</c:if> >정회원</option>
							<option value="apply" <c:if test="${vo.grade eq 'apply' }">selected</c:if> >신청회원</option>
						</select>
						<input type="text" class="list_form" name="searchText" value="${vo.searchText }" style="display: inline; width:150px;">
						<input type="button" id="search-button1" value="검색" onclick="fnSearch();">
					</form>
					
				</div>
				<div style="padding-left:10px;float:left">				
					<button class="btn btn-warning pull-right" onclick="alert('준비중')">1년간 미로그인 회원 검색</button>
				</div>
				
				<div style="padding-left:10px;float:left">
					<button class="btn btn-warning pull-right" onclick="onViewEnter()">탈퇴회원 보기</button>
				</div>
				
				<div style="padding-left:10px;float:right">
					<button class="btn btn-theme  pull-right" onclick="javascript:location.href='/monitor/admin/ex/excel_transform_controller.do?target=memberManager&subject_id='">전체 엑셀로 받기</button>
				</div>
				
				<table class="table table-bordered table-striped modal_table" style="margin-top:5%;">
					<colgroup>
						<col width="3%;">
						<col width="5%;">
						<col width="10%;">
						<col width="7%;">
						<col width="5%;">
						<col width="6%;">
						<col width="10%;">
						<col width="13%;">
						<col width="11%;">
						<col width="9%;">
						<col width="9%;">
						<col width="12%;">
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" id="checkall"></th>
							<th>번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>기수</th>
							<th>등급</th>
							<th>생년월일</th>
							<th>연락처</th>
							<th>가입일자</th>
							<th>신청횟수</th>
							<th>선정횟수</th>
							<th>로그인 일자</th>

						</tr>
					</thead>
					<tbody>

						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">
									<tr>
										<td><input type="checkbox" name="chk" value="${item.id}"></td>
										<td>${item.rn }</td>
										<td class="text-left">
											<a href="javascript:view_team('${item.id }','${item.poll_num }');" style="font-weight: bold;">${item.id }</a>
										</td>
										<td>
											<a href="javascript:view_team('${item.id }','${item.poll_num }');" style="color: blue;font-weight: bold;">${item.name }</a>
										</td>
										<td>${item.poll_num }</td>
										<td>
											<c:if test="${item.grade eq 'nomal'}">정회원</c:if>
										</td>
										<td>
										${fn:substring(item.birthday,0,8)}
										</td>
										<td>${item.phone }</td>
										<td><fmt:formatDate value="${item.regdate }" pattern="yyyy/MM/dd" /></td>
										<td onclick="view_team_info_pop('${item.id}','${item.poll_num}')">
										<span class="text_underline">${item.apply_cnt }</span>
										</td>
										<td onclick="view_team_info_pop('${item.id}','${item.poll_num}')">										
										<span class="text_underline">${item.selection_cnt }</span>
										</td>
										<td><fmt:formatDate value="${item.login_date }" pattern="yyyy/MM/dd" /></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="12">등록된 글이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
					
				</table>
				
				<!-- 모달 팝업 1-->
				<div class="modal fade member_modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				      <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">회원정보</h4>
				      </div>
				      <div class="modal-body" id="modal-body_team">

				      </div>

				    </div>
				  </div>
				</div>
				
				
				<!-- 모달 팝업 2-->
				<div class="modal fade subject_list" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				    	<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					
		      			</div>
		
					    <div class="modal-body" id="modal-body_monitor">
						</div>
		
					    <div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					    </div>
				    </div>
				  </div>
				</div>
				
				<div class="">
					<div class="" style="width: 100%;text-align: right;">
						<div style="width: 50%;float: left;text-align: left;">
							<select class="list_form" id="grade_chn" style="display: inline;width:100px">
								<option value="">선택</option>
								<option value="nomal">정회원</option>
								<option value="noapply">미신청회원</option>
							</select>
							<span><button class="btn btn-theme" onclick="onGradeApply()" style="margin-top: -4px;">등급변경</button></span>
						</div>
						
						<div style="width: 50%;float: left;text-align: right;">
							사유: <input type="text" class="list_form" name="secession_disc" id="secession_disc" value="" style="display: inline; width:200px;">
							<button class="btn btn-theme" onclick="onApply()">탈퇴처리</button>
						</div>
					</div>
					<div class="" style="width: 100%;text-align:center;float:left"><jsp:include page="/WEB-INF/inc/paging.jsp"></jsp:include></div>				
				</div>
				
			</div>
		</div>
	</div>
</section>