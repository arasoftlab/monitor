<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
var aType = "I";
function onApply_admin()
{	
	if ($("#id").val()=="")
	{
		alert("아이디를 입력하세요");
		return false;
	}	
	
	if ($("#password").val()=="")
	{
		alert("비밀번호를 입력하세요");
		return false;
	}	
	
	if ($("#name").val()=="")
	{
		alert("이름을 입력하세요");
		return false;
	}	
	
	if ($("#phone").val()=="")
	{
		alert("전화번호를 입력하세요");
		return false;
	}
	
	
	if (aType=='U') 
	{
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/admin/setting/updateAdmin.do'/>",
			data : $("form").serialize(),
			success : function(data){
				if (data.result == "success") 
				{
					alert("수정되었습니다.");
					window.location.reload();
				}			
			},
			error : function(request,status,error) {
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
	}else{
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/admin/setting/createAdmin.do'/>",
			data : $("form").serialize(),
			success : function(data){
				if (data.result == "success") 
				{
					$("#btn_modal_close").trigger('click');
					alert("추가되었습니다.");
					window.location.reload();
				}
				
				if (data.result == "duplicate") {
					alert("중복된 아이디입니다.");
				}
			},
			error : function(request,status,error) {
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
	}
}

function onDelete()
{
	var index = 0;

	var checkboxValues = [];
	var report_num =[];
	$("input[name='chk']:checked").each(function(i) {
	    checkboxValues.push($(this).val());
	    index ++;
	});
	
	if (index <= 0)
	{
		alert("하나 이상 선택해야합니다.");
		return false;
	}else{
		var r = confirm("선택한 관리자를 삭제하시겠습니다. ?");
		
		if(r == false){
			return ;
		}
	}
	
	var allData = {
			"id" : checkboxValues 	
	};
	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/setting/deleteAdmin.do'/>",
		data : allData,
		success : function(data){
			if (data.result=="success")
			{
				alert("삭제 되었습니다.");
				window.location.reload();
			}
			
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}


function onModify(aId)
{	
	aType ="U";
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/setting/adminModify.do'/>",
		data: {"id": aId},
		success : function(data){
			$("#modal-body").html(data);	
			$("#myModal").modal('show');
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

function onApply()
{
	aType ="I";
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/setting/adminModify.do'/>",
		success : function(data){
			$("#modal-body").html(data);
			//fnBtnView("Q");	
			$("#myModal").modal('show');
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

function fnSearch(){
	$("form").attr("action","info.do").submit();
}
$(document).ready(function(){
	

	
	
    //최상단 체크박스 클릭
    $("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=chk]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=chk]").prop("checked",false);
        }
    });
});
</script>

<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="col-lg-12" style="padding:0;">
					<div class="pull-right">
						<button class="btn btn-theme " onclick="onDelete()">관리자 삭제</button>
						<button class="btn btn-theme" onclick="onApply()">관리자 등록</button>
					</div>
				</div>
				
				<table class="table table-bordered table-striped table2 modal_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="checkall"> </th>
							<th>번호</th>
							<th>이름</th>
							<th>부서</th>
							<th>아이디</th>
							<th>비밀번호</th>
							<th>허용IP</th>
							<th>생성일자</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }" varStatus="seq">					
									<tr>
										<td><input type="checkbox" name="chk" value="${item.id }"></td>
										<td>${seq.index + 1 }</td>
										<td><a href="javascript:onModify('${item.id}')">${item.name }</a></td>
										<td>${item.dept }</td>
										<td><a href="javascript:onModify('${item.id}')">${item.id }</a></td>
										<td>${item.password }</td>
										<td>${item.allowip }</td>
										<td><fmt:formatDate value="${item.createdate }" pattern="YYYY-MM-dd HH:mm"/></td>
									</tr>
								</c:forEach>
							</c:when>
														
						</c:choose>
					</tbody>
					
				</table>
				
				<!-- 모달 팝업 1-->
				<div class="modal fade info_modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				      </div>
				      <div class="modal-body" id="modal-body">

				      </div>
				      <div class="modal-footer">
						<button type="button" class="btn btn-theme modal_btn" onclick="onApply_admin()" >등록/수정</button>
						<button type="button" id="btn_modal_close" class="btn btn-default" data-dismiss="modal">Close</button>
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