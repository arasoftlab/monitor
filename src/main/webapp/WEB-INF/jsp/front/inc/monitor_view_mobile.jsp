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
		var $modal = $('.showImg');

		var $fimg = $("#modal-img");
		$fimg.attr('src',"/monitor"+img);
		$fimg.addClass("img-responsive");
		$fimg.addClass("img-thumbnail");
		$fimg.addClass("center-block");
		$fimg.css("padding", "5px");
		$modal.modal('show');
	}
</script>

		<table class="mobile_notice_table" style="width:100%;font-size:12px;background:#fff;padding:0;border:none;border-spacing:0;">
			<tr>
				<td>
				<!-- 카테고리 -->
					<table class="table_02">
						<colgroup>
							<col width="30%;">
							<col width="70%;">
						</colgroup>
						<tbody>
							<tr>
								<th>과제제목</th>
								<td style="padding-left:10px">${vo.title }</td>
							</tr>
							<tr>
								<th>과제종류</th>
								<td style="padding-left:10px">
									<c:if test="${vo.type eq 'F'}">현장과제(참여모집 공고)</c:if>
									<c:if test="${vo.type eq 'V'}">설문과제(지정과제)</c:if>
								</td>
							</tr>
								<tr>
									<th>과제 제출기간</th>
									<td style="padding-left:10px; color:#0054FF; font-weight:bold;">
										<fmt:formatDate value='${vo.submit_s_date }' pattern='yyyy/MM/dd' /> ~
										<fmt:formatDate value='${vo.submit_e_date }' pattern='yyyy/MM/dd' />
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
								  <c:if test="${vo.pay_yn eq 'Y'}">${vo.pay_sum } 원</c:if>
									<c:if test="${vo.pay_yn eq 'N'}">없음</c:if></span>
							  </td>
						  </tr>
						  <tr>
							  <th colspan="2" style="text-align:center;padding-top: 5px;padding-bottom: 5px;">조&nbsp; 사&nbsp; 설&nbsp; 명</th>
						  </tr>								
							  <tr>
								  <td colspan="2">
     							 <div style="margin-left:10px; margin-right:10px; margin-top:10px; margin-bottom:10px;">								  
									  ${j:restorestripTags(vo.description)}
									 </div> 
								  </td>
							  </tr>
							
							<c:choose>
								<c:when test="${!empty vo.fileList }">
									<tr>
										<th style="vertical-align: middle;">첨부이미지</th>
										<td align="center">
											<c:forEach var="file" items="${vo.fileList }" varStatus="i">
												<c:choose>
													<c:when test="${fn:split(file.fileType, '/')[0] eq 'image'}">	
														<div class="thumbs" style="float:left;width:32%;margin-right:1%;">
															<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" onclick="fnShowImg2('${file.savePath }/${file.unqFileName }');" />
														</div>
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
			
		<div class="modal showImg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" >
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <img id="modal-img" />
		    </div>
		    <div class="modal-footer">
		      <button type="button" class="btn btn-default" data-dismiss="modal" data-backdrop="false">Close</button>
		    </div>
		  </div>
		</div>
		
		