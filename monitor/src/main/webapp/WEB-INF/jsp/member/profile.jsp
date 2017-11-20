<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
	function fnSave() {
		
		/* $.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/member/checkId.do'/>",
			data : $("form").serialize(),
			success : function(data) {
				if (data.result == "success") {
					fnUpdateMember();
				} else {
					alert("중복된 아이디가 존재 합니다.");
					$("input[name='id']").focus();
				}
			},
			error : function() {
				alert("error!!");
			}
		}); */
		
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/member/checkSession.do'/>",
			success : function(data){
				if(data.result == "success"){
					fnUpdateMember();
				}else{
					alert("세션이 끊겼습니다./n로그인 후 이용하세요.");
					location.href="<c:url value='/member/loginView.do'/>";
				}
			},
			error : function(request,status,error) {
				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
		
	}
	
	function fnUpdateMember(){
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/member/updateMember.do'/>",
			data : $("form").serialize(),
			success : function(data) {
				if (data.result == "success") {
					alert("로그인 정보가 수정 되었습니다.");
					$("form").attr("action", "<c:url value='/admin/performEduStd/list.do'/>").submit();
				} else {
					alert("로그인 정보가 일치하지 않습니다.\n확인 후 다시 시도 하세요.");
				}
			},
			error : function() {
				alert("error!!");
			}
		});
	}
</script>
	
<h2>계정정보 수정</h2>
<p class="h2_p"></p>
<form class="form" method="post">
	<table>
		<colgroup>
			<col style="width:150px;"/>
			<col style="width:*;"/>
		</colgroup>
		<tbody>
			<tr>
				<th>아이디</th>
				<td><input type="text" class="w90p" name="id" value="${member.id }"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" class="w90p" name="password" value="${member.password }"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" class="w90p" name="name" value="${member.name }"></td>
			</tr>
			<tr>
				<td colspan="2" class="text-right"><a href="javascript:fnSave();" class="btn0">저장</a></td>
			</tr>
		</tbody>
	</table>
</form>
	
	
