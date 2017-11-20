<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<select class="form-control" name="subject_id" id="subject_s_id"
	onchange="fnSetDate(this);">
	<c:choose>
		<c:when test="${!empty unLinkedSubjectList }">
			<option value="">연결할 수행과제를 선택하세요.</option>
			<c:forEach var="subject" items="${unLinkedSubjectList }">
				<option value="${subject.subject_id }"
					data-apply_s_date="<fmt:formatDate value='${subject.apply_s_date }' pattern='yyyy/MM/dd' />"
					data-apply_e_date="<fmt:formatDate value='${subject.apply_e_date }' pattern='yyyy/MM/dd' />"
					data-submit_s_date="<fmt:formatDate value='${subject.submit_s_date }' pattern='yyyy/MM/dd' />"
					data-submit_e_date="<fmt:formatDate value='${subject.submit_e_date }' pattern='yyyy/MM/dd' />"
					<c:if test="${subject.subject_id eq vo.subject_id }">selected</c:if>>
					${subject.title }</option>
			</c:forEach>
		</c:when>
	</c:choose>
</select>