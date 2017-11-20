<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
$(function(){
	$("#3point").click(function(){
		$("input[name='form']").val("3");
		fnInsertOptionsR('#q_form_${vo.question_id }');
	});
	$("#5point").click(function(){
		$("input[name='form']").val("5");
		fnInsertOptionsR('#q_form_${vo.question_id }');
	});
	$("#7point").click(function(){
		$("input[name='form']").val("7");
		fnInsertOptionsR('#q_form_${vo.question_id }');
	});
	$("#9point").click(function(){
		$("input[name='form']").val("9");
		fnInsertOptionsR('#q_form_${vo.question_id }');
	});
	$("#10point").click(function(){
		$("input[name='form']").val("10");
		fnInsertOptionsR('#q_form_${vo.question_id }');
	});
	$("#11point").click(function(){
		$("input[name='form']").val("11");
		fnInsertOptionsR('#q_form_${vo.question_id }');
	});
});
</script>

<form id="q_form_${vo.question_id }" onsubmit="return false;"  class="back_style">
	<input type="hidden" name="question_id" value="${vo.question_id }">
	<input type="hidden" name="subject_id" value="${vo.subject_id }">
	<input type="hidden" name="question_num" value="${vo.question_num }">

	<input type="hidden" name="form" value="${item.form }">
	
	
	
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

								<!-- 각 문항에 대한 form 값을 가지고있어야함 -->
								<input type="hidden" name="optionVO[${i.index }].form" value="${item.form }">
																
								<div class="col-sm-11  input-group" style="float:left;">
									<input type="text" class="quest_form" name="optionVO[${i.index}].label_front" value="${item.label_front }"/>
									<div class="input-group-addon droppable">
										<i class="fa fa-1x fa-arrows-v"></i>
									</div>
								</div>
								
								<div class="col-sm-1" style="padding-left:10px;">
									<div class="col-sm-5">
										<a id="btn_del" class="btn btn-default btn-sm icon_btn delete" onclick="fnDeleteOption('${item.options_id}');">
											<i class="fa fa-1x fa-times"></i>
										</a>
									</div>
								</div>
								
								
								<c:choose>
									<c:when test="${item.form eq 5}">

									<table class="table_five" style="width:100%">
									<tr>
										<td>
											<div class="five_text" style="width:90%"><input type="text"  class="quest_form" name="optionVO[${i.index}].label_1" value=${item.label_1 }></div>
										</td>
										<td>
											<div class="five_text" style="width:90%"><input type="text"  class="quest_form" name="optionVO[${i.index}].label_2" value=${item.label_2 }></div>
										</td>
										<td>
											<div class="five_text" style="width:90%"><input type="text"  class="quest_form" name="optionVO[${i.index}].label_3" value=${item.label_3 }></div>
										</td>
										<td>
											<div class="five_text" style="width:90%"><input type="text"  class="quest_form" name="optionVO[${i.index}].label_4" value=${item.label_4 }></div>
										</td>
										<td>
											<div class="five_text" style="width:90%"><input type="text"  class="quest_form" name="optionVO[${i.index}].label_5" value=${item.label_5 }></div>
										</td>
									</tr>
									</c:when>

									<c:when test="${item.form eq 7}">

									<table class="table_seven" style="width:100%">
									
									<tr>
										<td colspan="7">
											<table style="width:100%;">
												<tr>
													<td style="width:33%;">
														<div class="three_text" style="margin-left:0; width:90%"><input type="text" class="quest_form" name="optionVO[${i.index}].label_1" value=${item.label_1 }></div>
													</td>
													<td style="width:33%;">
														<div class="three_text" style="margin-left:0; width:90%"><input type="text" class="quest_form" name="optionVO[${i.index}].label_2" value=${item.label_2 }></div>
													</td>
													<td style="width:33%;">
														<div class="three_text" style="margin-left:0; width:90%"><input type="text" class="quest_form" name="optionVO[${i.index}].label_3" value=${item.label_3 }></div>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									
									<%-- <tr colspan="7">
											<td colspan="3">
												<div class="three_text" style="margin-left:0; width:90%"><input type="text" class="quest_form" name="optionVO[${i.index}].label_1" value=${item.label_1 }></div>
											</td>
											<td colspan="2">
												<div class="three_text" style="margin-left:0; width:90%"><input type="text" class="quest_form" name="optionVO[${i.index}].label_2" value=${item.label_2 }></div>
											</td>
											<td colspan="2">
												<div class="three_text" style="margin-left:0; width:90%"><input type="text" class="quest_form" name="optionVO[${i.index}].label_3" value=${item.label_3 }></div>
											</td>
									</tr> --%>
									</c:when>
				
									<c:when test="${item.form eq 9}">

									<table class="table_nine" style="width:100%">
									<tr colspan="9">
											<td colspan="3">
												<div class="three_text" style="margin-left:0; width:90%"><input type="text" class="quest_form" name="optionVO[${i.index}].label_1" value=${item.label_1 }></div>
											</td>
											<td colspan="3">
												<div class="three_text" style="margin-left:0; width:90%"><input type="text" class="quest_form" name="optionVO[${i.index}].label_2" value=${item.label_2 }></div>
											</td>
											<td colspan="3">
												<div class="three_text" style="margin-left:0; width:90%"><input type="text" class="quest_form" name="optionVO[${i.index}].label_3" value=${item.label_3 }></div>
											</td>
									</tr>
									</c:when>
									
									<c:when test="${item.form eq 10}">

									<table class="table_ten" style="width:100%">
									<tr>
										<td colspan="10">
											<table style="width:100%;">
												<tr>
													<td style="width:33%;">
														<div class="three_text" style="margin-left:0; width:90%"><input type="text" class="quest_form" name="optionVO[${i.index}].label_1" value=${item.label_1 }></div>
													</td>
													<td style="width:33%;">
														<div class="three_text" style="margin-left:0; width:90%"><input type="text" class="quest_form" name="optionVO[${i.index}].label_2" value=${item.label_2 }></div>
													</td>
													<td style="width:33%;">
														<div class="three_text" style="margin-left:0; width:90%"><input type="text" class="quest_form" name="optionVO[${i.index}].label_3" value=${item.label_3 }></div>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									</c:when>

									<c:when test="${item.form eq 11}">

									<table class="table_eleven" style="width:100%">
									<tr>
										<td colspan="11">
											<table style="width:100%;">
												<tr>
													<td style="width:33%;">
														<div class="three_text" style="margin-left:0; width:90%"><input type="text" class="quest_form" name="optionVO[${i.index}].label_1" value=${item.label_1 }></div>
													</td>
													<td style="width:33%;">
														<div class="three_text" style="margin-left:0; width:90%"><input type="text" class="quest_form" name="optionVO[${i.index}].label_2" value=${item.label_2 }></div>
													</td>
													<td style="width:33%;">
														<div class="three_text" style="margin-left:0; width:90%"><input type="text" class="quest_form" name="optionVO[${i.index}].label_3" value=${item.label_3 }></div>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									</c:when>
									
									<c:otherwise>
										<table class="table_three" style="width:100%">
										
										<tr>
											<td>
												<div class="three_text" style="margin-left:0; width:90%"><input type="text" class="quest_form" name="optionVO[${i.index}].label_1" value=${item.label_1 }></div>
											</td>
											<td>
												<div class="three_text" style="margin-left:0; width:90%"><input type="text" class="quest_form" name="optionVO[${i.index}].label_2" value=${item.label_2 }></div>
											</td>
											<td>
												<div class="three_text" style="margin-left:0; width:90%"><input type="text" class="quest_form" name="optionVO[${i.index}].label_3" value=${item.label_3 }></div>
											</td>
										</tr>									
									</c:otherwise>
								</c:choose>
								



																			<tr>
											<c:forEach var="point" begin="1" end="${item.form}">
											<td>
												<input type="radio" name="point">
											</td>
											</c:forEach>									
								</tr>



								
								</table>
							</div>
						</c:forEach>
					</div>
					
					<div id="answerAdd" class="pull-left col-lg-12" >
						<div class="btn btn-default btn-sm fileinput-button col-lg-2" id="3point" >
						    <div> <i class="fa fa-1x fa-plus"> 3점 척도</i></div>
						</div> 
						<div class="btn btn-default btn-sm fileinput-button col-lg-2" id="5point">
						    <div> <i class="fa fa-1x fa-plus"> 5점 척도</i></div>
						</div> 
						<div class="btn btn-default btn-sm fileinput-button col-lg-2" id="7point">
						    <div> <i class="fa fa-1x fa-plus"> 7점 척도</i></div>
						</div> 
						<div class="btn btn-default btn-sm fileinput-button col-lg-2" id="9point">
						    <div> <i class="fa fa-1x fa-plus"> 9점 척도</i></div>
						</div> 
						<div class="btn btn-default btn-sm fileinput-button col-lg-2" id="10point">
						    <div> <i class="fa fa-1x fa-plus"> 10점 척도</i></div>
						</div> 
						<div class="btn btn-default btn-sm fileinput-button col-lg-2" id="11point">
						    <div> <i class="fa fa-1x fa-plus"> 11점 척도</i></div>
						</div> 
					</div>	
					
					<jsp:include page="setting_R.jsp"></jsp:include>
				</td>
			</tr>
		</tbody>
	</table>
			<div id="btn_group" class="col-lg-2 pull-right right">
				<button class="btn btn-warning" onclick="fnDeleteQuestion(this.form);">삭제</button>
				<button class="btn btn-theme" onclick="fnUpdateQuestion(this.form);">저장</button>
			</div>
</form>
				
		
				
				
				