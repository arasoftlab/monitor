<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/jf-taglib.tld" prefix="j"%>

<link href="//vjs.zencdn.net/4.9/video-js.css" rel="stylesheet">
<script src="<c:url value='/js/video.js'/>"></script>
<style>

.fa{display:block;}
.fileinput-button input {
    position: relative;
    /* top: 0; */
    /* right: 0; */
    /* margin: 0; */
    opacity: 0;
    -ms-filter: 'alpha(opacity=0)';
    direction: ltr;
    cursor: pointer;
    margin-top: -100%;
    margin-left: -290%;
}
</style>

<script>

function comment_apply()
{
	if ($("#description").val() =="" )
	{
		alert("댓글을 입력하시기 바랍니다.");
	}
	
	//alert($("#comment_frm").serialize());
	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/front/community/commentinsert.do'/>",
		data : $("#comment_frm").serialize(),
		success : function(data){
			if(data.result == "success"){
//				location.href="<c:url value='/front/community/story/story_list.do'/>";
				location.reload();
			}else{
				alert("댓글 등록 오류!");
			}
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

function c_cancle(c_idx)
{
	var comment_temp = $('#comment_'+c_idx).val();
		
	$('#comment_'+c_idx).contents().unwrap().wrap('<p id="comment_'+c_idx+'">');	
	
	$('#comment_'+c_idx).text(comment_temp);
	
	$('#btn_comment_modify_cancle_'+c_idx).css('display','none');	
	
	$('#btn_comment_apply_'+c_idx).attr('onclick','c_modify('+c_idx+')');
}

// 수정버튼 누를시 바로 텍스트 변경
function c_modify(c_idx)
{
	var comment_temp = $('#comment_'+c_idx).text();
	

	$('#comment_'+c_idx).contents().unwrap().wrap('<input type="text" id="comment_'+c_idx+'" value="'+comment_temp+'" style="width:100%;" />');	
	
	$('#comment_'+c_idx).text("");
	
	$('#btn_comment_modify_cancle_'+c_idx).css('display','');
	
	$('#btn_comment_apply_'+c_idx).attr('onclick','c_apply('+c_idx+')');

}

function c_apply(c_idx)
{
	var description  = $('#comment_'+c_idx).val();
	
	if(confirm("수정하시겠습니까?")){
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/front/community/commentinsert.do'/>",
			data : { 
				"comm_id" : c_idx,
				"description":description },
			success : function(data){
				if(data.result == "success"){
					c_cancle(c_idx);
				}else{
					alert("수정에 실패하였습니다.");
				}
			},
			error : function(request,status,error) {
				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
	}
}

function c_delte(c_idx)
{	
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/front/community/commentdelete.do'/>",
			data : { 
				"comm_id" : c_idx
				},
			success : function(data){
				if(data.result == "success"){
					location.reload();
				}else{
					alert("수정에 실패하였습니다.");
				}
			},
			error : function(request,status,error) {
				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
	}
}



function onModify()
{
	location.href="smodify.do?cont_uuid=${vo.cont_uuid}"				
}

function onDelete(bbs_id)
{
	if(confirm("삭제 하시겠습니까?")){
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/front/community/story/delete.do'/>",
			data : { "bbs_id" : bbs_id },
			success : function(data){
				if(data.result == "success"){
					location.href="<c:url value='/admin/community/story/list.do'/>";
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

<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
			
				<table class="table table-bordered table-margin">
					<colgroup>
						<col width="15%;">
						<col width="55%;">
						<col width="15%;">
						<col width="15%;">
					</colgroup>
					<tbody>
						<tr>
							<td class="td1">제목</td>
							<td class="left">${vo.title }</td>
							<td class="td1">작성자</td>
							<td class="left">${vo.member_id } : ${vo.member_name}</td>
						</tr>
						<tr>
							<td class="td1">등록일</td>
							<td class="left"><fmt:formatDate value="${vo.regdate }" pattern="yyyy/MM/dd HH:MM:SS" /></td>
							<td class="td1">조회수</td>
							<td class="left">${vo.hits}</td>
						</tr>
						<tr>
							<td class="td1">내용</td>
							<td colspan=3 class="left">
								${vo.description}
							</td>
						</tr>
					</tbody>
				</table>
				
			</div>
			
			<div class="add_reply_sphere" style="padding-top:20px;">
			<p class="reply_no">

			<c:choose>
				<c:when test="${!empty c_cnt }">
					댓글  ${c_cnt} 개 
				</c:when>
				
				<c:otherwise>
					댓글  0 개 
				</c:otherwise>
			</c:choose>


			</p>
			
			<div class="add_reply_list">
			
			<c:choose>
				<c:when test="${!empty c_list }">
					<c:forEach var="item" items="${c_list }">			
						<!--덧글 리스트 시작, 입력자에 따라, 덧글이 맨 첨에 오느냐에 따라 class 가 다릅니다.-->
						<div class="reply_by_user">
							<table style="width:100%;">
								<tr>
									<td class="writer">
										<p>${item.member_id }</p>
									</td>
									<td class="comment-description">
											<p id="comment_${item.comm_id}">${item.description }</p>
									</td>
									<td class="modify_button">

											<button id="btn_comment_modify_cancle_${item.comm_id}" style="display:none;" onclick="c_cancle('${item.comm_id}')">취소</button>
											<button id="btn_comment_apply_${item.comm_id}" onclick="c_modify('${item.comm_id}')">수정</button>

											<button onclick="c_delte('${item.comm_id}')">삭제</button>
									</td>
									<td class="date">
										<fmt:formatDate value="${item.regdate }" pattern="yy.MM.dd HH:MM:SS" />
									</td>
								
								</tr>
							</table>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
				
				<!--덧글입력-->	
				<div class="reply_write_on">
				
				
					<form id="comment_frm">
						<input type="hidden" name="bbs_id" value="${vo.bbs_id}">
						<input type="hidden" name="member_id" value="${member_id}">
						
						<div class="col-lg-12" style="margin-top:10px;padding:5px;">
							<table style="width:100%;">
								<tr>
									<td style="width:100%;"><textarea rows="2" id="description"	name="description" style="width:100%; height:70px; border-radius:5px;"></textarea></td>
								</tr>
								<tr>
									<td style="width:100%; height:70px; text-align:right;">
										<div id="pollImageAdd" style="float:left;margin-left: 83%;">
										<!--  
											<div class="btn btn-default btn-sm fileinput-button icon_btn">
												<div>
													<i class="fa fa-1x fa-picture-o" style="position: relative;"> 
														<input type="file" class="file_input" style="width:38px;"/>									
													</i>
												</div>
											</div>
												-->											
										</div>
										<input type="checkbox" style="padding:5px;" name="is_secret" id="is_secret" value="Y"><span style="color:cornflowerblue;">비밀 덧글</span>
										<button type="button" class="reply_btn" style="right:0;" onclick="comment_apply()">덧글입력</button>
									</td>
								</tr>
							</table>
						</div>
					</form>
				
				</div>
				
				<div style="clear: both"></div>
			<!--// 덧글리스트-->
			</div>
		</div>
		
			<div class="col-lg-2 pull-right right" style="padding-top:20px;">
 
				<button class="btn btn-warning " onclick="onDelete('${vo.bbs_id}');">삭제</button>

				<button class="btn btn-theme " onclick="onModify()">수정</button>
				<button class="btn btn-info " onclick="location.href='<c:url value='list.do'/>';">목록</button>
			</div>
		</div>
	</div>
	</section>