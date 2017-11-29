<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	.modal{text-align:center;padding:0 !important;}
	.modal:before{content:'';display:inline-block;height:100%;vertical-align:middle;margin-right:-4px;}
	.modal-dialog{display:inline-block;text-align:left;vertical-align:middle; }
	.modal-body{padding:10px;}
	.modal-footer{margin-top: 0px;}
	.img-responsive{ max-height: calc(100vh - 70px);}	
</style>
<script type="text/javascript">

$(window).load( function() {
	$("td").click(function(e){     
		
		var tdArr = new Array();    // 배열 선언
	        
	    // 현재 클릭된 Row(<tr>)
	    var tr = $("tbody tr").eq($(this).parent().index());
	    var td = tr.children();
	 	        
	    // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
	    td.each(function(i){
	    	var vt = $.trim(td.eq(i).text());
	        tdArr.push(vt);
	    });
	            
	        
		var col = $(this).index(),
		row = $(this).parent().index();
		
		if(col > 5){
			
			var hcol = $('thead tr').children();
			var qno = hcol.eq(col).text();
			var qnos = document.createElement('h4');
			qnos.innerHTML = "문항정보 : " + qno;
			var wrt = tdArr[4];
			var ids = tdArr[3];
			var text = $(this).text();
			var txts = document.createElement('h4');
			var wids = wrt + "(" + ids + ")";
			txts.innerHTML = "작&nbsp&nbsp성&nbsp&nbsp자 : " + wids;
			
			//서술형일경우
			if(qno.indexOf("서술") != -1 && qno.indexOf("첨부") < 1){
				var textModal = $("#textModal");
				//$("#btn_go_text").trigger('click');
				$('#modal-tqno').html(qnos);
				$('#modal-twriter').html(txts);
				$('#modal-text').html(text);
				textModal.modal('show');
			}
			
			
			var imgView = $(this).find('img');

			
			//서술 첨부형인데 이미지가 아닐경우
			if(qno.indexOf("이미지") == -1 && qno.indexOf("첨부") > -1){
				if(imgView.attr('src').length == 0){
					var textModal = $("#textModal");
					//$("#btn_go_text").trigger('click');
					$('#modal-tqno').html(qnos);
					$('#modal-twriter').html(txts);
					$('#modal-text').html(text);
					textModal.modal('show');
				}
			}
				
						
			//이미지일경우
			if(imgView.length != 0){
				var imageModal = $("#imageModal");
				var img = imgView.attr('src');
				img = img.replace("/thumb", "").replace("jpg.png","jpg");
				
				$('#modal-iqno').html(qnos);
				$('#modal-iwriter').html(txts);
				//$("#btn_go").trigger('click');
				$('#modal-img2').attr('src',img);
				imageModal.modal('show');				
			}
		}
	    
	});
});


function fnSearch(){
	$("form").attr("action","view.do").submit();
}

function fnNoAnswer(){
	location.href="noanswer.do?subject_id=${vo.subject_id}";
}


function onExcel(){	
	location.href="/monitor/admin/ex/excel_transform_controller.do?target=answers&subject_id=${vo.subject_id}";
}

function view_team_info_pop(id,poll_num)
{	
	var popUrl = "/monitor/admin/monitor/info.do?member_id="+id+"&poll_num="+poll_num;	//팝업창에 출력될 페이지 URL
	var popOption = "left="+(screen.availWidth-1020)/2+",top="+(screen.availHeight-640)/2+" , width=1020px,height=640px, resizable=no, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);		
	/*
	$.ajax({
		async : true,
		type : "POST",
		url : "info.do",
		data : {
			"id" : id,
			"poll_num" : poll_num
			},
		success : function(data){

			$("#modal-body_monitor").html(data);
			$("#btn_go_info").trigger('click');
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});*/
}

function fnShowImg2(img){
//	$('.showImg').modal('show');
	//$("#btn_go").trigger('click');
	//$('#modal-img2').attr('src',img);
}

function fnShowText(text){
	//$("#btn_go_text").trigger('click');
	//$('#modal-text').html(text);
}


