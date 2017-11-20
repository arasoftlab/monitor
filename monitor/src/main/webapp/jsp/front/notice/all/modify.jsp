
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>

	function checkLength(comment) {
	    if (comment.value.length > 70 ) {
	        comment.blur();
	        comment.value = comment.value.substring(0,70);
	        alert('70자까지만 기재 가능합니다');
	        comment.focus();
	        return false;
	    }
	}


	function fnShowImg(){
		$('.showImg').modal('show');
	}
	
	function onDelte()
	{
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/front/notice/all/delete.do'/>",
			data : $("#web").serialize(),
			success : function(data){
				
				if(data.result == "success")
				{
					alert("취소되었습니다.")
				}
				window.location.href = '<c:url value="/front/notice/all/view.do?notice_id=${vo.notice_id}" />';
			},
			error : function(request,status,error) {
				////console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
	}
	
	
	function onTempChk_W(location)
	{
		var team_chk = document.web.team_num.value;
						
		if (team_chk == "")
		{
			alert("조를 신청해 주시기바랍니다.");
			
			return false;
		}
		
		if (location == "U") {
			$.ajax({
				async : true,
				type : "POST",
				url : "<c:url value='/front/notice/all/update.do'/>",
				data : $("#web").serialize(),
				success : function(data){
					
					if(data.result == "success")
					{
						alert("수정되었습니다.")
					}
					window.location.href = '<c:url value="/front/notice/all/view.do?notice_id=${vo.notice_id}" />';
				},
				error : function(request,status,error) {
					////console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					alert("error!!");
				}
			});	
		}else{
			$.ajax({
				async : true,
				type : "POST",
				url : "<c:url value='/front/notice/all/apply.do'/>",
				data : $("#web").serialize(),
				success : function(data){

					if(data.result == "success")
					{
						alert("신청되었습니다.")
					}
					
					window.location.href = '<c:url value="/front/notice/all/view.do?notice_id=${vo.notice_id}" />'
				},
				error : function(request,status,error) {
					////console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					alert("error!!");
				}
			});	
		}
	}

	function onTempChk_M(location)
	{
		var team_chk = document.mobile.team_num.value;
		
		if (team_chk == "")
		{
			alert("조를 신청해 주시기바랍니다.");
			
			return false;
		}
		
		if (location == "U") {
			$.ajax({
				async : true,
				type : "POST",
				url : "<c:url value='/front/notice/all/update.do'/>",
				data : $("#mobile").serialize(),
				success : function(data){
					
					if(data.result == "success")
					{
						alert("수정되었습니다.")
					}
					window.location.href = '<c:url value="/front/notice/all/view.do?notice_id=${vo.notice_id}" />';
				},
				error : function(request,status,error) {
					////console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					alert("error!!");
				}
			});	
		}else{
			$.ajax({
				async : true,
				type : "POST",
				url : "<c:url value='/front/notice/all/apply.do'/>",
				data : $("#mobile").serialize(),
				success : function(data){

					if(data.result == "success")
					{
						alert("등록되었습니다.")
					}
					
					window.location.href = '<c:url value="/front/notice/all/view.do?notice_id=${vo.notice_id}" />'
				},
				error : function(request,status,error) {
					////console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					alert("error!!");
				}
			});	
		}
				
		//location.href='<c:url value='apply.do'/>'				
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
				$("#btn_applys").trigger('click');
			},
			error : function(request,status,error) {
				////console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
	}
	
</script>
<style>
	.btn{font-size:12px;}
	.modify th{
		text-align: center;
   	color: steelblue;
	}
	.modify{padding:0px; width:100%;}
</style>

<form id="web" name="web">
	<input type="hidden" name="subject_id" value="${vo.subjectVO.subject_id}">
	<input type="hidden" name="idx" value="${m_vo.idx}">
<!-- 서브 콘텐츠 -->
	<div class="content_right" style="display:block">
 <h3>현장과제 참여신청</h3>
		<table class="pc_notice_table" style="width:100%;background:#fff;border:0;padding:0;border-spacing:0;">
			<tr>
				<td>
				<!-- PC화면 -->
					<table class="table_02 modify">
						<colgroup>
							<col width="25%;">
							<col width="75%;">
						</colgroup>
						<tr>
							<th colspan="2" style="font-size:18px;padding-bottom:10px;padding-top:10px">${vo.title }</th>
						</tr>
						<tr>
							<td colspan="2">
  						<div style="margin-left:20px; margin-right:20px; margin-top:20px; margin-bottom:20px;">							
							${vo.applyform }</td>
							</div>
						</tr>
						<tr>
							<th>신청조 선택</th>
							<td>
								<select style="width:20%;height:100%;" name="team_num">
									<option value='' >(선택)</option>
									<c:forEach begin="1" end="${vo.subjectVO.team_cnt }" varStatus="i">
										<c:if test="${i.index eq m_vo.team_num}">
											<option value='${i.index}' selected="selected">${i.index} 조</option>	
										</c:if>
										
										<c:if test="${i.index ne m_vo.team_num}">
											<option value='${i.index}' >${i.index} 조</option>
										</c:if>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th colspan="2" style="text-align:left; padding-left:10px; padding-top:10px; padding-bottom:5px;">
							기타 참고할 사항이 있으면 기재해 주세요(개인정보는 기재하실 필요 없습니다) <글자제한 : 70자>
							</th>
						</tr>
						<tr>
							<td colspan="2">
								<textarea style="width:100%;" rows="3" onKeyUp="checkLength(this);" name="description">${m_vo.description}</textarea>
							</td>
						</tr>
					</table>

					<!-- //검색 -->
				</td>
			</tr>
		</table>
		
</form>

<!-- 모바일 -->
<form id="mobile" name="mobile">		
	<input type="hidden" name="subject_id" value="${vo.subjectVO.subject_id}">
	<input type="hidden" name="idx" value="${m_vo.idx}">		
		<table class="mobile_notice_table" style="width:100%;background:#fff;padding:0;border:none;border-spacing:0;">
			<tr>
				<td>
	  
					<table class="table_02 modify">
						<colgroup>
							<col width="50%;">
							<col width="50%;">
						</colgroup>
						<tr>
							<th colspan="2" style="padding-bottom:10px;padding-top:10px">
							${vo.title }
							</th>
						</tr>
						<tr>
							<td colspan="2">
               <div style="margin-left:5px; margin-right:5px; margin-top:10px; margin-bottom:10px;">								
							  ${vo.applyform }
							 </div> 
							</td>
						</tr>
						<tr>
							<th>신청조 선택</th>
							<td>
								<select style="width:100%;height:100%;" name="team_num">
									<option value='' >(선택)</option>
									<c:forEach begin="1" end="${vo.subjectVO.team_cnt }" varStatus="i">
										<c:if test="${i.index eq m_vo.team_num}">
											<option value='${i.index}' selected="selected">${i.index} 조</option>	
										</c:if>
										<c:if test="${i.index ne m_vo.team_num}">
											<option value='${i.index}' >${i.index} 조</option>
										</c:if>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th colspan="2">기타 참고할 사항이 있으면 기재해 주세요(개인정보 기재X, 글자제한:70자)</th>
						</tr>
						<tr>
							<td colspan="2">
								<textarea style="width:100%;" rows="3" onKeyUp="checkLength(this);" name="description"></textarea>
							</td>
						</tr>
					</table>

					<!-- //검색 -->
				</td>
			</tr>
		</table>
		
		
		
		
<!-- --------현장모니터 신청 현황 -->
		<div class="modal fade present_apply container" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-body" style="padding:10px;">
   				<h5 style="font-weight: bold;">현장 모니터 신청 현황</h5>
   				
						
									<table class="table_02 notice_pop" style="text-align: center;">
										<tbody>
											<tr>
												<th style="width:20%">아이디</th>
												<th style="width:20%">이름</th>
												<th style="width:20%">신청 조</th>
												<th style="width:20%">신청일</th>
												<th style="width:20%">결과</th>
											</tr>
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }" >
									<c:if test="${member_id eq item.member_id }">
											<tr>
												<td>
													<c:out value="${fn:substring(item.member_id, 0, 3)}" />*****
												</td>
												<td>
													<c:out value="${fn:substring(item.member_name, 0, 1)}" />**
												</td>
												<td>${item.team_num}</td>
												<td><fmt:formatDate value="${item.regdate}" pattern="MM/dd" /></td>
												<td>
													<c:if test="${item.is_selection eq 'Y'}">
														선정
													</c:if>
												</td>
											</tr>
									</c:if>
								</c:forEach>						
							</c:when>
						</c:choose>	
										</tbody>
									</table>

					      
				<h5 style="margin-top:40px;font-weight: bold;">현장 모니터 조별 신청현황</h5>
				<div id="modal-body_team" style="display: table;width:100%"></div>
		      </div>
		    </div>
		      <div class="modal-footer2">
		      	<div class="col-md-6" style="float:left;width:100%; margin-top:10px;">
		      		모집인원 : ${vo.subjectVO.team_cnt}개조 ${vo.subjectVO.men_total}명  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		      		신청인원 : 총 ${apply_total}명
		      	</div>
		      </div>
		     
		      <div class="modal-footer">
				<button type="button" class="btn btn-default btn-primary button_blue button_white" data-dismiss="modal" style="margin-top:4px;">Close</button>
		      </div>
		  </div>
		</div>
		

		<!-- 게시판 끝 MOBILE -->
		<div style="text-align:right;margin-top:20px;width:100%;" class="mobile_notice_table">
			<button type="button" class="btn btn-info button_blue button_white"  onclick="view_team('${vo.subject_id}')">현장모니터 신청 현황</button>
			<button type="button" id="btn_applys" class="btn" data-toggle="modal" data-target=".present_apply" style="display:none;"></button>			

			<c:if test="${empty m_vo }">
				<button type="button" class="btn btn-primary button_blue button_white"  onclick="onTempChk_M('A');">신청</button>
			</c:if>
			<c:if test="${!empty m_vo }">			
				<button type="button" class="btn btn-info button_blue button_white"  onclick="onTempChk_M('U')">수정</button>
				<button type="button" class="btn btn-warning button_blue button_white" onclick="onDelte()" >신청 취소</button>
			</c:if>
			
			<button type="button" class="btn btn-primary button_blue button_white" onclick="location.href='<c:url value='list.do'/>'">목록</button>
		</div>

		<!-- 게시판 끝  WEB -->
		<div class="pc_notice_table" style="text-align:right;margin-top:20px;width:100%;">
			<button type="button" class="btn btn-primary button_blue button_white"  onclick="view_team('${vo.subject_id}')">현장모니터 신청 현황</button>
			<button type="button" id="btn_applys" class="btn" data-toggle="modal" data-target=".present_apply" style="display:none;"></button>			
			<c:if test="${empty m_vo }">
				<button type="button" class="btn btn-primary button_blue button_white"  onclick="onTempChk_W('A')">신청</button>
			</c:if>
			<c:if test="${!empty m_vo }">			
				<button type="button" class="btn btn-info button_blue button_white"  onclick="onTempChk_W('U')">수정</button>
				<button type="button" class="btn btn-warning button_blue button_white" onclick="onDelte()">신청 취소</button>
			</c:if>
			
			<button type="button" class="btn btn-primary button_blue button_white" onclick="location.href='<c:url value='list.do'/>'">목록</button>
		</div>
			
		<div class="clearfix divider_dashed7"></div>
 
	</div>

</form>