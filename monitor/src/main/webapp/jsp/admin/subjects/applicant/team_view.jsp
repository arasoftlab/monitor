<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:choose>
	<c:when test="${!empty vo }">
		<c:forEach var="item" items="${apply_list }" varStatus="i">
			
			<table class="table table-bordered table-striped modal_table"
			style="margin-top: 8%; width: 18%; margin-left: 2%; float: left; font-size:13px">

			<thead>
				<tr>
					<th style="min-width:10px">조</th>
					<th style="min-width:45px">신청</th>
					<th style="min-width:45px">선정</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${i.index+1}</td>
					<td>${item }</td>
					<td>${selected_list[i.index] }</td>
				</tr>
			</tbody>

		</table>
			
		</c:forEach>
	</c:when>
</c:choose>


