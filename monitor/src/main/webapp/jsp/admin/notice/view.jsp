<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/jf-taglib.tld" prefix="j"%> 
<jsp:scriptlet>pageContext.setAttribute("newline", "\n");</jsp:scriptlet>
<jsp:scriptlet>pageContext.setAttribute("new1", "");</jsp:scriptlet>

<script>

function fnDelete(){
	if(confirm("삭제 하시겠습니까?")){
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/admin/notice/delete.do'/>",
			data : $("form").serialize(),
			success : function(data){
				if(data.result == "success"){
					location.href="<c:url value='/admin/notice/list.do'/>";
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
	<input type="hidden" name="notice_id" value="${vo.notice_id }">
	<input type="hidden" name="cont_uuid" value="${vo.cont_uuid }">
</form>

<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h4>공지사항</h4>
			
				<table class="table table-bordered table-margin">
					<tbody>
						<tr>
							<td class="td1">공지제목</td>
							<td colspan=3 class="left">${vo.title }</td>
						</tr>
						<tr>
							<td class="td1">등록일</td>
							<td class="left"><fmt:formatDate value="${vo.regDate }" pattern="yyyy/MM/dd" /></td>
							<td class="td1">조회수</td>
							<td class="left">${vo.hits }</td>
						</tr>
						<tr>
							<td class="td1">공지종류</td>
							<td colspan=3 class="left">
								<div class="radio">
									<label class="col-sm-4"><input type="radio" name="type" disabled <c:if test="${vo.type eq 'S'}">checked</c:if> >단순, 일반공지</label>
									<label class="col-sm-4"><input type="radio" name="type" disabled <c:if test="${vo.type eq 'F'}">checked</c:if> >현장과제(참여모집 공고)</label>
									<label class="col-sm-4"><input type="radio" name="type" disabled <c:if test="${vo.type eq 'V'}">checked</c:if> >설문과제(지정과제)</label>
								</div>
							</td>
						</tr>
						
						<c:choose>

						<c:when test="${vo.type eq 'S'}"></c:when>
						<c:otherwise>
							<tr>
								<td class="td1">연결과제</td>
								<td colspan=3 class="left">
									<a href="/monitor/admin/subject/info/view.do?subject_id=${vo.subjectVO.subject_id }">
										${vo.subjectVO.title }
									</a>
								</td>
							</tr>
							<tr>
								<td class="td1">모니터 신청기간</td>
								<td class="left">
									<fmt:formatDate value='${vo.subjectVO.apply_s_date }' pattern='yyyy/MM/dd' /> ~ 
									<fmt:formatDate value='${vo.subjectVO.apply_e_date }' pattern='yyyy/MM/dd' />
								</td>
								<td class="td1">과제제출 기간</td>
								<td class="left">
									<fmt:formatDate value='${vo.subjectVO.submit_s_date }' pattern='yyyy/MM/dd' /> ~ 
									<fmt:formatDate value='${vo.subjectVO.submit_e_date }' pattern='yyyy/MM/dd' />
								</td>
							</tr>
						</c:otherwise>

						</c:choose>
						
						<tr>
							<td class="td1">공지종류</td>
							<td colspan=3 class="left">
								<div class="radio">
									<label class="col-sm-4"><input type="radio" name="open" disabled <c:if test="${vo.open eq 'Y'}">checked</c:if> >홈 공개</label>
									<label class="col-sm-4"><input type="radio" name="open" disabled <c:if test="${vo.open eq 'N'}">checked</c:if> >홈 비공개</label>
								</div>
							</td>
						</tr>
						<tr>
							<td class="td1">공지내용</td>
							<td colspan=3 class="left">${j:restorestripTags(vo.description)}</td>
						</tr>
						<tr>
							<td class="td1">신청방법</td>
							<td colspan=3 class="left">${j:restorestripTags(vo.applyform)}</td>
						</tr>
						<tr>
							<td class="td1">첨부파일</td>
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
														<video src="<c:url value='${file.savePath }/${file.unqFileName }'/>" width="150px" controls="controls"></video>
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
				<button class="btn btn-warning" onclick="fnDelete();">삭제</button>
				<button class="btn btn-theme" onclick="location.href='modify.do?notice_id=${vo.notice_id}';">수정</button>
				<button class="btn btn-info" onclick="location.href='list.do';">목록</button>
			</div>
		</div>
	</div>
</section>