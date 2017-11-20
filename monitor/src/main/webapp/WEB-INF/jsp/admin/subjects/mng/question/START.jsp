<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="back_style">
	<div style="background:lightblue;border-radius: 6px 6px 0 0;">
		<table>
			<tr>
				<td style="padding-left: 20px;"><i class="fa fa-edit" style="font-size: xx-large;"></i></td>
				<td style="padding-left: 10px;"><h1> 시작 페이지</h1></td>
				<td style="padding-left: 20px;"><span>인사말 작성</span></td>
			</tr>
		</table>
	</div>
	
	<table class="table table-bordered table-margin" style="margin-bottom: 5px;">
		<tbody>
			<tr>
				<td class="td1">조사 제목</td>
				<td class="text-left">${vo.title }</td>
			</tr>
			
			<tr>
				<td class="td1" style="vertical-align: top;">조사 설명</td>
				<td class="text-left">
					<textarea rows="20" name="description" id="description" cols="145" style="width: 100%; height: 100px;" readonly="readonly">${vo.description }</textarea>
				
				</td>
			</tr>
			<tr>
				<td>이미지</td>
				<td>
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

	<div class="col-lg-2 pull-right right" style="padding-bottom:10px;padding-right:10px;">
		<button class="btn btn-theme" onclick="fnUpdateStartpage();">저장</button>
	</div>
</div>	
	
	