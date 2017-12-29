<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<h5>서울시 회원정보</h5>
<table class="table table-bordered table-margin">
	<tbody>
		<tr>
			<td class="td1">이름</td>
			<td class="left_t">
			${vo.name}
				<c:if test="${mem.sex eq 'M'}">(남자)</c:if>
				<c:if test="${mem.sex eq 'W'}">(여자)</c:if>
				<c:if test="${empty mem.sex}">(성별 미등록)</c:if>
			, <b>${vo.id}</b>
			</td>
			<td class="td1">기수</td>
			<td class="left_t">${mem.poll_num}</td>
		</tr>
		<tr>

			<td class="td1">생년월일</td>
			<td class="left_t">
				${fn:substring(vo.birthday,0,8)}
			</td>
			<td class="td1">직업</td>
			<td class="left_t">${mem.job}</td>
		</tr>
		<tr>
			<td class="td1">연락처</td>
			<td class="left_t">${vo.phone }</td>
			<td class="td1">이메일</td>
			<td class="left_t">${vo.email }</td>
		</tr>
		<tr>
			<td class="td1">거주지</td>
			<td class="left_t">${mem.sido } ${mem.gugun } ${mem.dong }</td>
			<td class="td1">회원등급</td>
			<td class="left_t">
				<c:if test="${mem.grade eq 'nomal'}">정회원</c:if> 
				<c:if test="${mem.grade eq 'secession'}">탈퇴회원</c:if> 
				<c:if test="${mem.grade eq 'apply'}">신청회원</c:if> 
			</td>
		</tr>
		<tr>
			<td class="td1">가입일자</td>
			<td class="left_t">
				<fmt:formatDate value="${mem.regdate}" pattern="yyyy/MM/dd" />
			</td>
			<td class="td1">최근접속일자</td>
			<td class="left_t">
				<fmt:formatDate value="${mem.login_date}" pattern="yyyy/MM/dd" />
			</td>
		</tr>
		<tr>
			<td class="td1">회원메모</td>
			<td colspan="3" class="left_t">
				<input type="text" name="memo" class="form-control" value="${mem.memo }"></input>
			</td>
		</tr>
		
		<c:if test="${mem.grade eq 'secession'}">
			<tr>
				<td class="td1"><b>탈퇴일자</b></td>
				<td colspan="3" class="left_t">

					<fmt:formatDate value="${mem.secession_date}" pattern="yyyy/MM/dd" />
				</td>		
			</tr>
			<tr>
				<td class="td1" ><b>탈퇴사유</b></td>
				<td colspan="3" class="left_t">
					${mem.secession_disc}
				</td>
			</tr>
		</c:if>
		
		
	</tbody>
</table>
<h5>과제 정보</h5>
<table class="table table-bordered table-margin">
	<tbody>
		<tr>
			<td class="td1">총 신청횟수</td>
			<td class="left_t">${act.apply_cnt } 회</td>
			<td class="td1">종 선정횟수</td>
			<td class="left_t">${act.selected_cnt } 회</td>
		</tr>
		<tr>
			<td class="td1">미응답</td>
			<td colspan="3" class="left_t">${act.tmp_sum1 } 회</td>
		</tr>
	</tbody>
</table>


<div class="modal-footer">
	<button type="button" class="btn btn-success" onclick="save_memo('${mem.id}')">메모저장</button>
	<button type="button" class="btn btn-theme modal_btn" onclick="view_team_info_pop('${mem.id}','${mem.poll_num}', '${act.subject_id}' )">신청 및 참여과제리스트</button>
	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>