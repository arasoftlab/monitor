<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
function fnSave(){

	if ( $("#id").val().trim() == "" )
	{
		alert("ID를 입력하세요.");
		return;	
	}
	
	if ( $("#password").val().trim() == "" )
	{
		alert("암호를 입력하세요.");
		return;	
	}
	
	if ( $("#dept").val().trim() == "" )
	{
		alert("부서를 입력하세요.");
		return;	
	}
	
	if ( $("#allowip").val().trim() == "" )
	{
		alert(" IP를 입력하세요.");
		return;	
	}
	
	if ( $("#name").val().trim() == "" )
	{
		alert("이름을 입력하세요.");
		return;	
	}
	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/setting/createadmin.do'/>",
		data : $("form").serialize(),
		success : function(data){
			if(data.result == "success"){
								
				location.href="<c:url value='/admin/settting/info.do'/>";
				
			}else{
				alert("관리자가 등록되지 않았습니다.");
			}
		},
		error : function(request,status,error) {
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

function fnDelete(){
	if(confirm("삭제 하시겠습니까?")){
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/admin/setting/deleteadmin.do'/>",
			data : $("form").serialize(),
			success : function(data){
				if(data.result == "success"){
					location.href="<c:url value='/admin/notice/list.do'/>";
				}else{
					alert("삭제된 데이터가 없습니다.");
				}
			},
			error : function(request,status,error) {
				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
	}
}

</script>


			<form>

<table class="table table-bordered table-margin">
	<tbody>
		<tr>
			<td class="td1 width">* 아이디</td>
			<td colspan="3" class="left">
				<input type="text" id="id" name="id" class="form-control" value="${vo.id}" autocomplete="off">
			</td>
		</tr>
		<tr>
			<td class="td1 width">* 비밀번호</td>
			<td colspan="3" class="left">
				<input type="password" id="password" name="password"  class="form-control" value="${vo.password}" autocomplete="off">
			</td>
		</tr>
		<tr>
			<td class="td1 width">* 이름</td>
			<td colspan="3" class="left">
				<input type="text" id="name" name="name"  class="form-control" value="${vo.name}" autocomplete="off">
			</td>
		</tr>
		<tr>
			<td class="td1 width">* 부서</td>
			<td colspan="3" class="left">
				<input type="text" id="dept" name="dept" class="form-control" value="${vo.dept}" autocomplete="off">
			</td>
		</tr>
		<tr>
			<td class="td1 width">* IP</td>
			<td colspan="3" class="left">
				<input type="text" id="allowip" name="allowip"  class="form-control" value="${vo.allowip}" autocomplete="off">
			</td>
		</tr>
		<tr>
			<td class="td1 width">* 연락처</td>
			<td colspan="3" class="left">
				<input type="text" id="phone" name="phone" class="form-control" value="${vo.phone}" autocomplete="off">
			</td>
		</tr>
	</tbody>
</table>

			</form>
			
