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
					<div class="answer">
						<c:forEach var="item" items="${optionList }" varStatus="i">
							<div id="${item.options_id }" class=" optionList row"
								data-question_id="${item.question_id }"
								data-options_id="${item.options_id }">
								<input type="hidden" name="optionVO[${i.index }].options_id" value="${item.options_id }">
								<div class="col-sm-6  input-group" style="float:left;">
									<input type="text" class="quest_form" name="optionVO[${i.index}].label_front" value="${item.label_front }"/>
									<div class="input-group-addon droppable">
										<i class="fa fa-1x fa-arrows-v"></i>
									</div>
								</div>
								
								<div class="col-sm-2" style="padding-left:10px;">
									<div class="col-sm-5">
										<a id="btn_del" class="btn btn-default btn-sm icon_btn delete" onclick="fnDeleteOption('${item.options_id}');">
											<i class="fa fa-1x fa-times"></i>
										</a>
									</div>
									<div id="pollImageAdd" class="col-sm-4">
				                        <div class="btn btn-default btn-sm fileinput-button icon_btn">
				                            <i class="fa fa-1x fa-picture-o">
   				                            	<input type="file" class="file_input" name="O_file_setI${item.options_id}" onchange="O_fnFileCheck('I${item.options_id}' , '${item.cont_uuid}' , '_${vo.question_id}')"/>
				                            </i>
				                        </div> 
									</div>	
								</div>
								<!--  
								<div class="col-sm-2">
									<input type="text" class="quest_form" name="optionVO[${i.index}].keyword" value="${item.keyword }" placeholder="keyword"/>
								</div>
								-->
								
								<div class="input-group col-sm-2" style="padding-left:15px; float:left;">
									<div class="input-group-addon">
										<i class="fa fa-1x fa-arrow-right"></i>
									</div>
									<input type="text" class="quest_form" name="optionVO[${i.index}].next_num" value="${item.next_num }" placeholder="다음문항">
							    </div>
							    <div class="col-sm-2 checkbox" style="padding-left:40px; margin-top:5px;">
							    	<input type="checkbox" name="optionVO[${i.index}].endpoint" value="Y" <c:if test="${item.endpoint eq 'Y' }">checked</c:if> />
							    	<label>종료조건</label>
							    </div>
							    
								<div class="col-lg-12">
									<div id="O_fileListI${item.options_id }">
										<c:forEach var="file" items="${item.fileList }">
											<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" class='img-responsive img-thumbnail'>
										</c:forEach>
									</div>
								</div>
							    
							</div>
						</c:forEach>
					</div>
					
					<div id="answerAdd" class="col-lg-12" >
                       <div class="btn btn-default btn-sm fileinput-button" onclick="fnInsertOptions('#q_form_${vo.question_id }');">
                           <div> <i class="fa fa-1x fa-plus"> 응답보기추가</i></div>
                       </div> 
					</div>	
					
					<jsp:include page="setting_C.jsp"></jsp:include>
				</td>
			</tr>
		</tbody>
	</table>
			<div id="btn_group" class="col-lg-2 pull-right right">
				<button class="btn btn-warning" onclick="fnDeleteQuestion(this.form);">삭제</button>
				<button class="btn btn-theme" onclick="fnUpdateQuestion(this.form);">저장</button>
			</div>
</form>
				