<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="<c:url value='/js/smartEditor/js/HuskyEZCreator.js'/>"></script>
<script type="text/javascript">
$(function(){
	
	if(undefined != $.cookie("settingVisible") && isEmpty($.cookie("settingVisible"))){
		$("#collapseOne").addClass("in");
	}
	
	$("#collapseOne").on("shown.bs.collapse", function(){
		$.cookie("settingVisible", "");
	});
	$("#collapseOne").on("hidden.bs.collapse", function(){
		$.cookie("settingVisible", "in");
	});
});
</script>

<div class=" panel-group pull-left" style="margin-top: 15px;">
	<div class="panel panel-default">
	    <div class="panel-heading">
	      <h4 class="panel-title">
	        <a role="button" data-toggle="collapse" href="#collapseOne">옵션</a>
	      </h4>
	    </div>
	    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
	    	<div class="panel-body">
				<table class="table table-bordered table-margin">
					<tbody>
						<tr>
							<td class="td1">미디어</td>
							<td colspan=3 class="left"> 
								<div id="search-box1" class="col-md-6 ">
									<select class="quest_form" style="margin-bottom:10px; width:70%;">
										<option value="">참조데이터 없음</option>
										<option value="video">동영상(Video)데이터</option>
										<option value="image">이미지(Image)데이터</option>
									</select>
								</div>
								<jsp:include page="/WEB-INF/inc/fileUpload_question.jsp"></jsp:include>
							</td>
						</tr>
						<tr>
							<td class="td1">필수응답 수</td>
							<td colspan=3 class="left"> 
								<div class="form-group">
									<div class="">
										<input type="text" name="required_cnt" value="${vo.required_cnt }" class="quest_form">
									</div>
									<label class="control-label" for="formGroupInputLarge" style="margin-top:7px;">개</label>
								</div>
							</td>
						</tr>
						<tr>
							<td class="td1">입력합</td>
							<td colspan=3 class="left"> 
								<div class="form-group">
									<div class="">
										<input type="text" name="required_sum" value="${vo.required_sum }"  class="quest_form">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="td1">다음문항</td>
							<td colspan=3 class="left"> 
								<div class="form-group">
									<div class="">
										<input type="text" name="next_num" value="${vo.next_num }" class="quest_form">
									</div>
									<label class="control-label" for="formGroupInputLarge"style="margin-top:7px;">번</label>
								</div>
							</td>
						</tr>
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
				