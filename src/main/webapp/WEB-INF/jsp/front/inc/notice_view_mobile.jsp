<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/jf-taglib.tld" prefix="j"%> 

<style>
.modal{text-align:center;padding:0 !important; }
.modal:before{content:'';display:inline-block;height:100%;vertical-align:middle;margin-right:-4px;}
.modal-dialog{display:inline-block;text-align:left;vertical-align:middle;}

</style>

<script>
	function fnShowImg2(img){
		var $modal = $('#modalImage');

		var $fimg = $("#modal-img");
		$fimg.attr('src',"/monitor"+img);
		$fimg.addClass("img-responsive");
		$fimg.addClass("img-thumbnail");
		$fimg.addClass("center-block");
		$fimg.css("padding", "5px");
		$modal.modal('show');
	}
	
	function fnShowClose(){
		var $modal = $('.showImg');
	}
</script>

		<table class="mobile_notice_table">
			<tr>
				<td>
				<!-- 카테고리 -->
	  
	  
					<table class="table_02" style="font-size:12px; text-align:center; table-layout:fixed;">
						<colgroup>
							<col width="30%;">
							<col width="70%;">
						</colgroup>
						<tbody>
							<tr>
								<th>공지제목</th>
								<td>${vo.title }</td>
							</tr>
							<tr>
								<th>등록일</th>
								<td><fmt:formatDate value="${vo.regDate }" pattern="yyyy/MM/dd" /></td>
							</tr>
							<tr>
								<th>조회수</th>
								<td>${vo.hits }</td>
							</tr>
							<tr>
								<th>공지종류</th>
								<td>
									<c:if test="${vo.type eq 'F'}">현장과제(참여모집 공고)</c:if>
									<c:if test="${vo.type eq 'V'}">설문과제(지정과제)</c:if>
									<c:if test="${vo.type eq 'S'}">단순, 일반공지</c:if>
									<!-- ex :현장과제(참여모집 공고)  -->
								</td>
							</tr>
							<tr>
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
								<tr>
									<th>참여 신청 기간</th>
									<td style="color:blue;">
										<fmt:formatDate value='${vo.subjectVO.apply_s_date }' pattern='yyyy/MM/dd' /> ~
										<fmt:formatDate value='${vo.subjectVO.apply_e_date }' pattern='yyyy/MM/dd' />
									</td>
								</tr>
								<tr>
									<th>과제 제출기간</th>
									<td>
										<fmt:formatDate value='${vo.subjectVO.submit_s_date }' pattern='yyyy/MM/dd' /> ~
										<fmt:formatDate value='${vo.subjectVO.submit_e_date }' pattern='yyyy/MM/dd' />
									</td>								
								</tr>
							</c:if>

							<tr>
								<th colspan="2" style="padding-top:10px; padding-bottom:5px;">공&nbsp;&nbsp;지&nbsp;&nbsp;내&nbsp;&nbsp;용</th>
							</tr>	
							<tr>	
								<td colspan="2" style="text-align:left;">
                  <div style="margin-left:5px; margin-right:5px; margin-top:10px; margin-bottom:10px;">								
									${j:restorestripTags(vo.description)}
									</div>
								</td>
							</tr>
							
							<c:choose>
								<c:when test="${!empty vo.fileList }">
									<tr>
										<th style="vertical-align: middle;">첨부이미지</th>
										<td>
											<c:forEach var="file" items="${vo.fileList }" varStatus="i">
												<c:choose>
													<c:when test="${fn:split(file.fileType, '/')[0] eq 'image'}">	
														
														<img class="img-thumbnail img-responsive" src="<c:url value='${file.savePath }/${file.unqFileName }'/>" onclick="fnShowImg2('${file.savePath }/${file.unqFileName }');"/>
														
													</c:when>
													<c:otherwise>
													</c:otherwise>

												</c:choose>
											</c:forEach>
										</td>
									</tr>	
								</c:when>
								<c:otherwise>
									<tr>
									<th>첨부이미지</th>
										<td>첨부파일이 없습니다.</td>
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
											<td>
												<span><a href="javascript:fnFileDown('${file.file_id }','<c:url value='/file/fileDown.do'/>');">${file.orgFileName }</a></span>
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
						</tbody>

					</table>

				</td>
			</tr>
		</table>
		<!-- 게시판 끝 -->

		
		<!-- Large modal -->		
		<div class="modal animated" id="modalImage" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <img id="modal-img"  />
		    </div>
		    <div class="modal-footer">
		      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		    </div>
		  </div>
		</div>
		
		