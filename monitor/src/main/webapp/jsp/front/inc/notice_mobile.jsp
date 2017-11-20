
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

		<table style="width:100%;background:#fff;padding:0;border:none;border-spacing:0;" class="mobile_notice_table">
			<tr>
				<td>
				<!-- 카테고리 -->
	  					<table class="table_02">
						<!-- 타이틀 -->
						<tr align="center" height="30" bgcolor="#F7F7F7">
							<td class="att_title">
								<font style='color:#000000;font-size:12px;'>번호</font>
							</td>
							<td class="att_title">
								<font style='color:#000000;font-size:12px;'>제목</font>
							</td>
						</tr>
						  <!-- 내용 -->
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">
									<tr align='center' style="cursor:pointer" >
										<td class="bbsno">${item.rn }</td>
										<td class='bbsnewf5' align='left'>
											<span class="notice_subject"><a href='<c:url value='/front/notice/all/view.do?notice_id=${item.notice_id }'/>'>${item.title }</a></span>
										</td>
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