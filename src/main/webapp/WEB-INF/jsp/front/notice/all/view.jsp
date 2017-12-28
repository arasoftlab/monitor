<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/jf-taglib.tld" prefix="j"%> 

<style>
.modal{text-align:center;padding:0 !important; z-index:100000; }
.modal:before{content:'';display:inline-block;height:100%;vertical-align:middle;margin-right:-4px;}
.modal-dialog{display:inline-block;text-align:left;vertical-align:middle;}
.modal-backdrop { z-index:99999;} 
</style>
<script>

	
	function onCancel(idx)
	{
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/front/notice/all/delete.do'/>",
			data : {"idx" : idx},
			success : function(data){
				
				if(data.result == "success")
				{
					alert("취소되었습니다.")
				}
				window.location.href = '<c:url value="/front/notice/subject/view.do?notice_id=${vo.notice_id}" />';
			},
			error : function(request,status,error) {
				////console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
	}
	
	function fnShowImg(img){
		
		var $modal = $('#modalImage');

		var $fimg = $("#modal-img");
		$fimg.attr('src',"/monitor"+img);
		$fimg.addClass("img-responsive");
		$fimg.addClass("img-thumbnail");
		$fimg.addClass("center-block");
		$fimg.css("padding", "5px");
		$modal.modal('show');
	}
	
	function isEmpty(el){
	    return ( el == null  || el == "" ) ? true : false;
	}
	
	function fnFileDown(fileId, url){
		
		var frm = document.fileDown;	
		
		if (isEmpty(frm)){
			var divObj = document.createElement("div");
			var innerStr = "<form id='fileDown' method='post' name='fileDown' action='"+url+"'>";
			innerStr += "<input type='hidden' name='file_id' />";
			innerStr += "</form>";
			divObj.innerHTML = innerStr;
			document.body.appendChild(divObj);
		}

		document.fileDown.file_id.value=fileId;
		document.fileDown.submit();
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
				//$("#btn_applys").trigger('click');
				var $modal = $('.modalMonitor');
				//$modal.css("display:block;");
				$modal.modal('show');
			},
			error : function(request,status,error) {
				alert("데이터 전송중 오류가 발생했습니다. \n잠시후 다시 시도해 주세요.");
			}
		});
	}	
	
	
</script>
<style>
	.btn{font-size:12px;}
