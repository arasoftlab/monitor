<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	.information{font-size:12px;}
	.history_table td{text-align:center;}
</style>

<script>

fnCheckSession();

</script>


	<!-- 서브 콘텐츠 -->
	<div class="content_right" style="display:block">

		<!-- 게시판 시작 -->
		<h3>현장과제 참여내역</h3>
		<label class="information">▶ 사전연락 없이 결과 미제출 시 차후 3회 과제 동안 모니터 선정에서 제외, 허위보고 시에는 모니터회원 탈퇴 처리됩니다.</label>
		<label class="information">▶ 입금신청일은 재무과에 입금 신청한 날짜로, <span style="color:red;">실제 계좌입금은 7일</span> 전후로 이뤄집니다.</label>
		<div style="text-align:right;">
			<label class="information">※ 참여내역은 2017년 과제부터 조회 가능</label>
		</div>
		
		
		<table class="pc_notice_table" style="width:100%;background:#fff;border:none;border-spacing:0;padding:0; font-size:12px">
			<tr>
				<td>
	  			<table class="table_02 history_table">
						<colgroup>
							<col width="5%;">
							<col width="5%;">
							<col width="*%;">
							<col width="16%;">
							<col width="6%;">
							<col width="8%;">
							<col width="9%;">
							<col width="10%;">
						</colgroup>
						<thead>
							<tr style="background:lightsteelblue;">
								<th>번호</th>
								<th>기수</th>
								<th>과제제목</th>
								<th>보고서 제출기간</th>
								<th>과제수</th>
								<th>결과제출</th>
								<th>활동비</th>
								<th>입금신청일</th>
							</tr>
						</thead>
						<tbody>
						
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">
									<tr>
										<td>${item.rn }</td>
										<td>${item.poll_num }</td>
										<td style="text-align:left;">
											<div style="word-break: break-all;overflow: hidden;display:block; width: 310px;white-space: nowrap;text-overflow: ellipsis;">
												${item.title }
											</div>
										</td>
										<td>
											<fmt:formatDate value="${item.submit_s_date }" pattern="yy/MM/dd" /> ~
											<fmt:formatDate value="${item.submit_e_date }" pattern="yy/MM/dd" />
										</td>
										<td>${item.question_cnt }</td>
										<td>
											<c:if test="${item.question_cnt <= item.apply_cnt}">완료</c:if>
											<c:if test="${item.question_cnt > item.apply_cnt}"><font color="red">${item.apply_cnt }</font></c:if>
										</td>
										<td>
                    <fmt:formatNumber value="${item.pay_sum * item.apply_cnt }" pattern="#,###" />원
                    </td>
										<td>
											<fmt:formatDate value="${item.pay_date }" pattern="yy/MM/dd" />
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="8">등록된 목록이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
						
						</tbody>
						

					</table>
				</td>
			</tr>
		</table>
		
		<table class="mobile_notice_table" style="width:100%;background:#fff;border:none;border-spacing:0;padding:0;">
			<tr>
				<td>
	  
					<table class="table_02 history_table" style="font-size:12px">
						<colgroup>
							<col width="12%;">
							<col width="*%;">
							<col width="20%;">							
							<col width="25%;">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>과제제목</th>
								<th>활동비</th>								
								<th>입금신청일</th>
							</tr>
						</thead>
						<tbody>
						
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">
									<tr>
										<td style="text-align:center;">${item.rn }</td>
										<td style="text-align:left;">
											<div style="word-break: break-all;overflow: hidden;display:block; width: 120px;white-space: nowrap;text-overflow: ellipsis;">
												${item.title }
											</div>
                    </td>
										<td>
										<fmt:formatNumber value="${item.pay_sum * item.apply_cnt }" pattern="#,###" />원
										</td>
										<td>
  										 <fmt:formatDate value="${item.pay_date }" pattern="yy/MM/dd" />
										</td>
									</tr>
								</c:forEach>	
							</c:when>
						</c:choose>					

						</tbody>
						

					</table>
				</td>
			</tr>
		</table>
		
		<jsp:include page="/WEB-INF/inc/paging.jsp"></jsp:include>

		<div class="clearfix divider_dashed7"></div>
 
	</div>


