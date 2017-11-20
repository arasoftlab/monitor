<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
function fnSearch(){
	$("form").attr("action","view.do").submit();
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

</script>

<button id="btn_go" type="button" class="modal_btn" data-toggle="modal" data-target=".member_modal"></button>

<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
			<label class="information">√ 탈퇴경로 : 직접(회원이 직접 탈퇴) / 관리자(관리자가 탈퇴처리) / 서울시(서울시 통합회원 탈퇴)</label><br><br>
				<div id="search-box1" class="col-lg-12" style="padding:0;">
					<form class="pull-left;">
						<select class="list_form" name="poll_num" style="display: inline;">
							<option value="" <c:if test="${empty vo.poll_num  }">selected</c:if> >기수(전체)</option>
							<c:forEach begin="18" end="${a_vo.poll_num}" var="pollNum">
								<option value="${pollNum }" <c:if test="${vo.poll_num eq pollNum }">selected</c:if>>${pollNum }기</option>
							</c:forEach>							

						</select>
						<select class="list_form" name="searchCategory" style="display: inline;">
							<!-- option value="" <c:if test="${empty vo.searchCategory  }">selected</c:if> >회원 전체</option -->
							<option value="M001_NM" <c:if test="${vo.searchCategory  eq 'M001_NM'}">selected</c:if> >이름</option>
							<option value="id" <c:if test="${vo.searchCategory  eq 'id'}">selected</c:if> >아이디</option>
							<option value="M001_PHONE" <c:if test="${vo.searchCategory  eq 'M001_PHONE'}">selected</c:if> >연락처</option>							
						</select>
						<input type="text" class="list_form" name="searchText" value="${vo.searchText }" style="display: inline; width:200px;">
						<input type="button" id="search-button1" value="검색" onclick="fnSearch();">
					</form>
					
				</div>
				
				<table class="table table-bordered table-striped table2 modal_table">
					<colgroup>
						<col width="5%;">
						<col width="10%;">
						<col width="7%;" >
						<col width="5%;">
						<col width="10%;">
						<col width="7%;">
						<col width="7%;">
						<col width="8%;">
						<col width="*;">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>기수</th>
							<th>탈퇴일자</th>
							<th>신청횟수</th>
							<th>선정횟수</th>
							<th>탈퇴경로</th>
							<th>탈퇴사유</th>
						</tr>
					</thead>
					<tbody>
					
					
					<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">
									<tr>
										<td>${item.rn }</td>
										<td class="text-left">
											<!-- a href="javascript:view_team('${item.id }','${item.poll_num }');" style="font-weight: bold;" --> 
												${item.id }
											<!-- /a -->
										</td>
										<td>
											${item.name }
										</td>
										<td>${item.poll_num }</td>
										<td><fmt:formatDate value="${item.secession_date }" pattern="yyyy/MM/dd" /></td>
										<td>${item.apply_cnt }</td>
										<td>${item.selection_cnt }</td>
										<td></td>
										<td style="text-align:left;">${item.secession_disc }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="9">조회되는 회원이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>

					</tbody>
					
				</table>
				
				
				<div class="col-lg-12">
					<div class="col-lg-4 pull-left"></div>
					<div class="col-lg-6 center"><jsp:include page="/WEB-INF/inc/paging.jsp"></jsp:include></div>				
				</div>
				
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
				      <div class="modal-footer">
						<button type="button" class="btn btn-theme modal_btn" data-toggle="modal" data-target=".subject_list">신청 및 참여과제리스트</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
				
			</div>
		</div>
	</div>
</section>