</style>
<!-- 서브 콘텐츠 -->
	<div class="content_right" style="display:block">
  <h3>공지사항</h3>
		<jsp:include page="/WEB-INF/jsp/front/inc/notice_view_mobile.jsp"></jsp:include>

		<table class="pc_notice_table" style="width:100%;background:#fff;border:0;padding:0;border-spacing:0;">
			<tr>
				<td>
				<!-- //카테고리 -->
					<table class="table_02" style="padding:0;border-spacing:0;">
						<colgroup>
							<col width="20%;">
							<col width="35%;">
							<col width="15%;">
							<col width="30%;">
						</colgroup>
						<tr align="center">
							<th>공지제목</th>
							<td colspan="3"><b>${vo.title }</b></td>
						</tr>
						<tr align="center">
							<th>등&nbsp;록&nbsp;일</th>
							<td><fmt:formatDate value="${vo.regDate }" pattern="yyyy/MM/dd HH:mm:ss" /></td>
							<th>조&nbsp;회&nbsp;수</th>
							<td>${vo.hits }</td>
						</tr>
						<tr align="center">
							<th>공지종류</th>
							<td>
								<c:if test="${vo.type eq 'F'}">현장과제(참여모집 공고)</c:if>
								<c:if test="${vo.type eq 'V'}">설문과제(지정과제)</c:if>
								<c:if test="${vo.type eq 'S'}">단순, 일반공지</c:if>
								<c:if test="${vo.type eq 'Q'}">FAQ</c:if>
								<!-- ex :현장과제(참여모집 공고)  -->
							</td>
							<th>상태</th>
							<td>
								<c:if test="${vo.type eq 'S'}">-</c:if>
								<!-- ex :모집중  -->
								<c:choose>
									<c:when test="${vo.subjectVO.status eq '01' }">준비중</c:when>
									<c:when test="${vo.subjectVO.status eq '02' }">모집중</c:when>
									<c:when test="${vo.subjectVO.status eq '03' }">모집마감</c:when>
									<c:when test="${vo.subjectVO.status eq '04' }">과제진행</c:when>
									<c:when test="${vo.subjectVO.status eq '05' }">과제마감</c:when>
									<c:when test="${vo.subjectVO.status eq '06' }">정산중</c:when>
									<c:when test="${vo.subjectVO.status eq '07' }">정산완료</c:when>
								</c:choose>										
							</td>
						</tr>
						<c:if test="${vo.type eq 'F' || vo.type eq 'V'}">
							<tr align="center">
								<th>참여 신청 기간</th>
								<td>
                 <span style="color:#4374D9; font-weight: bold;">								
									<fmt:formatDate value='${vo.subjectVO.apply_s_date }' pattern='yyyy/MM/dd' />~
									<fmt:formatDate value='${vo.subjectVO.apply_e_date }' pattern='yyyy/MM/dd' />
   							 </span>									
								</td>
								<th>과제 제출기간</th>
								<td>
									<fmt:formatDate value='${vo.subjectVO.submit_s_date }' pattern='yyyy/MM/dd' />~
									<fmt:formatDate value='${vo.subjectVO.submit_e_date }' pattern='yyyy/MM/dd' />
								</td>
						</tr>
						</c:if>
						<tr>
							<th colspan="4" style="padding-top:10px; padding-bottom:5px;">공&nbsp;&nbsp;지&nbsp;&nbsp;내&nbsp;&nbsp;용</th>
						</tr>
						<tr>
							<td colspan="4">
								<!--  공지내용 전체표시(스크롤 없음)-->		
								<div style="margin-left:20px; margin-right:20px; margin-top:20px; margin-bottom:20px;">															
									${j:restorestripTags(vo.description)}
                				</div>
							</td>
						</tr>

						<c:choose>
							<c:when test="${!empty vo.fileList }">
								<tr>
									<th style="vertical-align: middle;">첨부이미지</th>
									<td colspan="3">
										<c:forEach var="file" items="${vo.fileList }" varStatus="i">
											<c:choose>
												<c:when test="${fn:split(file.fileType, '/')[0] eq 'image'}">	
													<div class="thumbs" style="float:left">
														<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" onclick="fnShowImg('${file.savePath }/${file.unqFileName }');" />
													</div>
												</c:when>
	
												<c:otherwise>
													<!--
															txt 등의 파일   														
															<i class="fa fa-file-text fa-5x"></i>
															-->
												</c:otherwise>
	
											</c:choose>
	
										</c:forEach>
										
									</td>
								</tr>	
							</c:when>
							<c:otherwise>
									<tr>
									<th>첨부이미지</th>
										<td colspan="3">첨부파일이 없습니다.</td>
									</tr>
							</c:otherwise>
						</c:choose>

						<!--  썸네일 이미지 클릭시 확대 -->
						
						<c:set var="cnt" value="0" />
						<c:set var="cont_sum" value="${cnt}" />
							
						<c:if test="${!empty vo.fileList }">
							<c:forEach var="file" items="${vo.fileList }" varStatus="z">
								<c:if test="${fn:split(file.fileType, '/')[0] ne 'image'}">
									<c:set var="cont_sum" value="${cont_sum+1}" />
									<tr>
										<th>첨부파일${cont_sum}</th>
										<td colspan="3">
											<span><a href="javascript:fnFileDown('${file.file_id }','<c:url value='/file/fileDown.do'/>');">${file.orgFileName }</a></span>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</c:if>
					</table>

					<!-- //검색 -->
				</td>
			</tr>
		</table>
		<!-- 게시판 끝 -->
		<div style="text-align:right;margin-top:20px;">
			<c:choose>
				<c:when test="${!empty vo.subjectVO }">
					<c:if test="${!empty member_id && member_poll eq now_poll}">		
					
						<c:if test="${vo.subjectVO.status eq '02'}">		
							<button type="button" class="btn btn-primary" onclick="view_team('${vo.subject_id}')">현장모니터 신청 현황</button>
							
							<c:if test="${empty m_vo }">				
								<button type="button" class="btn btn-primary" onclick="location.href='<c:url value='modify.do?notice_id=${vo.notice_id }'/>'">참여신청</button>
							</c:if>			
							<c:if test="${!empty m_vo }">
								<button type="button" class="btn btn-info" onclick="location.href='<c:url value='modify.do?notice_id=${vo.notice_id }'/>'">조 수정</button>
								<button type="button" class="btn btn-warning" onclick="onCancel('${m_vo.idx}')">신청 취소</button>
							</c:if>
						</c:if>
					</c:if>	
				</c:when>
			</c:choose>
			
			<button type="button" class="btn btn-primary button_blue button_white" onclick="location.href='<c:url value='list.do?stype=${vo.stype }'/>'">목록</button>
		</div>
			
		<div class="modal animated " id="modalImage" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<img id="modal-img" src="#" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
								
													
		<!-- --------현장모니터 신청 현황 -->
		<div class="modal animated modalMonitor" id="modalMonitor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		  <div class="modal-dialog ">
		    <div class="modal-content">
		      <div class="modal-body" style="padding:10px;">
   				<h5 style="font-weight: bold;">현장 모니터 신청 현황</h5>
   				
						
									<table class="table_02 notice_pop" style="text-align:center;">
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
				
				<div id="modal-body_team" style="display: table;"></div>
				<div class="bottom-data" style="border-top: 2px #4fb3d2 solid; display: table; width:100%;">
					<div class="col-md-6" style="float:left;width:100%; margin-top:10px;">
						모집인원 : ${vo.subjectVO.team_cnt}개조 ${vo.subjectVO.men_total}명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						신청인원 : 총 ${apply_total}명
					</div>
				</div>				

		      </div>
		    </div>     
		      <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" style="margin-top:4px;">Close</button>
		      </div>
		  </div>
		</div>

		

		<div class="clearfix divider_dashed7"></div>
 
	</div>

