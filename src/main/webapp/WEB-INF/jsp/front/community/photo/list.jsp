<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	.information{font-size:12px;}
	.sub_table{width:100%;}
	.sub_table td{vertical-align:top; border:none;}
	.bbsno{text-align:center;}
	.modal{text-align:center;padding:0 !important; z-index:100000;}
	.modal:before{content:'';display:inline-block;height:100%;vertical-align:middle;margin-right:-4px;}
	.modal-dialog{display:inline-block;text-align:left;vertical-align:middle;}
	.modal-backdrop { z-index:99999;}
</style>
<script>
function fnShowImg(img, title){
	var $modal = $('#myModal');

	$('#myModalLabel').text(title);
	var $fimg = $(".modal-body").find('img');
	$fimg.attr('src',"/monitor"+img);
	$fimg.addClass("img-responsive");
	$fimg.addClass("img-thumbnail");
	$fimg.addClass("center-block");
	$fimg.css("padding", "5px");
	$modal.modal('show');
	
}
</script>


	<!-- 서브 콘텐츠 -->
	<div class="content_right" style="display:block">

		<!-- 게시판 시작 -->
		<h3>포토갤러리</h3>
		<div style="text-align:right;margin-top:10px;">
			<button type="button" class="btn btn-primary button_blue button_white" onclick="location.href='<c:url value='write.do'/>'">글쓰기</button>
		</div>
		<table class="pc_notice_table" style="width:100%;background:#fff;border:none;border-spacing:0;padding:0;margin-top:10px;">
			<tr>
				<td>
					<table class="table_02">
						<tbody>
						
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">
								<tr>
								  <td style="width:20%;">
										<div class="thumb">
												<img src="<c:url value='${item.fileList[0].savePath }/${item.fileList[0].unqFileName }'/>" 
												onclick="fnShowImg('${item.fileList[0].savePath }/${item.fileList[0].unqFileName }', '${item.title }');" style="width: 150px;"
												>
										</div>
								  </td>
								  <td style="width:70%; vertical-align:TOP;">
										<table class="sub_table" style="width:100%; border=none;">
		  								<tr>
			  							  <td>
  			  						  	  <img src="<c:url value='/css/front/img/icon04.png'/>">
	  		  							  	<font style='font-size:12px;'>${item.title }</font>
					  					  </td>
						  				</tr>
							  			<tr>
							     			<td>
									  				<p>
										  				<a href='<c:url value='view.do?cont_uuid=${item.cont_uuid}'/>'>
											  				<font style='font-size:12px;'>${item.description }</font>
												  		</a>
												  	</p>											
								  	   	</td>
										  </tr>										
	   							  </table>							 											
  	   					  </td>		  
  								<td style="width:10%; vertical-align:TOP;">
	     		  				<font style='font-size:12px;'><c:out value="${fn:substring(item.member_id, 0, 3)}" />**<br>
		     	 	  			(<fmt:formatDate value="${item.regdate }" pattern="yyyy/MM/dd" />)</font>
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

						</tbody>
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
														<input title="input" alt="검색어 입력" type="text" name="searchText" class="keywordform" value="${vo.searchText }"  name='com_board_search_value' chk="y" style="font-size:16px;height:100%;" />
													</div>
												</td>
												<td class="est_btn_cell">
													<input title="input" alt="검색" type='image' src='<c:url value='/img/front/search.gif'/>' style="height:100%; border:none;" onclick="fnSearch();" >
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
		<table class="mobile_notice_table" style="width:100%;background:#fff;border:none;border-spacing:0;padding:0; margin-top:10px;">
			<tr>
				<td>
	  
					<table class="table_02">
						<colgroup>
							<col width="40%;">
							<col width="*%;">
						</colgroup>
						<thead>
							<tr>
								<th><font style='font-size:12px;'>사진</font></th>
								<th><font style='font-size:12px;'>내용</font></th>
							</tr>
						</thead>
						<tbody>
						
						<c:choose>
							<c:when test="${!empty list }">
								<c:forEach var="item" items="${list }">
								<tr>
												<td class="bbsno">
													<div class="thumb">
														<img src="<c:url value='${item.fileList[0].savePath }/${item.fileList[0].unqFileName }'/>" onclick="fnShowImg('${item.fileList[0].savePath }/${item.fileList[0].unqFileName }');" style="width: 150px;">
													</div>
												</td>
												<td style="width:80%;vertical-align: middle;">	
												 <p>	
  			  						  	  <img src="<c:url value='/css/front/img/icon04.png'/>">
	  		  							  	<font style='font-size:12px;'>${item.title }</font>
	  		  							 </p> 	
													<p>
														<a href='<c:url value='view.do?cont_uuid=${item.cont_uuid}'/>'>
															<font style='font-size:12px;'>${item.description }</font>
														</a>
													</p>
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

						</tbody>
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
														<input title="input" alt="검색어 입력" type="text" name="searchText" class="keywordform" value="${vo.searchText }"  name='com_board_search_value' chk="y" style="font-size:16px;height:100%;" />
													</div>
												</td>
												<td class="est_btn_cell">
													<input title="input" alt="검색" type='image' src='<c:url value='/img/front/search.gif'/>' style="height:100%;border:none;" onclick="fnSearch();" >
												</td>
											</tr>
											
										</table>
									</td>
								</tr>
								
							</table>
							
							
						</div>
					</form>
					<!-- 검색 자바스크립트 구문 시작 -->
					
				</td>
			</tr>
		</table>
		
		
<!-- 				<div class="modal fade showImg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-sm">
				    <div class="modal-content">
				      <img id="modal-img" />
				    </div>
				    <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        </div>
				  </div>
				</div> -->

		<!-- Modal -->
		<div class="modal animated" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		  <div class="modal-dialog">
		    <div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
				  <img id="modal-img" />
				</div>      
				<div class="modal-footer">
				     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div><!-- /.modal-footer --> 
			</div><!-- /.modal-content -->	   
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->


		<div class="clearfix divider_dashed7"></div>
 
	</div>