function view_member(id,poll_num)
{	
	$.ajax({
		async : true,
		type : "POST",
		url : "/monitor/admin/monitor/member_view.do",
		data : {
			"id" : id,
			"poll_num" : poll_num
			},
		success : function(data){

			$("#modal-body_team_info").html(data);
			//fnBtnView("Q");			
			$("#btn_memberinfo").trigger('click');
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

</script>

<button id="btn_go" type="button" class="modal_btn" data-toggle="modal" data-target=".member_modal"></button>
<button id="btn_go_text" type="button" class="modal_btn" data-toggle="modal" data-target=".member_modal_text"></button>
<button id="btn_memberinfo" type="button" class="modal_btn" data-toggle="modal" data-target=".memberinfo"></button>									

<script>
$('#element').off('scroll touchmove mousewheel');
</script>


<style>
/*본문 테이블 스타일 설정*/
.modal_table tr td{
	min-width:150px;
  max-width:200px;
  white-space:nowrap;
  overflow:hidden;
  text-overflow:ellipsis;
}

/* .modal {
	position:absolute;
	left:50%;
	top:50%;
	transform: translate(-50%, -50%);
	width:auto;
	max-width:700px;
	max-height:500px;
} */

/* .modal-content img {
	max-width:680px;
	max-height:480px;
}

.modal-content > .img-responsive {
	display: block;
	margin-left: auto;
	margin-right: auto;
} */
</style>






<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h4 style="float:left; margin-right:10px;">${s_vo.title} &nbsp;&nbsp;&nbsp;&nbsp; <font color="blue">결과제출 총 ${total_cnt}건</font></h4>
			</div>
			<div class="col-lg-12">
				<div id="search-box1" class="col-lg-12" style="padding:0;">
					<form class="pull-left;">
					
					<input type="hidden" name="subject_id" value="${vo.subject_id}">
					
						<select class="list_form" name="team_num" style="display: inline;">
							<option value="" >조 선택</option>
							  <c:forEach begin="1" end="${s_vo.team_cnt }" var="team_n">
  								<option value="${team_n }" >${team_n }</option>
							  </c:forEach>
						</select>
						<select class="list_form" name="searchCategory" style="display: inline;">
							<!-- option value="" >전체</option -->
							<option value="member_name" >이름</option>
							<option value="member_id" >아이디</option>
						</select>
						<input type="text" class="list_form" name="searchText" value="${vo.searchText }" style="display: inline; width:200px;">
						<input type="button" id="search-button1" value="검색" onclick="fnSearch();">
						<input type="button" id="search-button1" value="조사결과 내려받기" style="width:110px;" onclick="onExcel()">
<!--  
						<input type="button" id="search-button1" value="결과이미지 내려받기" style="width:120px;">
-->
						<input type="button" id="search-button1" value="과제 미체출자 보기" style="width:115px;" onclick="fnNoAnswer();">
					</form>
					
				</div>
				
		
				
				<div style="width:100%;overflow:auto;padding-top:20px;">
				
					<table class="table table-bordered table-striped modal_table">
						<colgroup>
							<col width="3%;">
							<col width="5%;">
							<col width="7%;">
							<col width="7%;">
							<col width="7%;">
							<col width="5%;">
							<col width="*;">
						</colgroup>
						<thead>
							<tr>
								<th></th>
								<th>번호</th>
								<th>제출일</th>
								<th>아이디</th>
								<th>이름</th>
								<th>신청조</th>
								
								<!-- n개 문항출력 -->
								<c:choose>
									<c:when test="${!empty q_list }">
										<c:forEach var="item" items="${q_list }" varStatus="i">								
												<c:choose>
													<c:when test="${item.type eq 'R' }">
														<c:forEach var="o_item" items="${item.optionVO }">
															<th>문(척도)<br />${item.question_num}_${o_item.options_num} </th>
														</c:forEach>
													</c:when>
	
													<c:when test="${item.type eq 'W' }">
														<c:forEach var="o_item" items="${item.optionVO }">
															<th>문(서술)<br />${item.question_num}_${o_item.options_num} </th>
														</c:forEach>							
													</c:when>

													<c:when test="${item.type eq 'M' }">
														<c:forEach var="o_item" items="${item.optionVO }">
															<th>문(복수)<br />${item.question_num}_${o_item.options_num} </th>
														</c:forEach>
													</c:when>

													<c:when test="${item.type eq 'T' }">
														<th>문(첨부)<br />${item.question_num}_서술</th>
														<c:choose>
															<c:when test="${item.optionVO[0].label_1 eq 'img'}">
																<th>문<br />${item.question_num}_이미지</th>															
															</c:when>
															
															<c:otherwise>
																<th>문<br />${item.question_num}_파일</th>		
															</c:otherwise>
															
														</c:choose>

													</c:when>
													
													<c:when test="${item.type eq 'S' }">
														<th>문(단일)<br />${item.question_num} </th>
														
															<c:forEach var="s_type_item" items="${item.optionVO }">
																<c:if test="${s_type_item.descyn eq 'Y'}">
																	<th>문(단일)<br />${item.question_num}_서술 </th>
																</c:if>
															</c:forEach>
														
													</c:when>													

													<c:when test="${item.type eq 'C' }">
														<th>문(분기)<br />${item.question_num} </th>
													</c:when>																									

													<c:when test="${item.type eq 'O' }">
														<c:forEach begin="1" end="${item.required_cnt}" varStatus="z">	
															<th>문${item.question_num}(서열)<br>
															${z.index}순위</th>
														</c:forEach>							

													</c:when>													

													
													<c:otherwise>
														<th>문<br />${item.question_num} </th>					
													</c:otherwise>												
												</c:choose>	
										</c:forEach>
									</c:when>
								</c:choose>
							</tr>
						</thead>
						<tbody>
							<!-- 응답목록 -->
								<c:choose>
									<c:when test="${!empty a_list }">
										<c:forEach var="a_item" items="${a_list }" varStatus="j">
										<tr>
											<td><input type="checkbox"/></td>
											<td>${a_item.rn }</td>
											<td>
												<fmt:formatDate value="${a_item.regdate }" pattern="MM-dd HH:mm"/>
											</td>
											<td>											
												<a href="javascript:view_member('${a_item.member_id  }','${a_item.poll_num }');" style="font-weight: bold;">	${a_item.member_id }</a>
											</td>
											<td>

												<a href="javascript:view_member('${a_item.member_id  }','${a_item.poll_num }');" style="font-weight: bold;">	${a_item.member_name}</a>
											</td>
											<td>${a_item.team_num}</td>
	
								<!-- n개 문항출력 -->
								<c:set var="answer_arr" value="${fn:split(a_item.answers, '|')}"/>
								<c:set var="index_num" value="0"/>
								<c:set var="temp_num" value="1"/>
																
								<c:choose>
									<c:when test="${!empty q_list }">
									<c:forEach var="q_type_list" items="${q_list}" varStatus="q_temp_num">
											<c:set var="an_item" value="${answer_arr[index_num]}" />
											<c:set var="answer_type" value="${fn:substring(an_item,1,2)}" /> 							
											<c:set var="answer_num" value="${fn:substring(an_item,2,fn:indexOf(an_item,':'))}"/>
											
											<c:if test="${!empty an_item }">
												<c:choose>
													<c:when test="${q_type_list.question_num ne answer_num }">
														<c:if test="${q_type_list.type eq 'C' || q_type_list.type eq 'B' }">
															<td></td>
															<c:set var="index_num" value="${index_num }"/>
														</c:if>
														
														<c:if test="${q_type_list.type eq 'R' || q_type_list.type eq 'W' || q_type_list.type eq 'M'}">
															<c:forEach var="q_type_list_option" items="${q_type_list.optionVO }">
																<td></td>
															</c:forEach>
															<c:set var="index_num" value="${index_num }"/>															
  														</c:if>
														
														<c:if test="${q_type_list.type eq 'T'}">
															<td></td>
															<td></td>										
															<c:set var="index_num" value="${index_num }"/>																					
														</c:if>														
														
														<c:if test="${q_type_list.type eq 'S'}">
															<td></td>
																<c:forEach var="s_skip_item" items="${q_type_list.optionVO }">
																	<c:if test="${s_skip_item.descyn eq 'Y' }">
																		<td></td>
																	</c:if>
																</c:forEach>
														</c:if>

														<c:if test="${q_type_list.type eq 'O'}">
															<c:forEach begin="1" end="${q_type_list.required_cnt}" varStatus="z">	
																<td></td>
															</c:forEach>
														</c:if>

													</c:when>		
													<c:otherwise>
													
														<c:choose>
															<c:when test="${answer_type eq 'O'}">
																<c:set var="an_m_item" value="${fn:split(an_item, '#')}" />
																<c:forEach begin="1" end="${q_type_list.required_cnt}" varStatus="z">																																
																	<td>${an_m_item[z.index] }</td> 
																</c:forEach>
															</c:when>
															
															<c:when test="${answer_type eq 'M'}">
																<c:set var="an_m_item" value="${fn:split(an_item, '#')}" />
																<c:forEach var="q_m_list" items="${q_type_list.optionVO}" varStatus="z">	
																			<c:choose>
																				<c:when test="${!empty an_m_item[z.index+1] && an_m_item[z.index+1] ne '' }" >
																					<td>${an_m_item[z.index+1] }</td> 
																				</c:when>
																				<c:otherwise>
																					<td></td>
																				</c:otherwise>
																			</c:choose>
																</c:forEach>
															</c:when>														
															<c:when test="${answer_type eq 'R' }">
																	<c:forEach var="an_temp" items="${fn:split(an_item, '#') }" varStatus="z">
																		<c:choose>
																			<c:when test="${z.index ne 0 }">
																				<td>${an_temp }</td>
																			</c:when>
																		</c:choose>
																	</c:forEach> 
															</c:when>
															<c:when test="${answer_type eq 'W' }">  
																	<c:forEach var="an_temp" items="${fn:split(an_item, '#') }" varStatus="z">
																		<c:choose>
																			<c:when test="${z.index ne 0 }">
																				<td>${an_temp }</td>
																			</c:when>
																		</c:choose>
																	</c:forEach>
															</c:when>
																<c:when test="${answer_type eq 'B' }"> 
																	<td>게시판형</td> 
																</c:when>
																<c:when test="${answer_type eq 'T' }"> 
																	<td>
																		${fn:substring(an_item,fn:indexOf(an_item,'#')+1,fn:indexOf(an_item,'Ω'))}
																	</td>
																	<td>
																	<c:choose>
																		<c:when test="${q_type_list.optionVO[0].label_1 eq 'img'}">
																			<c:choose>
																				<c:when test="${fn:contains(an_item, 'Ω')}" > 
																					<c:set var="iPath" value ="${ fn:substring(an_item, fn:indexOf(an_item, 'Ω') + 1, fn:length(an_item)) }" />
																					<c:set var="iPath" value ="${ fn:trim(fn:replace(iPath, '//', '/')) }" />
																					<c:set var="sPath" value ="${ fn:replace(iPath, '/upload', '/upload/thumb') }" />
																					<c:set var="rPath" value ="${ fn:split(tPath, '.') }" />
																					<c:set var="tPath" value = "${ tPath[1] }" />
																					<c:set var="tExt"  value = "${ tpath[2] }" />
																					<img src="${sPath}.png" style="max-width:150px;"  >
																				</c:when>
																				<c:otherwise>
																					첨부없음
																				</c:otherwise>
																			</c:choose>																		

																		</c:when>
																		
																		<c:otherwise>																			
																			
																																						<c:choose>
																				<c:when test="${fn:contains(an_item, 'Ω')}" > 
																					<c:set var="file_arr" value="${fn:split(an_item, '/')}"/> 							
																																								
																					<a href="javascript:fnFileDown('${file_arr[4]}','<c:url value='/file/fileDownFromUFN.do'/>');">
																					<i class="fa fa-file-text fa-5x"></i>
																					</a>
																				</c:when>
																				<c:otherwise>
																					첨부없음.
																				</c:otherwise>
																			</c:choose>	
																			

																		</c:otherwise>
																																				
																	</c:choose>
																		

																	</td>
																	 
																</c:when>
																<c:when test="${answer_type eq 'S' }"> 																	
																	
																	<td>																	
																		${fn:substring(an_item,fn:indexOf(an_item,':')+1,fn:indexOf(an_item,':')+2)}

																	</td>																		
																		<c:forEach var="s_w_item" items="${q_type_list.optionVO }" varStatus="sw">
																			<c:if test="${s_w_item.descyn eq 'Y' }">
																				<td>																					  
																					<c:if test="${sw.index+1 eq fn:substring(an_item,fn:indexOf(an_item,':')+1,fn:indexOf(an_item,':')+2)}">
																						${fn:substring(an_item,fn:indexOf(an_item,'#')+1,fn:length(an_item))}									
																					</c:if>													
																				</td>
																			</c:if>
																		</c:forEach>

																		
			
																</c:when>			
																					
																<c:otherwise>
																	<td>
																		${fn:substring(an_item,fn:indexOf(an_item,':')+1,fn:indexOf(an_item,':')+2)}
																	</td>
																</c:otherwise>
															
														</c:choose>
														
														<c:set var="index_num" value="${index_num+1 }"/>

													</c:otherwise>

												</c:choose>	
													
											</c:if>				
									</c:forEach>
									</c:when>
								</c:choose>
							
							
												
										</tr>									
										</c:forEach>
									</c:when>
								</c:choose>
						</tbody>
						
					</table>
				</div>				

				<!-- 모달 팝업 1-->
				<div class="modal fade member_modal" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display:none;" >
				  <div class="modal-dialog">
				    <div class="modal-content">
				    	<div class="modal-header">
				    		<div id="modal-iqno"></div>
							<div id="modal-iwriter"></div>
						</div>
						<div class="modal-body">
							<img id="modal-img2" class="img-responsive img-thumbnail center-block" >
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
				    </div>
				  </div>
				</div>

				<!-- 모달 팝업 텍스트-->
				<div class="modal fade member_modal_text" id="textModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display:none;">
				  <div class="modal-dialog">
				    <div class="modal-content" >
						<div style="padding: 30px;">  
							<div>
								<div id="modal-tqno"></div>
								<div id="modal-twriter"></div>
							</div>
							<div id="modal-text"></div>
						</div>
				    </div>
				  </div>
				</div>

				<!-- 모달 팝업 회원정보 -->
				<div class="modal fade memberinfo" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display:none;">
				  <div class="modal-dialog">
				    <div class="modal-content" >
				      <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">회원정보</h4>
				      </div>
				      <div class="modal-body" id="modal-body_team_info">

				      </div>

				    </div>
				  </div>
				</div>				
				
				<div class="col-lg-12">
					<div class="col-lg-10 center"><jsp:include page="/WEB-INF/inc/paging.jsp"></jsp:include></div>				
				</div>
				
			</div>
		</div>
	</div>
</section>
