<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<form>

<input type="hidden" id="location" value="I">
<input type="hidden" name="grade" value="admin">

<table class="table table-bordered table-margin">
	<tbody>
		<tr>
			<td class="td1 width">* 아&nbsp;이&nbsp;디</td>
			<td colspan="3" class="left"><input type="text" id="id" name="id"
				class="form-control" ></td>
		</tr>
		<tr>
			<td class="td1 width">* 비밀번호</td>
			<td colspan="3" class="left"><input type="password"
				id="password" name="password"  class="form-control" ></td>
		</tr>
		<tr>
			<td class="td1 width">* 이&nbsp; &nbsp; &nbsp; &nbsp;름</td>
			<td colspan="3" class="left"><input type="text" id="name" name="name"
				class="form-control" ></td>
		</tr>
		<tr>
			<td class="td1 width">* 연&nbsp;락&nbsp;처</td>
			<td colspan="3" class="left"><input type="text" id="phone" name="phone"
				class="form-control" ></td>
		</tr>
	</tbody>
</table>

</form>
