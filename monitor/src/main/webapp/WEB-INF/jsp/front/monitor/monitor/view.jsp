
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/jf-taglib.tld" prefix="j"%> 

<script>

secret_chk()

	function isEmpty(el){
	    return ( el == null  || el == "" ) ? true : false;
	}

	function fnFileDown(fileId, url){
		
		var frm = document.fileDown;	
		
		////console.log(frm);
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

function secret_chk()
{
	
	var ret = fnCheckSession();
		
	if (!ret)
	{
		return false;
	}
	
	var is_secret = '${m_vo.is_selection}';

	var subject_state = '${vo.status}';

	var m_grade = '${m_info.grade}';
	
	var m_poll = '${m_info.poll_num}';
	
	var n_poll = '${now_poll}';
	
	if (m_grade != "nomal" )
	{
		alert("정회원이 아닙니다. 열람하실 수 없습니다.");
		history.back();
		return false;
	}

	if (subject_state == "01" || subject_state == "02" || subject_state == "03")
	{
		alert("공지사항에서 상세내용을 확인해 주세요.");
		history.back();
		return false;
		
	}
		
	if (subject_state == "05" || subject_state == "06" || subject_state == "07" )
	{
		alert("종료된 과제입니다.");
		history.back();
		return false;
	}
	
	if ( m_poll != n_poll ) 
	{
		alert("${now_poll}기 모니터로 선정된 회원만 이용가능합니다.");
		history.back();
		return false;
	}
	
	if ( is_secret == "N" || is_secret == "")
	{
		alert("해당 과제 모니터 요원이 아닙니다.");
		history.back();
		return false;
	}

	
	
	
}


function fnShowImg(img){
	$('.showImg').modal('show');
	$('#modal-img').attr('src',"/monitor"+img);
}


function getTestPopupPage(id){
	var popUrl = "/monitor/front/subject/list.do?subject_id="+id;	//팝업창에 출력될 페이지 URL
	var popOption = "left="+(screen.availWidth-620)/2+",top="+(screen.availHeight-640)/2+" , width=620px,height=640px, resizable=no, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);	

}


// 팝업을 post 폽으로 날리려면 구조에대해 좀 더 생각해봐야한다.
// 보안용으로 히든 타입으로 넣어놔도 보이는것은 어쩔수없고 
// 해당 응답에 대한 idx 값을 어떻게 얻어와야할지도 애매하다.
function getModifyTestPopupPage(s_id , a_id){
	var popUrl = "/monitor/front/subject/modify.do?subject_id="+s_id+"&answers_id="+a_id;	//팝업창에 출력될 페이지 URL
	var popOption = "left="+(screen.availWidth-620)/2+",top="+(screen.availHeight-640)/2+" , width=620px,height=640px, resizable=no, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);		
}


function onApply(id)
{
	if(confirm("삭제 하시겠습니까?")){
		$.ajax({
			async : true,
			type : "POST",
			url : "delete.do",
			data : {"answers_id" : id},
			success : function(data){
				if(data.result == "success"){				
					alert("삭제되었습니다.");
					window.location.reload();					
				}else{
					alert("저장된 데이터가 없습니다.");
				}
			},
			error : function(request,status,error) {
				////console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
}


</script>
<!-- 서브 콘텐츠 -->
	<div class="content_right" style="display:block">
  <h3>모니터링과제(현장과제)</h3>
		<jsp:include page="/WEB-INF/jsp/front/inc/monitor_view_mobile.jsp"></jsp:include>
		<table class="pc_notice_table" style="width:100%;background:#fff;border:0;padding:0;border-spacing:0;">
			<tr>
				<td>
				<!-- 카테고리 -->
					<table class="table_02">
						<colgroup>
							<col width="20%;">
							<col width="80%;">
						</colgroup>
						<tr>
							<th>과제제목</th>
							<td style="padding-left:10px"><span>${vo.title}</span></td>
						</tr>

						<tr>
							<th>과제종류</th>
							<td style="padding-left:10px">
									<span><input type="radio" name="type" disabled <c:if test="${vo.type eq 'F'}">checked</c:if> > 현장과제(참여모집 공고)</span>
									<span style="margin-left:60px;"><input type="radio" name="type" disabled <c:if test="${vo.type eq 'V'}">checked</c:if> > 설문과제(지정과제)</span>
							</td>
						</tr>
						
						<tr>
							<th>과제 제출 기간 </th>
							<td style="padding-left:10px; color:#0054FF; font-weight:bold;">
									<fmt:formatDate value="${vo.submit_s_date }" pattern="yyyy/MM/dd" /> ~ <fmt:formatDate value="${vo.submit_e_date }" pattern="yyyy/MM/dd" />
							</td>
						</tr>
						<tr>
							<th>모니터링 인원</th>
							<td style="padding-left:10px">
								${vo.team_cnt } 조  X 각 조 ${vo.men_cnt } 명 = 총  ${vo.men_total } 명
							</td>
						</tr>						
						<tr>
							<th style="vertical-align: middle;">활동비 지급</th>
							<td style="padding-left:10px">
									<span><input type="radio" value="have" name="have"  disabled <c:if test="${vo.pay_yn eq 'Y'}">checked</c:if> > ${vo.pay_sum } 원</span>
									<span style="margin-left:150px;"><input type="radio" value="none" name="none" disabled  <c:if test="${vo.pay_yn eq 'N'}">checked</c:if> > 없음</span>
							</td>
						</tr>
						<tr>
							<th colspan="4" style="text-align:center;padding-top: 5px;padding-bottom: 5px;">조&nbsp; 사&nbsp; 설&nbsp; 명</th>
						</tr>
						<tr>
							<td colspan="4">
							 <div style="margin-left:20px; margin-right:20px; margin-top:20px; margin-bottom:20px;">
							 ${j:restorestripTags(vo.description)}
							 </div>
							</td>
							
						</tr>
						
						<c:choose>
							<c:when test="${!empty vo.fileList }">
								<tr>
									<th style="vertical-align: middle;">첨부이미지</th>
									<td colspan="3" style="padding-left:10px">
										<c:forEach var="file" items="${vo.fileList }" varStatus="i">
											<c:choose>
												<c:when test="${fn:split(file.fileType, '/')[0] eq 'image'}">	
													<div class="thumbs" style="float:left; width:32%; margin-right:1%;">
															<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" onclick="fnShowImg2('${file.savePath }/${file.unqFileName }');" />
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
						<c:set var="cnt" value="0" />
						<c:set var="cont_sum" value="${cnt}" />
							
						<c:if test="${!empty vo.fileList }">
							<c:forEach var="file" items="${vo.fileList }" varStatus="z">
								<c:if test="${fn:split(file.fileType, '/')[0] ne 'image'}">
									<c:set var="cont_sum" value="${cont_sum+1}" />
									<tr>
										<th>첨부파일${cont_sum}</th>
										<td colspan="3" style="padding-left:10px">
											<span><a href="javascript:fnFileDown('${file.file_id }','<c:url value='/file/fileDown.do'/>');">${file.orgFileName }</a></span>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</c:if>
						
					</table>
				</td>
			</tr>
		</table>
		<!-- 게시판 끝 -->
			

				
		<div style="float:left;margin-top:25px;text-align:right;width: 60%;color: red;font-weight: bold;">
			과제 진행 수 ${vo.question_cnt } 개			 
		</div>		
		
		<div style="float:right;text-align:right;margin-top:20px;">
			<c:if test="${vo.status eq '04' && !empty m_vo && m_vo.is_selection eq 'Y'}">			

				<c:if test="${fn:length(a_list) < vo.question_cnt}">
					<button type="button" class="btn btn-primary button_blue button_white" onclick="getTestPopupPage('${vo.subject_id}')">과제(설문)시작</button>
				</c:if>

			</c:if>

		</div>
		
		<table class="table_02" style="width:100%;background:#fff;padding:0;border-spacing:0;margin-top:70px;text-align:center">
			<colgroup>
				<col width="15%;">
				<col width="20%;">
				<col width="30%;">
				<col width="35%;">
			</colgroup>

			<thead>
				<tr>
					<th>응답번호</th>
					<th>진행상태</th>
					<th>수행일자</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			
		<c:set var="tempNum" value="0" />
			
		<c:forEach begin="0" end="${vo.question_cnt-1 }" var="item" items="${a_list }">
			<c:set var="indexNo" value="${tempNum +indexNo +1}" />
				<tr>
					<td> ${indexNo} </td>
					<td> 
						<c:if test="${item.temporary eq 'N'}">
							응답완료 
						</c:if>						

						<c:if test="${item.temporary eq 'Y'}">
							진행중
						</c:if>						
					</td>
					
					<td>
						<b>
							<fmt:formatDate value="${item.regdate }" pattern="yyyy/MM/dd HH:mm:ss" />
						</b>
					</td>
					
					<td>
						<c:if test="${item.temporary eq 'Y'}">						
							<button type="button" class="btn btn-info button_blue button_white" onclick="getModifyTestPopupPage('${vo.subject_id}' , '${item.answers_id}')">이어하기</button>
												
 						</c:if>
	
						<button type="button" class="btn btn-warning" onclick="onApply('${item.answers_id}')">삭제</button> 
					</td>
					
				</tr>								
			
			</c:forEach>
			</tbody>
		</table>
		
		<div class="clearfix divider_dashed7"></div>

	
	</div>

