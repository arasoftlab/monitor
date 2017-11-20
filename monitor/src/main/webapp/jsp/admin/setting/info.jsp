<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">

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
	
	
	if ($("#location").val()=='U') 
	{
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/admin/setting/update.do'/>",
			data : $("form").serialize(),
			success : function(data){
				if (data.result == "success") 
				{
					alert("수정되었습니다.");
				}			
			},
			error : function(request,status,error) {
				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
	}else{
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/admin/setting/insert.do'/>",
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
				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
	}
}

function onDelete()
{
	var index = 0;
	
	var checkboxValues = [];
	$("input[name='chk']:checked").each(function(i) {
	    checkboxValues.push($(this).val());
	    
	    if ($(this).val() == 'webmaster')
	    {
			alert("webmaster는 삭제할 수 없습니다.");
			return false;
	    }
	    
	    index ++;
	});
		
	if (index <= 0)
	{
		alert("하나 이상 선택해야합니다.");
		return false;
	}
	
	var allData = {
			"select_arr" : checkboxValues 
	};
	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/setting/delete.do'/>",
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

function modify(member_id)
{
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/setting/modify.do'/>",
		data : {"member_id" : member_id},
		success : function(data){
			$("#modal-body").html(data);
			//fnBtnView("Q");			
			$("#btn_go").trigger('click');
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

function onApply()
{
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/admin/setting/apply.do'/>",
		success : function(data){
			$("#modal-body").html(data);
			//fnBtnView("Q");			
			$("#btn_go").trigger('click');
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
					<colgroup>
						<%-- <col width="3%;">
						<col width="5%;">
						<col width="10%;" >
						<col width="7%;">
						<col width="12%;"> --%>
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" id="checkall"> </th>
							<th>번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>연락처</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">					
									<tr>
										<td><input type="checkbox" name="chk" value="${item.id }"></td>
										<td>${item.rn }</td>
										<td>
											<button id="btn_go" type="button" class="modal_btn" data-toggle="modal" data-target=".info_modal"></button>
											<a href="javascript:modify('${item.id}')">${item.id }</a>
										</td>
										<td>${item.name }</td>
										<td>${item.phone }</td>
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