<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="<c:url value='/js/smartEditor/js/HuskyEZCreator.js'/>"></script>

<script type="text/javascript">
$(function(){
	if(undefined != $.cookie("settingVisible") && isEmpty($.cookie("settingVisible"))){
		$("#collapseOne_${vo.question_id}").addClass("in");
	}
	
	$("#collapseOne_${vo.question_id}").on("shown.bs.collapse", function(){
		$.cookie("settingVisible", "");
	});
	$("#collapseOne_${vo.question_id}").on("hidden.bs.collapse", function(){
		$.cookie("settingVisible", "in");
	});
});
</script>



<div class="col-lg-12 panel-group pull-left" style="margin-top: 15px;">
	<div class="panel panel-default">
	    <div class="panel-heading">
	      <h4 class="panel-title">
	        <a role="button" data-toggle="collapse" href="#collapseOne_${vo.question_id}">옵션</a>
	      </h4>
	    </div>
	    <div id="collapseOne_${vo.question_id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
	    	<div class="panel-body">
				<table class="table table-bordered table-margin">
					<tbody>
						<tr>
							<td class="td1">미디어</td>
							<td colspan=3 class="left"> 
								<div id="search-box1" class="col-md-12 ">
								
  
									<select class="quest_form" style="margin-bottom:10px; width:70%;" name="cont_type" onchange="onSetting_TypeChange('${vo.question_id}','#q_form_${vo.question_id }')">
										<option value="">참조데이터 없음</option>
										<option value="V" <c:if test="${vo.cont_type eq 'V'}"> selected </c:if> >동영상(Video)데이터</option>
										<option value="I" <c:if test="${vo.cont_type eq 'I'}"> selected </c:if> >이미지(Image)데이터</option>
									</select>

									<c:choose>
										<c:when test="${vo.cont_type eq 'V'}">
											<div class="answer">
											
												<c:forEach var="item" items="${settingsList }" varStatus="i">
													<div id="setting_${item.idx }" class="optionList row"
														data-question_id="${item.question_id }"
														data-idx="${item.idx }">
														

														
														<input type="hidden" name="questionSettingsVO[${i.index }].idx"	value="${item.idx }"> 
														<input type="hidden" name="questionSettingsVO[${i.index }].type" value="${vo.cont_type}"> 
														<input type="hidden" name="questionSettingsVO[${i.index }].cont_uuid" value="${item.cont_uuid}">
														<div class="col-lg-12">
														
															<div class="col-sm-6  input-group" style="float: left;">
																<input type="text" class="quest_form" name="questionSettingsVO[${i.index}].title" value="${item.title }" />
	
																<div class="input-group-addon droppable">
																	<i class="fa fa-1x fa-arrows-v"></i>
																</div>
															</div>
	
															<div class="col-sm-2" style="padding-left: 10px; width: 105px;">
																<div class="col-sm-5">
																	<a id="btn_del"	class="btn btn-default btn-sm icon_btn delete"	onclick="fnDeleteSettings('${item.idx}');"> 
																		<i class="fa fa-1x fa-times"></i>
																	</a>
																</div>
																<div id="pollImageAdd" class="col-sm-4">
																	<div class="btn btn-default btn-sm fileinput-button icon_btn">
																		<i class="fa fa-1x fa-picture-o"> 																	
																			<c:choose>
																				<c:when test="${!empty item.fileList }">
																					<input type="file" class="file_input" name="QS_file_setV${item.idx}" onchange="QS_fnFileCheck_update('V${item.idx}' , '${item.cont_uuid}' , '_${vo.question_id}')"/>
																				</c:when>
																				<c:otherwise>
																					<input type="file" class="file_input" name="QS_file_setV${item.idx}" onchange="QS_fnFileCheck('V${item.idx}' , '${item.cont_uuid}' , '_${vo.question_id}')"/>
																				</c:otherwise>																
																			</c:choose>																	
																		</i>
																	</div>
																	
																															
																</div>
															</div>
														</div>
														<div class="col-lg-12">
															<div id="QS_fileListV${item.idx }">  										
																<c:forEach var="file" items="${item.fileList }">

																	<video width="250px" controls="controls"class="video-js vjs-default-skin" data-setup="{}">
																	<source src="<c:url value='${file.savePath }/${file.unqFileName }'/>" type="video/mp4" />
																	</video>
																	
																</c:forEach>
															</div>
																	
														</div>
														
														
													</div>

												</c:forEach>
												
											</div>

											<div id="answerAdd" class="pull-left col-lg-12">
												<div class="btn btn-default btn-sm fileinput-button"
													onclick="fnInsertQuestionSettings('#q_form_${vo.question_id }');">
													<div>
														<i class="fa fa-1x fa-plus"> 미디어추가</i>
													</div>
												</div>
											</div>
										</c:when>
										
										
										
										
										<c:when test="${vo.cont_type eq 'I'}">
											<div class="answer">
											
												<c:forEach var="item" items="${settingsList }" varStatus="i">
													<div id="setting_${item.idx }" class="optionList row"
														data-question_id="${item.question_id }"
														data-idx="${item.idx }">
														

														
														<input type="hidden" name="questionSettingsVO[${i.index }].idx"	value="${item.idx }"> 
														<input type="hidden" name="questionSettingsVO[${i.index }].type" value="${vo.cont_type}"> 
														<input type="hidden" name="questionSettingsVO[${i.index }].cont_uuid" value="${item.cont_uuid}">
														<div class="col-lg-12">
														
															<div class="col-sm-6  input-group" style="float: left;">
																<input type="text" class="quest_form" name="questionSettingsVO[${i.index}].title" value="${item.title }" />
	
																<div class="input-group-addon droppable">
																	<i class="fa fa-1x fa-arrows-v"></i>
																</div>
															</div>
	
															<div class="col-sm-2" style="padding-left: 10px; width: 105px;">
																<div class="col-sm-5">
																	<a id="btn_del"	class="btn btn-default btn-sm icon_btn delete"	onclick="fnDeleteSettings('${item.idx}');"> 
																		<i class="fa fa-1x fa-times"></i>
																	</a>
																</div>
																<div id="pollImageAdd" class="col-sm-4">
																	<div class="btn btn-default btn-sm fileinput-button icon_btn">
																		<i class="fa fa-1x fa-picture-o"> 																	
																			<c:choose>
																				<c:when test="${!empty item.fileList }">
																					<input type="file" class="file_input" name="QS_file_setI${item.idx}" onchange="QS_fnFileCheck_update('I${item.idx}' , '${item.cont_uuid}' , '_${vo.question_id}')"/>
																				</c:when>
																				<c:otherwise>
																					<input type="file" class="file_input" name="QS_file_setI${item.idx}" onchange="QS_fnFileCheck('I${item.idx}' , '${item.cont_uuid}' , '_${vo.question_id}')"/>
																				</c:otherwise>																
																			</c:choose>																	
																		</i>
																	</div>
																	
																															
																</div>
															</div>
														</div>
														<div class="col-lg-12">
															<div id="QS_fileListI${item.idx }">  										
																<c:forEach var="file" items="${item.fileList }">
																	<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" style="width: 150px;">
																</c:forEach>
															</div>
																	
														</div>
														
														
													</div>

												</c:forEach>
											</div>

											<div id="answerAdd" class="pull-left col-lg-12">
												<div class="btn btn-default btn-sm fileinput-button"
													onclick="fnInsertQuestionSettings('#q_form_${vo.question_id }');">
													<div>
														<i class="fa fa-1x fa-plus"> 이미지추가</i>
													</div>
												</div>
											</div>
										</c:when>
										<c:otherwise>										
										</c:otherwise>
									</c:choose>
								</div>
								<!--  
								
								-->
							</td>
						</tr>
						

						<tr>
							<td class="td1">총 서열 수</td>
							<td colspan=3 class="left"> 
								<div class="form-group">
									<div class="col-sm-4">
										<input type="text" name="required_cnt" value="${vo.required_cnt }" class="quest_form">
									</div>
									<label class="control-label" for="formGroupInputLarge" style="margin-top:7px;">개</label>
								</div>
							</td>
						</tr>
						
						<!-- 비활성화  
						<tr>
							<td class="td1">입력합</td>
							<td colspan=3 class="left"> 
								<div class="form-group">
									<div class="col-sm-4">
										<input type="text" name="required_sum" value="${vo.required_sum }"  class="quest_form">
									</div>
								</div>
							</td>
						</tr>
						-->
						<tr>
							<td class="td1">다음문항</td>
							<td colspan=3 class="left"> 
								<div class="form-group">
									<div class="col-sm-4">
										<input type="text" name="next_num" value="${vo.next_num }" class="quest_form">
									</div>
									<label class="control-label" for="formGroupInputLarge"style="margin-top:7px;">번</label>
								</div>
							</td>
						</tr>
						<!--  
						<tr>
							<td class="td1">응답분기</td>
							<td colspan=3 class="left"> 
								<div id="search-box1" style="padding:0;">
									<c:choose>
										<c:when test="${!empty prevSQuestionList }">
											<select class="quest_form" style="width:45%;">
												<option value="">선택</option>
												<c:forEach var="item" items="${prevSQuestionList }">
													<option value="${item.question_id }">${item.title }</option>
												</c:forEach>
											</select>
										</c:when>
										<c:otherwise>
											분기 가능한 이전 질문이 없습니다.
										</c:otherwise>
									</c:choose>
								</div>
							</td>
						</tr>
						-->
						<tr>
							<td class="td1">종료</td>
							<td colspan=3 class="left">
								<textarea rows="20" cols="145" name="close_comment" style="height: 150px;" class="quest_form">${vo.close_comment }</textarea>													
							</td>
						</tr>
					</tbody>
				</table>
			</div>
    	</div>
  	</div>
</div>
				