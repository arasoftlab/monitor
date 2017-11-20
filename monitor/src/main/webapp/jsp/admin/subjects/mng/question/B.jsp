<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<form id="q_form_${vo.question_id }" onsubmit="return false;" class="back_style">

	<input type="hidden" name="question_id" value="${vo.question_id }">
	<input type="hidden" name="subject_id" value="${vo.subject_id }">
	<input type="hidden" name="question_num" value="${vo.question_num }">

	<jsp:include page="/WEB-INF/inc/quest.jsp"></jsp:include>
	<table class="table table-bordered table-margin">
		<tbody>
			<tr>
				<td class="td1">응답보기</td>
				<td colspan=3 class="left">
					
					<jsp:include page="setting_B.jsp"></jsp:include>
				</td>
			</tr>
		</tbody>
	</table>
			<div id="btn_group" class="col-lg-2 pull-right right">
				<button class="btn btn-warning" onclick="fnDeleteQuestion(this.form);">삭제</button>
				<button class="btn btn-theme" onclick="fnUpdateQuestion(this.form);">저장</button>
			</div>	
</form>
				