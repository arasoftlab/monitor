<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="col-sm-12"  style="margin-bottom:1%;">
	
	<input type="file" name="file_set_${vo.question_id }" class="col-sm-8"/>

	<!--  
	<input type="file" id="choose" multiple="multiple" />
	<div id="uploadPreview"></div>
	-->
	
	<div class="col-sm-4 pull-right right">
		<label><input type="button" onclick="QS_fnFileCheck('_${vo.question_id }','${vo.cont_uuid }');" value="파일등록" ></label>
		<label><input type="button" onclick="QS_fnDeleteFile('_${vo.question_id }');" value="파일삭제"></label>
		<!-- <input type="button" onclick="fnFileCheck();" value="파일등록">
		<input type="button" onclick="fnDeleteFile();" value="파일삭제"> -->
	</div>
</div>

<table class="table table-bordered">
	<colgroup>
		<col width="10%;">
		<col width="*;">
		<col width="20%;">
	</colgroup>
	<thead class="th_bg">
		<tr>
			<td></td>
			<td>파일이름</td>
			<td>사이즈</td>
		</tr>
	</thead>
	<tbody id="fileList_${vo.question_id }">
		<c:forEach var="file" items="${vo.fileList }">
			<tr>
				<td><input type="checkbox" name="fileListId_${vo.question_id }" value="${file.file_id }"></td>
				<td class="text-left">${file.orgFileName }</td>
				<td class="right">${file.fileSizeMB } [MB]</td> 
			</tr>
		</c:forEach>
	</tbody>
</table>
<div>
	<p class="small">파일 최대 업로드 개수는 <b>${fileUpMaxCnt }</b>개 입니다.</p>
	<p class="small">업로드 가능한 파일의 용량은 <b>${fileMaxSize }</b>MB이하입니다.</p>
	<p class="small">업로드 가능한 파일의 종류는 <b>${fileObjects }</b> 입니다.</p>
	<p class="small">파일 삭제 버튼 선택시 해당 파일은 자동 삭제 됩니다.</p>
</div>