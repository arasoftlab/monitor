<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>

function checkDisable(chk , label)
{
	
	////console.log($('input[name="'+chk+'"]));
	
	$('input[name="'+chk+'"]').each(function() 
	{    
	    if($(this).is(':checked')){
	    	$('input[name="'+label+'"]').removeAttr('disabled');}

	    else
	    	{
	    	$('input[name="'+label+'"]').attr('disabled','disabled');}

	});
}

</script>


<form id="q_form_${vo.question_id }" onsubmit="return false;"   class="back_style">
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
								<input type="hidden" name="optionVO[${i.index }].options_id"
									value="${item.options_id }">

								<div class="col-sm-5  input-group" style="float: left;width: 315px;">
									<div class="col-sm-12">
										<input type="text" class="quest_form" name="optionVO[${i.index}].label_front" value="${item.label_front }" placeholder="의견이 필요할 경우 기재" />
									</div>
									<div class="col-sm-1" style="width:2%;"></div>
									<div class="col-sm-5">

									</div>

								</div>


								<div class="col-sm-4  input-group"
									style="float: left; padding-left: 5px;width: 170px;">
									<div class="input-group-addon">형식</div>
									<div id="search" style="padding: 0;">
										<select class="quest_form" 
											name="optionVO[${i.index}].label_1" >											
											<option value="">선택</option>
											<option value="img" <c:if test="${item.label_1 eq 'img'}"> selected </c:if> >이미지</option>
											<option value="file" <c:if test="${item.label_1 eq 'file'}"> selected </c:if> >문서</option>
										</select>
									</div>
									<div class="input-group-addon droppable">
										<i class="fa fa-1x fa-arrows-v"></i>
									</div>
								</div>

								<div class="col-sm-1" style="padding-left: 10px;">
									<div id="pollImageDelete" class="col-sm-5">
										<button type="button"
											class="btn btn-default btn-sm icon_btn delete" onclick="fnDeleteOption('${item.options_id}');">
											<i class="fa fa-1x fa-times"></i>
										</button>
									</div>
								</div>

								<div class="col-sm-2" style="margin-top: 5px;width: 13%;">
									<input type="checkbox" value="Y" name="optionVO[${i.index}].endpoint" <c:if test="${item.endpoint eq 'Y' }">checked</c:if> />
									<label>첨부 필수</label>
								</div>
								
								<div class="col-sm-2" style="margin-top: 5px;width: 13%;">
									<input type="checkbox" value="Y" name="optionVO[${i.index}].examrequire" <c:if test="${item.examrequire eq 'Y' }">checked</c:if> />
									
									<label>설명 필수</label>
								</div>
																
							</div>
 					</c:forEach>					

					</div>
					
					
					
					<div id="answerAdd" class="pull-left col-lg-12" >
	                       <span class="btn btn-default btn-sm fileinput-button" id="optionAdd" onclick="fnInsertOptions('#q_form_${vo.question_id }');">
	                           <span> <i class="fa fa-1x fa-plus">응답보기추가</i></span>
	                       </span> 
					</div>	
					
					<jsp:include page="setting_T.jsp"></jsp:include>
				</td>
			</tr>
		</tbody>
	</table>
			<div id="btn_group" class="col-lg-2 pull-right right">
				<button class="btn btn-warning" onclick="fnDeleteQuestion(this.form);">삭제</button>
				<button class="btn btn-theme" onclick="fnUpdateQuestion(this.form);">저장</button>
			</div>	
</form>
				