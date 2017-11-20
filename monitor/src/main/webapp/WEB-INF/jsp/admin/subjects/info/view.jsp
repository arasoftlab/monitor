<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/jf-taglib.tld" prefix="j"%>

<link href="//vjs.zencdn.net/4.9/video-js.css" rel="stylesheet">
<script src="<c:url value='/js/video.js'/>"></script>

<script>
$(function(){
	
	var chk_sub_id = "${vo.subject_id}";
	
	if (chk_sub_id == "")
	{
		alert("정보 등록 후 사용가능한 메뉴입니다.");
		history.back();
	}
	
});


function fnDelete(){
	if(confirm("삭제 하시겠습니까?")){
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/admin/subject/info/delete.do'/>",
			data : $("form").serialize(),
			success : function(data){
				if(data.result == "success"){
					location.href="<c:url value='/admin/subject/list.do'/>";
				}else{
					alert("삭제된 데이터가 없습니다.");
				}
			},
			error : function(request,status,error) {
				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
	}
}


function fnDelete(){
	if(confirm("삭제 하시겠습니까?")){
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/admin/subject/info/delete.do'/>",
			data : $("form").serialize(),
			success : function(data){
				if(data.result == "success"){
					location.href="<c:url value='/admin/subject/list.do'/>";
				}else{
					alert("삭제된 데이터가 없습니다.");
				}
			},
			error : function(request,status,error) {
				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
	}
}



</script>
				<form>
					<input type="hidden" name="subject_id" value="${vo.subject_id }">
					<input type="hidden" name="cont_uuid" value="${vo.cont_uuid }">
				</form>
<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
			
				<table class="table table-bordered table-margin">
					<tbody>
						<tr>
							<td class="td1">과제제목</td>
							<td colspan=3 class="left">${vo.title }</td>
						</tr>
						<tr>
							<td class="td1">의뢰부서</td>
							<td colspan=3 class="left">${vo.reqdep }</td>
						</tr>
						<tr>
							<td class="td1">과제종류</td>
							<td colspan=3 class="left">
								<div class="radio">
									<label class="col-sm-4"><input type="radio" name="type" disabled <c:if test="${vo.type eq 'F'}">checked</c:if> >현장과제(참여모집 공고)</label>
									<label class="col-sm-4"><input type="radio" name="type" disabled <c:if test="${vo.type eq 'V'}">checked</c:if> >설문과제(지정과제)</label>
								</div>
							</td>
						</tr>
						<tr>
							<td class="td1">모니터 신청기간</td>
							<td colspan=3 class="left"><label> <fmt:formatDate value="${vo.apply_s_date }" pattern="yyyy/MM/dd" /> ~ <fmt:formatDate value="${vo.apply_e_date }" pattern="yyyy/MM/dd" /></label></td>
						</tr>
						<tr>
							<td class="td1">보고서 제출기간</td>
							<td colspan=3 class="left"><label> <fmt:formatDate value="${vo.submit_s_date }" pattern="yyyy/MM/dd" /> ~ <fmt:formatDate value="${vo.submit_e_date }" pattern="yyyy/MM/dd" /></label></td>
						</tr>
						<tr>
							<td class="td1">모니터링 조건</td>
							<td colspan=3 class="left"> &nbsp; 과제 수행 수 ${vo.question_cnt }개 &nbsp;&nbsp;&nbsp;&nbsp;${vo.team_cnt }조 X 각 조 ${vo.men_cnt }명 = ${vo.men_total }명</td>
						</tr>
						<tr>
							<td class="td1">활동비 지급</td>
							<td colspan=3 class="left">
								<div class="radio">
									<label class="col-sm-4"><input type="radio" value="have" name="have" disabled <c:if test="${vo.pay_yn eq 'Y'}">checked</c:if> >있음 (${vo.pay_sum } 원)</label>
									<label class="col-sm-4"><input type="radio" value="none" name="none" disabled  <c:if test="${vo.pay_yn eq 'N'}">checked</c:if> >없음</label>									
								</div>
							</td>
						</tr>
					
						
						<tr>
							<td class="td1">활동비 입금일</td>
							<td colspan=3 class="left">
								<div class="col-sm-12" style="padding:0;">
									<label class="col-sm-2">
										<fmt:formatDate value="${vo.pay_date }" pattern="yyyy/MM/dd" />
									</label>
									<span style="font-size: 11px; color: #ababab;">*과제기간 종료 후 재무과에 입금 신청한 날을 선택</span>
								</div>
							</td>
						</tr>
						<tr>
							<td class="td1">조사 설명</td>
							<td colspan=3 class="left">${j:restorestripTags(vo.description)}</td>
						</tr>
						<tr>
							<td class="td1">이미지 첨부</td>
							<td colspan=3 class="left">
								<c:choose>
									<c:when test="${!empty vo.fileList }">
										<c:forEach var="file" items="${vo.fileList }" varStatus="i">
											<%-- <c:if test="${i.index ne 0 }">, </c:if> --%>
											<div class="text-center" style="float: left; margin-right: 10px;">
												<c:choose>
													<c:when test="${fn:split(file.fileType, '/')[0] eq 'image'}">
														<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" style="width: 150px;">
													</c:when>
													<c:when test="${fn:split(file.fileType, '/')[0] eq 'video'}">
														<!--  
														<video src="<c:url value='${file.savePath }/${file.unqFileName }'/>" width="250px" controls="controls"
														class="video-js vjs-default-skin" data-setup="{}"></video>
														-->
														
														<video width="250px" controls="controls"
														class="video-js vjs-default-skin" data-setup="{}">
														<source src="<c:url value='${file.savePath }/${file.unqFileName }'/>" type="video/mp4" />
														</video>
														
													</c:when>
													<c:otherwise>
														<i class="fa fa-file-text fa-5x"></i>
													</c:otherwise>
												</c:choose>
												<br>
												<a href="javascript:fnFileDown('${file.file_id }','<c:url value='/file/fileDown.do'/>');">${file.orgFileName }</a>
											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>첨부파일이 없습니다.</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</tbody>
				</table>
				
			</div>
			<div class="col-lg-2 pull-right right">

				<button class="btn btn-warning " onclick="fnDelete();">삭제</button>
				<button class="btn btn-theme " onclick="location.href='modify.do?subject_id=${vo.subject_id}'">수정</button>
				<button class="btn btn-info " onclick="location.href='<c:url value='/admin/subject/list.do'/>';">목록</button>
			</div>
		</div>
	</div>
	</section>