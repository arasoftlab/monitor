<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<% 
Object m_infos_tmp = session.getAttribute("grade");
String m_infos = (String)m_infos_tmp;

Object lobj_getdata = session.getAttribute("m_sso_id");
String sso_id = (String)lobj_getdata;

if (sso_id == null ) 
{
%>
<script>
alert("로그인을 이용해주세요.");
location.href="<c:url value='/front/community/photo/photo_list.do'/>";
</script>

<% 
}else if ( m_infos == null || m_infos.equals("secession")) {
%>
<script>
alert("꼼꼼한 서울씨 가입자가 아닙니다.");
location.href="<c:url value='/front/community/photo/photo_list.do'/>";
</script>

<% 
}else {
%>
<script>

fnCheckSession();
</script>
<%
}
%>

<script>

var is_secret = '${is_secret}';

secret_chk()


function secret_chk()
{
		
	if (is_secret == "N")
	{
		alert("올바른 접근이 아닙니다.");
		location.href="<c:url value='/front/community/photo/photo_list.do'/>";
	}
	
}

function comment_apply()
{
	if ($("#description").val() =="" )
	{
		alert("댓글을 입력하시기 바랍니다.");
		return false;
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
	location.href="write.do?cont_uuid=${vo.cont_uuid}"				
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
					location.href="<c:url value='/front/community/story/story_list.do'/>";
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

// 2017-04-11 New 
        function checkLength(comment) {
            if (comment.value.length > 200 ) {
                comment.blur();
                comment.value = comment.value.substring(0,200);
                alert('200자까지만 기재 가능합니다');
                comment.focus();
                return false;
            }
        }



</script>

<style>

.modify_button {width:10%}

	.btn2{width:38px;}
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
    margin-left: -100%;
    width: 33px;
}
.fa-edit{float:left;}
.right_links li{
	width:65px;
}
.icon_btn {
    height: 34px;
    width: 34px;
}
.btn{min-width:34px !important;}
</style>

	<div class="content_right" style="display:block">
<!-- -------------------------------------------------------------- 내용 view--------------------------------------------------->			
		<h3>이야기방</h3>
		<table class="pc_notice_table" style="width:100%;background:#fff;border:0;padding:0;border-spacing:0;">
			<tr>
				<td>
	  
				<!-- //PC화면 -->
	  
					<table class="table_02" style="padding:0;border-spacing:0; font-size:12px;">
						<colgroup>
							<col width="15%;">
							<col width="*">
							<col width="15%;">
							<col width="15%;">
						</colgroup>
						<tr>
							<th>제&nbsp;&nbsp;목</th>
							<td><b>${vo.title }</b></td>
							<th>작성자</th>
							<td align="center">
								<c:out value="${fn:substring(vo.member_id, 0, 3)}" />**
							</td>
						</tr>
						<tr>
							<th>등록일</th>
							<td>
								<fmt:formatDate value="${vo.regdate }" pattern="yyyy/MM/dd HH:mm:ss" />
							</td>
							<th>조회수</th>
							<td align="center">
								${vo.hits}
							</td>
						</tr>
						<tr>
							<th>내&nbsp;&nbsp;용</th>
							<td colspan="3">
								${vo.description}
							</td>
						</tr>
					</table>

					<!-- //PC화면 -->
				</td>
			</tr>
		</table>
					<!-- //모바일 화면 -->		
		<table class="mobile_notice_table" style="width:100%;background:#fff;border:0;padding:0;border-spacing:0;">
			<tr>
				<td>
	  
				<!-- //카테고리 -->
	  
					<table class="table_02" style="padding:0;border-spacing:0; font-size:12px;">
						<colgroup>
							<col width="25%;">
							<col width="25%;">
							<col width="25%;">
							<col width="25%;">														
						</colgroup>
						<tr>
							<th>제&nbsp;&nbsp;목</th>
							<td colspan="3"><b>${vo.title }</b></td>
						</tr>
						<tr>
							<th>등록일</th>
							<td colspan="3">
								<fmt:formatDate value="${vo.regdate }" pattern="yyyy/MM/dd HH:mm:ss" />
							</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td align="center">
								<c:out value="${fn:substring(vo.member_id, 0, 3)}" />**
							</td>
							<th>조회수</th>
							<td align="center">${vo.hits}</td>
						</tr>
						<tr>
							<th colspan="4">내&nbsp;&nbsp;&nbsp;&nbsp;용</th>
						</tr>
						<tr>													
							<td colspan="4">
                <div style="padding:2px;">							
								  ${vo.description}
								</div>
							</td>
						</tr>
					</table>

					<!-- //검색 -->
				</td>
			</tr>
		</table>
<!-- ------------------------------------------위에까지 내용 view단--------------------------------------------------->		






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
				<!--덧글 리스트 시작, 입력자에 따라, 덧글이 맨 첨에 오느냐에 따라 class 가 다릅니다.-->
			<c:choose>
				<c:when test="${!empty c_list }">
					<c:forEach var="item" items="${c_list }">
						<div class="reply_by_user">
							<a name="comment_13169"></a>
							<table style="width: 100%; font-size:12px;">
								<tr>
								<c:choose>
									<c:when test="${item.is_secret eq 'Y' }">
										<td class="writer">
											<p class="writer">
												<c:out value="${fn:substring(item.member_id, 0, 3)}" />**
											</p>
										</td>
										<td class="comment-description" >
											<p id="comment_${item.comm_id}">
												${item.description }
											</p>
										</td>
										<td class="modify_button">
											<c:if test="${item.member_id  eq member_id}">											
												<button class="btn btn-default button_blue button_white" id="btn_comment_modify_cancle_${item.comm_id}" style="display:none;" onclick="c_cancle('${item.comm_id}')">취소</button>
												<button class="btn btn-info button_blue button_white" id="btn_comment_apply_${item.comm_id}" onclick="c_modify('${item.comm_id}')">수정</button>
												<button class="btn btn-warning button_blue button_white" onclick="c_delte('${item.comm_id}')">삭제</button>
											</c:if>
										</td>
										<td class="date">
											<fmt:formatDate value="${item.regdate }" pattern="yy.MM.dd HH:mm:ss" />
										</td>
									</c:when>
									
									<c:otherwise>									
										<td class="writer">
											<p class="writer">
												<c:out value="${fn:substring(item.member_id, 0, 3)}" />**
											</p>
										</td>
										<td class="comment-description">
											<p id="comment_${item.comm_id}">${item.description }</p>
										</td>
										<td class="modify_button">
											<c:if test="${item.member_id  eq member_id}">
												<button class="btn btn-default button_blue button_white" id="btn_comment_modify_cancle_${item.comm_id}" style="display:none;" onclick="c_cancle('${item.comm_id}')">취소</button>
												<button class="btn btn-primary button_blue button_white" id="btn_comment_apply_${item.comm_id}" onclick="c_modify('${item.comm_id}')">수정</button>
												<button class="btn btn-warning button_blue button_white" onclick="c_delte('${item.comm_id}')">삭제</button>
											</c:if>
										</td>
										<td class="date">
											<fmt:formatDate value="${item.regdate }" pattern="yy/MM/dd HH:mm:ss" />
										</td>
									</c:otherwise>
								</c:choose>				
									
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
								<div class="col-lg-12" style="margin-top: 10px; padding: 5px;">
									<table style="width: 100%;">
										<tr>
											<td style="width: 100%;">
<!--
20170411 text limit
<textarea rows="2" style="width: 100%; border-radius: 5px;" id="description" name="description"></textarea>
-->
<textarea style="width:100%; border-radius:5px" rows="2" onKeyUp="checkLength(this);"id="description" name="description"></textarea>

</td>
										</tr>
										<tr>
											<td style="width: 100%; text-align: right;">
												<div id="pollImageAdd" style="float: left;">
													<!--  
													<div class="btn btn-default btn-sm fileinput-button icon_btn">
														<div>
															<i class="fa fa-1x fa-picture-o"
																style="position: relative;"> <input type="file"
																class="file_input" />
															</i>
														</div>
													</div>
													-->
												</div> 
												
												<!-- // 비밀덧글 기능은 제외
												  
												<input type="checkbox" style="padding: 5px;"
												name="is_secret" id="is_secret" value="Y"> <span
												style="color: cornflowerblue;">비밀 덧글</span>
												-->
												<button type="button" class="reply_btn btn-primary button_blue button_white"
													onclick="comment_apply()">덧글입력</button>
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

		
		<div style="text-align:right;margin-top:20px;">
		
		<c:if test="${vo.member_id eq member_id}" >
			<button type="button" class="btn btn-info button_blue button_white" onclick="onModify()">수정</button>
			<button type="button" class="btn btn-warning button_blue button_white" onclick="onDelete('${vo.bbs_id}')">삭제</button>
		</c:if>
			<button type="button" class="btn btn-primary button_blue button_white" onclick="location.href='<c:url value='write.do'/>'">글쓰기</button>
			<button type="button" class="btn btn-primary button_blue button_white" onclick="location.href='<c:url value='story_list.do'/>'">목록</button>
		</div>
		
		<div class="clearfix divider_dashed7"></div>
	</div>

	
