
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
function fnSearch(){
	$("form").attr("action","list.do?stype=${vo.stype}").submit();
}
</script>



	<!-- 서브 콘텐츠 -->
	<div class="content_right" style="display:block">
  <h3>공지사항</h3>
		<!-- 게시판 시작 -->
		
		<jsp:include page="/WEB-INF/jsp/front/inc/notice_mobile.jsp"></jsp:include>

		<table class="pc_notice_table" style="width:100%;background:#fff;border:none;border-spacing:0;padding:0;">
			<tr>
				<td>
				<!-- //카테고리 -->
	  
					<table class="table_02">
						<tr align="center" style="background:lightsteelblue;">
					  <!-- //타이틀 -->
							<td class="att_title" style="width:7%;">
								<font style='color:#000;font-size:12px;'>번호</font>
							</td>
							<td class="att_title">
								<font style='color:#000;font-size:12px;'>제목</font>
							</td>
							<td class="att_title" style="width:13%;">
								<font style='color:#000;font-size:12px;'>공지종류</font>
							</td>
							<td class="att_title" style="width:15%;">
								<font style='color:#000;font-size:12px;'>등록일</font>
							</td>
							<td class="att_title" style="width:8%;">
								<font style='color:#000;font-size:12px;'>조회수</font>
							</td>

						</tr>

						  <!-- 항목 -->
						  
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">
									<tr align='center'>
										<td class="bbsno"><font style='font-size:12px;'>${item.rn }</font></td>
										<td class='bbsnewf5' align='left'>
											<span class="notice_subject"><a href='<c:url value='/front/notice/all/view.do?notice_id=${item.notice_id }&stype=${vo.stype }'/>'>${item.title }</a></span>
										</td>
										<td class="bbswriter"><font style='font-size:12px;'>${item.typeText }</font></td>
										<td class="bbsetc_dateof_write"><font style='font-size:12px;'><fmt:formatDate value="${item.regDate }" pattern="yyyy/MM/dd" /></font></td>
										<td class="bbsetc_dateof_write"><font style='font-size:12px;'>${item.hits }</font></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7">등록된 글이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>

					</table>
					<jsp:include page="/WEB-INF/inc/paging.jsp"></jsp:include>
				</td>
			</tr>
		</table>
		<!-- 게시판 끝 -->


					<!-- 검색 -->
						<form name='com_board_search' method='post'>
     				<div id="ext_search" style="text-align:center; padding-top:20px;">
									<table id="search_table">
											<tr>
												<td class="est_cate_cell">
													<select title="select" name='type' class="form-control cateform" style="height:100%;" >
														<option value=""  <c:if test="${empty vo.type  }">selected</c:if>>전체</option>
														<option value="F" <c:if test="${vo.type eq 'F' }">selected</c:if>>현장과제</option>
														<option value="V" <c:if test="${vo.type eq 'V' }">selected</c:if>>설문과제</option>
														<option value="S" <c:if test="${vo.type eq 'S' }">selected</c:if>>단순,일반공지</option>
													</select>																																	
												</td>
												<td class="est_cate_cell">
													<select title="select" name='searchCategory' class="form-control cateform" >
														<!-- option value="" <c:if test="${empty vo.searchCategory }">selected</c:if>>선택</option -->
														<option value="title" <c:if test="${vo.searchCategory eq 'title' }">selected</c:if>>제목</option>
														<!-- option value="description" <c:if test="${vo.searchCategory eq 'description' }">selected</c:if>>내용</option -->
													</select>
												</td>
												<td class="est_keyword_cell">
													<div id='search_display1' style='display:block;'>
														<input title="input" alt="" type="text" name="searchText" class="form-control keywordform" value="${vo.searchText }"  name='com_board_search_value' chk="y"  />
													</div>
												</td>
												<td class="est_btn_cell">
													<input title="input" class="form-control" alt="" type='image' src='<c:url value='/img/front/search.gif'/>'  onclick="fnSearch();" >
												</td>
											</tr>
										</table>
       				</div>
   				</form>

					<!-- //검색 -->
					
							<div class="clearfix divider_dashed7"></div>
	</div>
