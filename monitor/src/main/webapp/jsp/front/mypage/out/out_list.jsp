
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	.information{font-size:12px;}
	.none_table{ border:none; width:100%;}
	.showModal{
		width: 40%;
	    top: 35%;
	    left: 40%;
	    padding:10px;
	}
	.showModal .modal-header{
		width:100%;
	}
	.showModal .modal-header .close{
		float:right;
	}
</style>


<script>

fnCheckSession();


function on_secession(){
	
	if ($("#secession_disc").val() == "")
	{
		alert("탈퇴 사유를 적어주세요.");
		return false;
	}
	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='member_secession.do'/>",
		data : $("#secession_form").serialize(),
		success : function(data) {
			if (data.result == "success") {
				alert('꼼꼼한 서울씨 모니터링을 이용해주셔서 감사합니다.');
				location.href="https://reseach.seoul.go.kr/monitor/sso/logout.jsp";
			} else {
				alert('탈퇴 처리가 실패하였습니다.');
			}
		},
		error : function() {
			alert("error!!");
		}
	});	
	
	
}
</script>

<form id="secession_form">
	<!-- 서브 콘텐츠 -->
	<div class="content_right" style="display:block;;">

		<!-- 게시판 시작 -->
		<h3>꼼꼼한 서울씨 회원탈퇴</h3>

		<div style="margin-top:30px; margin-bottom:10px;">
  		<label class="information">▶ 회원탈퇴를 하시겠습니까?</label>
  	</div>
		<div style="margin-left:3%;">  		
			<h6 class="information">※  꼼꼼한 서울씨 회원 탈퇴만 되며 서울시 통합회원 자격은 유지됩니다.</h6>
			<h6 class="information">※  서울시 통합회원 탈퇴까지 원하실 경우
			 서울시 홈 > <a href="http://www.seoul.go.kr/seoul/jsp/myseoul/indexT.jsp" target=_blank><font color="color:#4374D9;">마이서울</font></a> > 회원탈퇴 메뉴를 이용<br>
			&nbsp;&nbsp;&nbsp;(서울시 통합회원을 탈퇴하시면 꼼꼼한 서울씨에서도 탈퇴가 됩니다.)			 
			</h6>
	  </div>
		<div style="width:60%; margin-top:20px;margin-left:40px;">
			<table class="none_table">
				<tbody>
					<tr>
						<td><label class="information">탈퇴 사유를 기재해 주세요(선택 사항)</label></td>
					</tr>	
					<tr>
						<td>
								<input type="hidden" name="id" value="${vo.id}" >
								<textarea rows="3" style="width:100%;" name="secession_disc" id="secession_disc"></textarea>
						</td>
					</tr>
					<tr>
					  <td height="20px">&nbsp;</td>
					</tr>
					<tr>
						<td style="text-align:center">
							<button type="button" class="btn btn-warning button_blue button_white" data-toggle="modal" data-target="#myModal">꼼꼼한 서울씨 탈퇴</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="modal fade showModal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header" >
		        <button type="button" class="close btn-default button_blue button_white" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h3 class="modal-title">회원탈퇴</h3>
		      </div>
		      <div class="modal-body">
		        <p>회원탈퇴를 하시겠습니까?</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary button_blue button_white" data-dismiss="modal" onclick="on_secession()">네</button>
		        <button type="button" class="btn btn-default button_blue button_white" data-dismiss="modal">아니요</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
		

		<div class="clearfix divider_dashed7"></div>
 
	</div>

</form>
