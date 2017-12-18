<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="modal-header">
	<button type="button" class="close btn-default" data-dismiss="modal" aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h6 class="modal-title"><font color="#6799FF">비밀번호 입력</font></h6>
</div>
<div class="modal-body" id="modal-body">
	<input type="password" id="sec_password" class="form-control" style="margin-right:10px;">
	
</div>
<div class="modal-footer">
	<button onclick="apply_secret('${vo.cont_uuid}')" class="btn btn-default">전송</button>
</div>