<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
 
  /*
    현 접속자의 IP를 구합니다.
  */
  String cIp = request.getRemoteAddr();
  /*
    허가된 IP목록 입니다.
    아래 배열에 추가 하면 해당 IP에 대해 access가 허용 됩니다.
  */
  String aIpTable[] = { "210.90.46.250", "localhost", "127.0.0.1", "0:0:0:0:0:0:0:1" };
  int i;
  int iOk = 0;
  for( i = 0; i < aIpTable.length; i++ ) {
       if( aIpTable[ i ].equals(cIp) ){
           iOk = 1;
           break;
       }
  }
  if( iOk == 0){
//     response.sendRedirect("https://www2.seoul.go.kr/monitor");

%>

<script>

alert("관리자 모드에 허용된 ip가 아닙니다." );
history.back();
</script>

<%
     return ;
  }
%>


<script type="text/javascript">

function chk_login() {
	
	var f = document.login;
	
	var chk_id = document.getElementById("Id");

	var chk_pass = document.getElementById("Password");
	
	if (chk_id.value == "") {
		alert('아이디를 입력하세요!');
		chk_id.focus();
		return false;
	}

	if (chk_pass.value == "") {
		alert('패스워드를 입력하세요!');
		chk_pass.focus();
		return false;
	}

	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/member/checkAdminMember.do'/>",
		data : $("form").serialize(),
		success : function(data) {
			//console.log(data.result);
			if (data.result == "success") {
				
				$("form").attr("action", "<c:url value='/admin/notice/list.do'/>").submit();
				
			} else {
				if(data.status == "508"){
					alert(data.result);
				}else{
					alert("로그인 정보가 일치하지 않습니다.\n확인 후 다시 시도 하세요.");	
				}
				
			}
		},
		error : function(e) {
			alert("시스템 동작오류 입니다. \n오류코드는 MA:32:9 입니다. ");
		}
	});
	
}

function fnLogin() {
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/member/checkAdminMember.do'/>",
			data : $("form").serialize(),
			success : function(data) {
				if (data.result == "success") {
					
					if (data.grade =="admin") 					
					{
						$("form").attr("action", "<c:url value='/admin/notice/list.do'/>").submit();
					}
					else{
						alert("잘못된 접근입니다.")
					}
						
 
					
				} else {
					alert("로그인 정보가 일치하지 않습니다.\n확인 후 다시 시도 하세요.");
				}
			},
			error : function() {
				alert("시스템 동작오류 입니다. \n오류코드는 MA:32:9 입니다.");
			}
		});
	}
</script>



<style>
.btn2{padding:20px; height:100%;}
</style>


	<!-- 서브 콘텐츠 -->
	<div style="display:block; text-align:center; margin-top:120px;">
		<!-- 게시판 시작 -->
		<h1>로그인</h1>
		
		<label>본 사이트는 시정모니터 관리자만 이용하실 수 있습니다. <b>로그인</b>하여 주십시오.</label>
    	<div style="margin-top:20px;"></div>
		<form name="login" class="login" method="post">
			<div class="col-lg-12" style="padding:30px;border-radius:10px; border:1px solid lightsteelblue;height:auto;">
				<table style="width:40%;margin:auto;" class="pc_notice_table">
					<tr>
						<th>아이디</th>
						<td><input type="text" id="Id" name="Id" style="width:140px; padding:5px;" tabindex="1" /></td>
						<td rowspan="2"><button type="button" class="btn btn2" onclick="chk_login()" tabindex="3">로그인</button></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" id="Password" name="Password" style="width:140px; padding:5px;" tabindex="2" /></td>
					</tr>
				</table>
								
			</div>
			
			
		</form>
		
		
	

		<div class="clearfix divider_dashed7"></div>
 
	</div>


<div id='error'></div>
	
