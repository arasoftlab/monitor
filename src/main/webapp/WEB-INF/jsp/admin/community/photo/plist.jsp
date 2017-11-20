<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.thumb{
		width:100%;
		float:left;
	}
	.thumb img{
		width:100%;
	}
</style>

<script>
function fnShowImg(img){
	$('.showImg').modal('show');
	$('#modal-img').attr('src',"/monitor"+img);
}

function fnSearch(){
	$("form").attr("action","plist.do").submit();
}
</script>

<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h4>포토갤러리</h4>
				<div class="form-inline">
					<div id="search-box1" class="col-lg-8" style="padding:0;">
						<form class="pull-left">
							<select class="list_form" name="searchCategory" style="display: inline;">
								<option value="" <c:if test="${empty vo.searchCategory }">selected</c:if>>선택</option>
								<option value="title" <c:if test="${vo.searchCategory eq 'title' }">selected</c:if>>제목</option>
								<option value="description" <c:if test="${vo.searchCategory eq 'description' }">selected</c:if>>내용</option>
							</select>
							<input type="text" class="list_form" name="searchText" value="${vo.searchText }" style="display: inline; width:200px;">
							<input type="button" id="search-button1" value="검색" onclick="fnSearch();">
						</form>
						
					</div>
				</div>
				<div class="col-lg-4" style="padding:0;">

					<button class="btn btn-theme  pull-right" onclick="location.href='<c:url value='/admin/community/photo/pmodify.do'/>';">글쓰기</button>		

				</div>
				
				<table class="table table-bordered table-striped modal_table" style="margin-top:6%;">
					<colgroup>
						<col width="20%;">
						<col width="*;" >
						<col width="7%;">
						<col width="10%;">
					</colgroup>
					<thead>
						<tr>
							<th>사진</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">					
					
									<tr>
										<td rowspan="3">
											<div class="thumb">
												<img src="<c:url value='${item.fileList[0].savePath }/${item.fileList[0].unqFileName }'/>" onclick="fnShowImg('${item.fileList[0].savePath }/${item.fileList[0].unqFileName }');" style="width: 150px;">
											</div>
										</td>
										<td>
											<a href='<c:url value='pview.do?cont_uuid=${item.cont_uuid}'/>'>${item.title }</a>
										</td>
										<td rowspan="3">${item.member_id}</td>
										<td rowspan="3"><fmt:formatDate value="${item.regdate }" pattern="yyyy/MM/dd" /></td>
									</tr>
									<tr>
										<th>내용</th>
									</tr>
									<tr>
										<td class="left">
											<a href='<c:url value='pview.do?cont_uuid=${item.cont_uuid}'/>'>
												${item.description }
											</a> 
										</td>
									</tr>
						
								</c:forEach>
							</c:when>
						</c:choose>
						
						
					</tbody>
				</table>
				<jsp:include page="/WEB-INF/inc/paging.jsp"></jsp:include>
			</div>
			
		</div>
	</div>
	</section>