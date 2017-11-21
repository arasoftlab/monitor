<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="<c:url value='/js/smartEditor/js/HuskyEZCreator.js'/>"></script>
<script type="text/javascript">


function onSave()
{
	if ($("#title").val() == "")
	{
		alert("제목을 입력해주세요.")
		return false;		
	}
	
	$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/front/community/story/save.do'/>",
			data : $("form").serialize(),
			success : function(data){
				if(data.result == "success"){
					location.href='list.do';
				}else{
					alert("저장된 데이터가 없습니다.");
				}
			},
			error : function(request,status,error) {
				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
}	
</script>


	<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<form>
					<input type="hidden" name="cont_uuid" value="${vo.cont_uuid}">
					<input type="hidden" name="type" value="S">
					
					
					
					<table class="table table-bordered table-margin">
						<tbody>
							<tr>
								<td class="td1">*제목</td>
								<td colspan=3 class="left">
									<input type="text" value="${vo.title }"  class="form-control" name="title" id="title">
								</td>
							</tr>

							<tr>
								<td class="td1">작성자</td>
								<td colspan=3 class="left">
									<input type="text" name="member_id" id="member_id" style="width:50%;" value="${member_id }" readonly>
								</td>
							</tr>

							<tr>
								<td class="td1">*내용</td>
								<td colspan=3 class="left">
									<jsp:include page="/WEB-INF/inc/editor1.jsp"></jsp:include>
								</td>
							</tr>
							<tr>
								<td class="td1">비밀번호</td>
								<td colspan=3 class="left">
									<input type="text"  class="form-control" name="password" style="width:50%;" ><br/>
									<input type="checkbox" name="is_password" value="Y" style="padding:10px;">비밀글일경우 체크해주세요
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="col-lg-3 pull-right right">
				<button class="btn btn-default" onclick="location.href='list.do';">취소</button>
				<button class="btn btn-theme " onclick="onSave();">등록</button>
				<button class="btn btn-info " onclick="location.href='<c:url value='/admin/community/story/list.do'/>';">목록</button>
			</div>
		</div>
	</div>ㄴ
	</section>
	