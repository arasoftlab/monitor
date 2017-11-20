<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
function fnSearch(){
	$("form").attr("action","list.do").submit();
}
</script>

<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="col-lg-12" style="padding:0;">
					<div class="pull-right">
						<button class="btn btn-theme ">관리자 삭제</button>
						<button class="btn btn-theme" data-toggle="modal" data-target=".info_modal">관리자 등록</button>
					</div>
				</div>
				
				<table class="table table-bordered table-striped table2 modal_table">
					<colgroup>
						<%-- <col width="3%;">
						<col width="5%;">
						<col width="10%;" >
						<col width="7%;">
						<col width="12%;"> --%>
					</colgroup>
					<thead>
						<tr>
							<th> </th>
							<th>번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>연락처</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox" ></td>
							<td>1</td>
							<td><button type="button" class="modal_btn" data-toggle="modal" data-target=".info_modal">Cccc</button></td>
							<td>고길동</td>
							<td>010-3333-3333</td>
						</tr>
						<tr>
							<td><input type="checkbox" ></td>
							<td>2</td>
							<td><button type="button" class="modal_btn" data-toggle="modal" data-target=".info_modal">Bbbb</button></td>
							<td>김순자</td>
							<td>010-1122-2211</td>
						</tr>
						<tr>
							<td><input type="checkbox" ></td>
							<td>3</td>
							<td><button type="button" class="modal_btn" data-toggle="modal" data-target=".info_modal">aaaa</button></td>
							<td>이성경</td>
							<td>010-8887-9953</td>
						</tr>
					</tbody>
					
				</table>
				
				<!-- 모달 팝업 1-->
				<div class="modal fade info_modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				      </div>
				      <div class="modal-body">
						<table class="table table-bordered table-margin">
							<tbody>
								<tr>
									<td class="td1 width">* 아이디</td>
									<td colspan="3" class="left"><input type="text" class="form-control"></td>
								</tr>
								<tr>
									<td class="td1 width">* 비밀번호</td>
									<td colspan="3" class="left"><input type="text" class="form-control"></td>
								</tr>
								<tr>
									<td class="td1 width">* 이    름</td>
									<td colspan="3" class="left"><input type="text" class="form-control"></td>
								</tr>
								<tr>
									<td class="td1 width">* 연락처</td>
									<td colspan="3" class="left"><input type="text" class="form-control"></td>
								</tr>
							</tbody>
						</table>
				      </div>
				      <div class="modal-footer">
						<button type="button" class="btn btn-theme modal_btn">등록/수정</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				
				<div class="col-lg-12">
					<jsp:include page="/WEB-INF/inc/paging.jsp"></jsp:include>
				
				</div>
				
			</div>
		</div>
	</div>
</section>