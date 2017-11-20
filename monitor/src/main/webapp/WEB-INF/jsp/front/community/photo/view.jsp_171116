
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>


function onModify()
{
	location.href="write.do?cont_uuid=${vo.cont_uuid}"				
}

function onDelete(bbs_id)
{
	if(confirm("삭제 하시겠습니까?")){
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/front/community/story/delete.do'/>",
			data : { "bbs_id" : bbs_id },
			success : function(data){
				if(data.result == "success"){
					location.href="<c:url value='/front/community/photo/photo_list.do'/>";
				}else{
					alert("삭제된 데이터가 없습니다.");
				}
			},
			error : function(request,status,error) {
				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
	}
}

</script>

<!-- 서브 콘텐츠 -->
<div class="content_right" style="display:block">
		<h3>포토갤러리</h3>
<!-- PC 화면 -->		
		<table class="pc_notice_table" style="width:100%;background:#fff;padding:0;border:none;border-spacing:0;">
			<tr>
				<td>
					<table class="table_02" style="font-size:12px;">
						<colgroup>
							<col width="15%;">
							<col width="40%;">
							<col width="15%;">
							<col width="30%;">														
						</colgroup>
						<tbody>
							<tr>
								<th>제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
								<td colspan="3"><b>${vo.title }</b></td>
							</tr>
							<tr align="center">
								<th>등&nbsp;록&nbsp;일</th>
								<td>
									<fmt:formatDate value="${vo.regdate }" pattern="yyyy/MM/dd HH:mm:ss" />
								</td>
								<th>작&nbsp;성&nbsp;자</th>
								<td>
								<c:out value="${fn:substring(vo.member_id , 0, 3)}" />**
								</td>
							</tr>								
							<tr>
								<th>내&nbsp;&nbsp;&nbsp;&nbsp;용</th>
								<td colspan="3">${vo.description}</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align: center;">
									<img src="<c:url value='${vo.fileList[0].savePath }/${vo.fileList[0].unqFileName }'/>" style="width:100%">
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</table>

	


<!-- 모바일 화면 -->	

		<table class="mobile_notice_table" style="width:100%;background:#fff;padding:0;border:none;border-spacing:0;">
			<tr>
				<td>
					<table class="table_02" style="font-size:12px;">
						<colgroup>
							<col width="20%;">
							<col width="80%;">
						</colgroup>
						<tbody>
							<tr>
								<th>제&nbsp;&nbsp;목</th>
								<td><b>${vo.title }</b></td>
							</tr>
							<tr>
								<th>등록일</th>
								<td>
									<fmt:formatDate value="${vo.regdate }" pattern="yyyy/MM/dd HH:mm:ss" />
								</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>								
									<c:out value="${fn:substring(vo.member_id , 0, 3)}" />**
								</td>
							</tr>							
							<tr>
								<th colspan="2">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
							</tr>								
							<tr>							
								<td colspan="2">${vo.description}</td>
							</tr>
							<tr>
								<td colspan="2">
									<img src="<c:url value='${vo.fileList[0].savePath }/${vo.fileList[0].unqFileName }'/>" style="width:100%">
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</table>



		<div style="text-align:right;margin-top:20px;">
			<c:if test="${vo.member_id eq member_id}" >
				<button type="button" class="btn  btn-info button_blue button_white" onclick="onModify()">수정</button>
				<button type="button" class="btn  btn-warning button_blue button_white" onclick="onDelete('${vo.bbs_id}')">삭제</button>
			</c:if>
			<button type="button" class="btn  btn-primary button_blue button_white" onclick="location.href='<c:url value='photo_list.do'/>'">목록</button>
		</div>
		<div class="clearfix divider_dashed7"></div>
	
	</div>
	
	
	