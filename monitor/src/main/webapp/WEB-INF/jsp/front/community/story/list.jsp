<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	.information{font-size:12px;}
	.none_table{ border:none; width:100%;}
	.showModal{width:28%; top:40%; left:40%;padding:10px;}
	.showModal .modal-header{width:100%;}
	.showModal .modal-header .close{float:right;}
</style>


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
history.back();
</script>

<% 
}else if ( m_infos == null || m_infos.equals("secession")) {
%>
<script>
alert("꼼꼼한 서울씨 가입자가 아닙니다.");
history.back();
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



function apply_secret(uuid)
{	
	var password = $("#sec_password").val();
	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/front/community/story/secret_chk.do'/>",
		data : {"cont_uuid" : uuid , 
			"password" : password},
		success : function(data){
			if(data.result=="success")
			{				
				location.href="view.do?cont_uuid="+uuid+"&password="+password+"";
			}else{
				alert("정확한 비밀번호를 입력해 주세요.");	
			}
			
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
}

function onSecretEnter(uuid)
{
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='/front/community/story/secret.do'/>",
		data : {"cont_uuid" : uuid},
		success : function(data){
			$("#modal-body").html(data);
			$("#btn_go").trigger('click');
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

</script>


	<!-- 서브 콘텐츠 -->
	<div class="content_right" style="display:block">

		<!-- 게시판 시작 -->
		<h3>이야기방</h3>
		
		<div style="border:1px solid steelblue; border-radius:10px; padding:10px;width:100%; font-size:12px">
			<p>이야기방은 회원 간 정보교환 및 소통을 위한 커뮤니티 공간입니다.</p>
  		<p>관리자에게 문의나 전할 말이 있으신 경우에도 이용 가능하며 비밀글 문의도 가능합니다.</p>
		</div>
		<div style="text-align:right;margin-top:20px;">
			<button type="button" class="btn btn-primary button_blue button_white" onclick="location.href='<c:url value='write.do'/>'">글쓰기</button>
		</div>
		<table class="pc_notice_table" style="width:100%;background:#fff;border:none;border-spacing:0;padding:0;margin-top:20px;">
			<tr>
				<td>
				<!-- 카테고리 -->
					<table class="table_02">
						<tr align="center" style="background:lightsteelblue;">
						<!-- 타이틀 -->
							<td class="att_title" style="width:7%;">
								<font style='color:#000;font-size:12px;'>번호</font>
							</td>
							<td class="att_title">
								<font style='color:#000;font-size:12px;'>제목</font>
							</td>
							<td class="att_title" style="width:12%;">
								<font style='color:#000;font-size:12px;'>작성자</font>
							</td>
							<td class="att_title" style="width:15%;">
								<font style='color:#000;font-size:12px;'>등록일</font>
							</td>
							<td class="att_title" style="width:8%;">
								<font style='color:#000;font-size:12px;'>조회수</font>
							</td>

						</tr>
						  <!-- 내용 -->
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">
									<tr>
										<td class="bbsno"><font style='font-size:12px;'>${item.rn }</font></td>
										<td class='bbsnewf5' align='left'>
											<c:choose>
												<c:when test="${item.is_password eq 'Y' }">
													<span class="notice_subject"><img src="/monitor/img/closed.JPG"><a href="javascript:onSecretEnter('${item.cont_uuid}')" >${item.title }</a></span>
												</c:when>
												<c:otherwise>
													<span class="notice_subject"><a href='<c:url value='view.do?cont_uuid=${item.cont_uuid}'/>'>${item.title }</a></span>
												</c:otherwise>
											</c:choose>									
										</td>
										<td class="bbswriter">
										<font style='font-size:12px;'><c:out value="${fn:substring(item.member_id, 0, 3)}" />**</font>
										</td>
										<td class="bbsno">
											<font style='font-size:12px;'><fmt:formatDate value="${item.regdate }" pattern="yyyy/MM/dd" /></font>
										</td>
										<td class="bbsno"><font style='font-size:12px;'>${item.hits }</font></td>										
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7" style="text-align:center">등록된 글이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>

						<tr class="secret_tr">
							<td class="bbsno">3366</td>
							<td class='bbsnewf5' align='left'>
								<span class="notice_subject"><a href='<c:url value='view.do'/>'>
									<img src="<c:url value='/img/closed.JPG'/>">안전체험관<span style="color:red;">[RE]</span></a>
								</span>
							</td>
							<td class="bbswriter">관리자2</td>
							<td class="bbsetc_dateof_write">2016/09/28</td>
							<td class="bbsetc_dateof_write">4</td>
						</tr>
					</table>


					<jsp:include page="/WEB-INF/inc/paging.jsp"></jsp:include>

					<!-- 검색 -->
					<form name='com_board_search' method='post'>
						<div id="ext_search" style="text-align:center; padding-top:20px;">
							<table style="width:100%;">
								<tr>
									<td>
										<table id="search_table">
											
											<tr>
												<td class="est_cate_cell">
													<select title="select" name='searchCategory' class="cateform" style="height:100%;">
														<!-- option value="" <c:if test="${empty vo.searchCategory }">selected</c:if>>선택</option -->
														<option value="title" <c:if test="${vo.searchCategory eq 'title' }">selected</c:if>>제목</option>
														<option value="description" <c:if test="${vo.searchCategory eq 'description' }">selected</c:if>>내용</option>
														<option value="member_id" <c:if test="${vo.searchCategory eq 'member_id' }">selected</c:if>>작성자</option>
													</select>
												</td>
												<td class="est_keyword_cell">
													<div id='search_display1' style='display:block;'>
														<input title="input" alt="" type="text" name="searchText" class="keywordform" value="${vo.searchText }"  name='com_board_search_value' chk="y" style="font-size:16px;height:100%;" />
													</div>
												</td>
												<td class="est_btn_cell">
													<input title="input" alt="" type='image' src='<c:url value='/img/front/search.gif'/>' style="height:100%;border:none;" onclick="fnSearch();" >
												</td>
											</tr>
											
										</table>
									</td>
								</tr>
								
							</table>
							
							
						</div>
					</form>
					<!-- //검색 -->
				</td>
			</tr>
		</table>
		<!-- 게시판 끝 -->
		
		
		
		<!-- 모바일 화면 -->		
		<table class="mobile_notice_table" style="width:100%;background:#fff;padding:0;border:none;border-spacing:0;margin-top:10px;">
			<tr>
				<td>
				<!-- 카테고리 -->
					<table class="table_02">
						<tr align="center" height="30" bgcolor="#F7F7F7">
						<!-- 타이틀 -->
							<td class="att_title">
								<font style='color:#000000;font-size:12px;'>번호</font>
							</td>
							<td class="att_title">
								<font style='color:#000000;font-size:12px;'>제목</font>
							</td>
						</tr>
						  <!-- 내용 -->
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">
									<tr>
										<td class="bbsno"><font style='font-size:12px;'>${item.rn }</font></td>
										<td class='bbsnewf5' align='left'>

											<c:choose>
												<c:when test="${item.is_password eq 'Y' }">
													<span class="notice_subject"><img src="/monitor/img/closed.JPG"><a href="javascript:onSecretEnter('${item.cont_uuid}')" >${item.title }</a></span>
												</c:when>
												<c:otherwise>
													<span class="notice_subject"><a href='<c:url value='view.do?cont_uuid=${item.cont_uuid}'/>'>${item.title }</a></span>
												</c:otherwise>
											</c:choose>

										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7" style="text-align:center">등록된 글이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
						

					</table>

					<div>
						<jsp:include page="/WEB-INF/inc/paging.jsp"></jsp:include>
					</div>
					
					
					<!-- 검색 -->
					<form name='com_board_search' method='post'>
						<div id="ext_search" style="text-align:center; padding-top:20px;">
							<table style="width:100%;">
								<tr>
									<td>
										<table id="search_table">
											
											<tr>
												<td class="est_cate_cell">
													<select title="select" name='searchCategory' class="cateform" style="height:100%;">
														<!-- option value="" <c:if test="${empty vo.searchCategory }">selected</c:if>>선택</option -->
														<option value="title" <c:if test="${vo.searchCategory eq 'title' }">selected</c:if>>제목</option>
														<option value="description" <c:if test="${vo.searchCategory eq 'description' }">selected</c:if>>내용</option>
														<option value="member_id" <c:if test="${vo.searchCategory eq 'member_id' }">selected</c:if>>작성자</option>
													</select>
												</td>
												<td class="est_keyword_cell">
													<div id='search_display1' style='display:block;'>
														<input title="input" alt="검색어 입력" type="text" name="searchText" class="keywordform" value="${vo.searchText }"  name='com_board_search_value' chk="y" style="font-size:16px;height:100%;" />
													</div>
												</td>
												<td class="est_btn_cell">
													<input title="input" class="search_img" alt="검색" type='image' src='<c:url value='/img/front/search.gif'/>' style="height:100%;border:none;" >
												</td>
											</tr>
											
										</table>
									</td>
								</tr>
								
							</table>
							
						</div>
					</form>
					<!-- //검색 -->
				</td>
			</tr>
		</table>
		

		<div class="clearfix divider_dashed7"></div>
	</div>
	
	<button id="btn_go" type="button" class="modal_btn" data-toggle="modal" data-target=".showModal"></button>


	<div class="modal fade showModal" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close btn-default" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h6 class="modal-title"><font color="#6799FF">비밀번호 입력</font></h6>
				</div>
				<div class="modal-body" id="modal-body">

				</div>
				<div class="modal-footer">

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
