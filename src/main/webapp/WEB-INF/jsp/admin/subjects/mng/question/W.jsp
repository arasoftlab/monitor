<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<form id="q_form_${vo.question_id }" onsubmit="return false;"   class="back_style">
	<input type="hidden" name="question_id" value="${vo.question_id }">
	<input type="hidden" name="subject_id" value="${vo.subject_id }">
	<input type="hidden" name="question_num" value="${vo.question_num }">

	<jsp:include page="/WEB-INF/inc/quest.jsp"></jsp:include>
	<table class="table table-bordered table-margin">
		<tbody>
			<tr>
				<td class="td1">응답보기 </td>
				<td colspan=3 class="left">
					<div class="answer">

						<c:forEach var="item" items="${optionList }" varStatus="i">
							<div id="${item.options_id }" class="optionList row"
								data-question_id="${item.question_id }"
								data-options_id="${item.options_id }">
								<input type="hidden" name="optionVO[${i.index }].options_id" value="${item.options_id }">
								<div class="col-sm-7  input-group" style="float: left;">
									<div class="col-sm-6">
										<input type="text" class="quest_form"
											name="optionVO[${i.index}].label_front"
											value="${item.label_front }" placeholder="앞 라벨" />
									</div>
									<div class="col-sm-1" style="width: 5%;"></div>

									<div class="col-sm-5">
										<input type="text" class="quest_form"
											name="optionVO[${i.index}].label_rear"
											value="${item.label_rear }" placeholder="뒷 라벨" />
									</div>
								</div>



								<div class="col-sm-4  input-group"
									style="float: left; padding-left: 10px;">
									<div class="input-group-addon">형식</div>
									<div id="search" style="padding: 0;">
										<select class="quest_form" 
											name="optionVO[${i.index}].label_1" >											
											<option value="">선택</option>
											<option value="text" <c:if test="${item.label_1 eq 'text'}"> selected </c:if> >단문</option>
											<option value="num" <c:if test="${item.label_1 eq 'num'}"> selected </c:if> >숫자</option>
											<option value="memo" <c:if test="${item.label_1 eq 'memo'}"> selected </c:if> >장문</option>
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
<!--  
								<div class="col-sm-2" style="margin-top: 5px;">
									<input type="checkbox" /> <label>입력합 지정</label>
								</div>
-->
							</div>
							
							</c:forEach>
					</div>



					<div id="answerAdd" class="col-lg-12" >
                       <div class="btn btn-default btn-sm fileinput-button" id="optionAdd" onclick="fnInsertOptions('#q_form_${vo.question_id }');" >
                           <div> <i class="fa fa-1x fa-plus"> 응답보기추가</i></div>
                       </div> 
					</div>	
					
					<jsp:include page="setting_W.jsp"></jsp:include>
				</td>
			</tr>
		</tbody>
	</table>
			<div id="btn_group" class="col-lg-2 pull-right right">
				<button class="btn btn-warning" onclick="fnDeleteQuestion(this.form);">삭제</button>
				<button class="btn btn-theme" onclick="fnUpdateQuestion(this.form);">저장</button>
			</div>	
</form>
				