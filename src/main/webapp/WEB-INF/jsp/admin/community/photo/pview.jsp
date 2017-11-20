<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/jf-taglib.tld" prefix="j"%>

<link href="//vjs.zencdn.net/4.9/video-js.css" rel="stylesheet">
<script src="<c:url value='/js/video.js'/>"></script>

<script>

function onModify()
{
	location.href="pmodify.do?cont_uuid=${vo.cont_uuid}"				
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
					location.href="<c:url value='plist.do'/>";
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

<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
			
				<table class="table table-bordered table-margin">
					<tbody>
						<tr>
							<td class="td1">제목</td>
							<td colspan=3 class="left"><b>${vo.title }</b></td>
						</tr>

						<tr>
							<td class="td1">작성자</td>
							<td colspan=3 class="left">
								${vo.member_id }
							</td>
						</tr>

						<tr>
							<td class="td1">작성일</td>
							<td colspan=3 class="left">
								<fmt:formatDate value="${vo.regdate }" pattern="yyyy/MM/dd" />
							</td>
						</tr>
						
						<tr>
							<td class="td1">내용</td>
							<td colspan=3 class="left">
								<p>${vo.description}</p>
							</td>
						</tr>
						<tr>
							<td class="td1">이미지 첨부</td>
							<td colspan=3 class="left">
								<img src="<c:url value='${vo.fileList[0].savePath }/${vo.fileList[0].unqFileName }'/>" >
							</td>
						</tr>
					</tbody>
				</table>
				
			</div>
			<div class="col-lg-2 pull-right right">
 
				<button class="btn btn-warning " onclick="onDelete('${vo.bbs_id}');">삭제</button>

				<button class="btn btn-theme " onclick="onModify()">수정</button>
				<button class="btn btn-info " onclick="location.href='<c:url value='/admin/community/photo/plist.do'/>';">목록</button>
			</div>
		</div>
	</div>
	</section>