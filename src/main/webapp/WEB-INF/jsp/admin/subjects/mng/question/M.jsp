<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<form id="q_form_${vo.question_id }" onsubmit="return false;"  class="back_style">
	<input type="hidden" name="question_id" value="${vo.question_id }">
	<input type="hidden" name="subject_id" value="${vo.subject_id }">
	<input type="hidden" name="question_num" value="${vo.question_num }">
	
	<jsp:include page="/WEB-INF/inc/quest.jsp"></jsp:include>
	<table class="table table-bordered table-margin">
		<tbody>
			<tr>
				<td class="td1">응답보기</td>
				<td colspan=3 class="left">
					<div class="answer" id="sortable">
						<c:forEach var="item" items="${optionList }" varStatus="i">
							<div id="${item.options_id }" class="optionList row"
								data-question_id="${item.question_id }"
								data-options_id="${item.options_id }">
								<input type="hidden" name="optionVO[${i.index }].options_id" value="${item.options_id }">
								<input type="hidden" name="optionVO[${i.index }].cont_uuid" value="${item.cont_uuid }">
								
								<div class="col-xs-10  input-group" style="float:left;">
									<input type="text" class="quest_form" name="optionVO[${i.index}].label_front" value="${item.label_front }"/>
									<div class="input-group-addon droppable">
										<i class="fa fa-1x fa-arrows-v"></i>
									</div>
								</div>
								
								<div class="col-xs-2" style="padding-left:10px;">
									<div class="col-xs-6">
										<a id="btn_del" class="btn btn-default btn-sm icon_btn delete" onclick="fnDeleteOption('${item.options_id}');">
											<i class="fa fa-1x fa-times"></i>
										</a>
									</div>
									<div id="pollImageAdd" class="col-xs-6">
												<c:choose>
													<c:when test="${!empty item.fileList }">
														<input type="file" class="file_input" name="O_file_setI${item.options_id}" onchange="O_fnFileCheck_update('I${item.options_id}' , '${item.cont_uuid}' , '_${vo.question_id}')"/>
													</c:when>
													<c:otherwise>
														<input type="file" class="file_input" name="O_file_setI${item.options_id}" onchange="O_fnFileCheck('I${item.options_id}' , '${item.cont_uuid}' , '_${vo.question_id}')"/>
													</c:otherwise>
												</c:choose>
									</div>	
								</div>
								<!-- 마지막 에만 서술형 추가 첨부 -->
								<c:if test="${fn:length(optionList) -1 eq i.index }" >
								    <div class="col-xs-2" style="padding-left:15px; margin-top:5px;">
								    	<input type="checkbox" value="Y" onclick="s_type_desc(this)" id="s_type_descyn" name="optionVO[${i.index}].descyn" <c:if test="${item.descyn eq 'Y' }">checked</c:if> />
								    	<label>서술형추가</label>
								    </div>								
								</c:if>
								<div class="col-xs-12">
									<div id="O_fileListI${item.options_id }">
										<c:forEach var="file" items="${item.fileList }">
											<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" class='img-responsive img-thumbnail'>
										</c:forEach>
									</div>
								</div>
								
							</div>
						</c:forEach>
					</div>
					<div id="answerAdd" class="col-xs-12" >
                       <div class="btn btn-default btn-sm fileinput-button" onclick="fnInsertOptions('#q_form_${vo.question_id }');">
							<div><i class="fa fa-1x fa-plus"> 응답보기추가</i></div>
						</div> 
					</div>	
					
					<jsp:include page="setting_M.jsp"></jsp:include>
				</td>
			</tr>
		</tbody>
	</table>
			<div id="btn_group" class="col-xs-12 pull-right right">
				<button class="btn btn-warning" onclick="fnDeleteQuestion(this.form);">삭제</button>
				<button class="btn btn-theme" onclick="fnUpdateQuestion(this.form);">저장</button>
			</div>
</form>
				