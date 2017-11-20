
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

		<table class="mobile_notice_table" style="width:100%;background:#fff;padding:0;border:none;border-spacing:0;">
			<tr>
				<td>
				<!-- 카테고리 -->
					<table class="table_02" style="font-size:9pt;">
						<!-- 타이틀 -->
						<tr align="center" height="30" bgcolor="#F7F7F7">
							<td class="att_title">
								<font style='color:#000000;'>번호</font>
							</td>
							<td class="att_title">
								<font style='color:#000000;'>과제명</font>
							</td>					
						</tr>
						  <!-- 내용 -->

						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">
									<tr align='center' height='28' style="cursor:pointer" >
										<td class="bbsno">${item.rn }</td>
										<td class='bbsnewf5' align='left'>
											<span class="monitor_subject"><a href='<c:url value='/front/monitoring/monitoring/view.do?subject_id=${item.subject_id }'/>'>${item.title }</a></span>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7" style="text-align: center;">등록된 글이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>


					</table>


					<jsp:include page="/WEB-INF/inc/paging.jsp"></jsp:include>

					<!-- 검색 -->
					<form name='com_board_search' method='post'>
						<div id="ext_search" style="text-align:center; padding-top:20px;">
							<table style="width:100%;">
								<tr>
									<td>
										<table id="search_table">
											
											<tr>
												<td class="est_cate_cell">
													<select title="select" name='searchCategory' class="cateform" style="height:100%;">
														<option value='title' >과제 제목</option>
														<option value='description' >내용</option>
													</select>
												</td>
												<td class="est_keyword_cell">
													<div id='search_display1' style='display:block;'>
														<input title="input" alt="" type='text' class="keywordform"  name='searchText' chk="y"  style="font-size:16px;height:100%;" />
													</div>
												</td>
												<td class="est_btn_cell">
													<input title="input" alt="" type='image' src='<c:url value='/img/front/search.gif'/>' style="height:100%;border:none;" >
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>
					</form>
					<!-- //검색 -->
				</td>
			</tr>
		</table>
		<!-- 게시판 끝 -->