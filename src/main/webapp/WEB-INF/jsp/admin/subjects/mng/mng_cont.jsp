<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<c:forEach var="q_item" items="${q_list }" varStatus="j">
		
	<div id="q_modify_${j.index}" class="question back_style">
		
			<div class="qheader">
				<table>
					<tbody>
					<tr>
						<td ><i class="fa fa-edit" ></i></td>
						<td ><h1> 질문 ${q_item.question_num }</h1></td>
						<td >
							<c:choose>
								<c:when test="${q_item.type eq 'S'}"> <span> 단일 응답형 </span></c:when>
								<c:when test="${q_item.type eq 'C'}"> <span> 분기응답형  </span></c:when>
								<c:when test="${q_item.type eq 'M'}"> <span> 중복(복수)응답형 </span></c:when>
								<c:when test="${q_item.type eq 'O'}"> <span> 서열(순서)응답형 </span></c:when>
								<c:when test="${q_item.type eq 'R'}"> <span> 척도 응답형 </span></c:when>
								<c:when test="${q_item.type eq 'W'}"> <span> 서술 응답형 </span></c:when>
								<c:when test="${q_item.type eq 'B'}"> <span> 게시판(정보제공) 형</span></c:when>
								<c:when test="${q_item.type eq 'T'}"> <span> 파일 첨부형 </span></c:when>						
							</c:choose>	
						</td>
					</tr>
					</tbody>
				</table>
			</div>
		
		
				<table class="table table-bordered table-margin" style="margin-bottom:0;border-bottom: 0;">
					<tbody>
						<tr>			
							<td class="td1">질문 입력</td>
							<td colspan=3 class="left">
								<textarea id="bbs_cont" name="bbs_cont" onload="resize(this)" readonly style="width:100%; overflow: hidden;resize:none;font-weight: bold;border: 0px;">${q_item.title }</textarea>
							</td>				
						</tr>
						
						<tr>
							<td class="td1" style="border-bottom:0;">질문 설명 </td>
							<td colspan=3 class="left" style="border-bottom:0;">
								<textarea id="bbs_dsc" name="bbs_cont" onkeyup="resize(this)" readonly style="width: 100%;overflow: hidden;resize:none;font-weight: bold;border: 0px;">${q_item.description }</textarea>
							</td>
						</tr>
					</tbody>
				</table>


		<c:choose>
			<c:when test="${q_item.type eq 'S'}">
				<form id="q_form_${j.index}" onsubmit="return false;"  class="">
					<input type="hidden" name="question_id" value="${q_item.question_id }">				
					<input type="hidden" name="subject_id" value="${vo.subject_id }">
					<input type="hidden" name="question_num" value="${q_item.question_num }">	
										
					<table class="table table-bordered table-margin">
						<tbody>
							<tr>
								<td class="td1">응답보기</td>
								<td colspan=3 class="left">
									<div class="answer">
										<c:forEach var="item" items="${q_item.optionVO }" varStatus="i">
											<div class="optionList row" data-question_id="${item.question_id }" data-options_id="${item.options_id }">												
												<div class="input-group" style="float:left;">
													<input type="radio" > ${item.label_front }
												</div>
												
											    <div class="col-sm-2 checkbox" style="padding-left:10px;">
													<c:choose>
														<c:when test="${item.descyn eq 'Y'}"> <span> (서술형응답) </span></c:when>
													</c:choose>
											    </div>
											    
											    <div class="">
													<div id="O_fileList${item.options_id }">
														<c:forEach var="file" items="${item.fileList }">
															<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" class='img-responsive img-thumbnail'>
														</c:forEach>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>

								</td>
							</tr>
								<tr>
								<td class="td1">옵션</td>
								<td colspan=3 class="left">
									<c:choose>
										<c:when test="${q_item.cont_type eq null }"> <span> 옵션 선택 없음 </span></c:when>
										<c:when test="${q_item.cont_type eq 'I' }"> <span> 이미지 있음 </span></c:when>										
										<c:when test="${q_item.cont_type eq 'V' }"> <span> 동영상 있음 </span></c:when>
									</c:choose>
								</td>
							</tr>	
						</tbody>
					</table>
							<div class=" pull-right right" style="width:100%; margin-right:10px;">
								<button class="btn btn-warning" onclick="fnDeleteQuestion(this.form);">삭제</button>
								<button class="btn btn-theme" onclick="getSubjectMovePage('${vo.subject_id}')">위치이동</button>
								<button class="btn btn-theme" onclick="fnQuestion('${q_item.question_id}');">편집</button>
								<button class="btn btn-theme" onclick="fnCopyQuestion('${q_item.question_id}');">복사추가</button>
							</div>
				</form>
			</c:when>

			<c:when test="${q_item.type eq 'C'}">
				<form id="q_form_${j.index}" onsubmit="return false;"  class="">
					<input type="hidden" name="question_id" value="${q_item.question_id }">				
					<input type="hidden" name="subject_id" value="${vo.subject_id }">
					<input type="hidden" name="question_num" value="${q_item.question_num }">	
															
					<table class="table table-bordered table-margin">
						<tbody>
							<tr>
								<td class="td1">응답보기</td>
								<td colspan=3 class="left">
									<div class="answer">
										<c:forEach var="item" items="${q_item.optionVO }" varStatus="i">
											<div class=" optionList row"
												data-question_id="${item.question_id }"
												data-options_id="${item.options_id }">												

												<div class="input-group" style="float:left; width:50%;">
													<input type="radio" > ${item.label_front }													
												</div>
												
												<div class="input-group" style="padding-left:10px; float:left;">
													다음문항 : ${item.next_num }
											    </div>
											    <div class=" checkbox" style="padding-left:10px;">
													<c:choose>
														<c:when test="${item.endpoint eq 'Y'}"> <span style="color:red"> (종료조건) </span></c:when>
													</c:choose>
											    </div>
											    
											    <div class="">
													<div id="O_fileList${item.options_id }">
														<c:forEach var="file" items="${item.fileList }">
															<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" class='img-responsive img-thumbnail'>
														</c:forEach>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>

								</td>
							</tr>
							
							<tr>
								<td class="td1">옵션</td>
								<td colspan=3 class="left">
									<c:choose>
										<c:when test="${q_item.cont_type eq null }"> <span> 옵션 선택 없음 </span></c:when>
										<c:when test="${q_item.cont_type eq 'I' }"> <span style="color:red"> 이미지 있음 </span></c:when>
										<c:when test="${q_item.cont_type eq 'V' }"> <span style="color:red"> 동영상 있음 </span></c:when>
									</c:choose>
								</td>
							</tr>							
						</tbody>
					</table>
							<div class=" pull-right right" style="width:100%; margin-right:10px;"">
								<button class="btn btn-warning" onclick="fnDeleteQuestion(this.form);">삭제</button>
								<button class="btn btn-theme" onclick="getSubjectMovePage('${vo.subject_id}')">위치이동</button>
								<button class="btn btn-theme" onclick="fnQuestion('${q_item.question_id}');">편집</button>
								<button class="btn btn-theme" onclick="fnCopyQuestion('${q_item.question_id}');">복사추가</button>
							</div>
				</form>
			</c:when>

			<c:when test="${q_item.type eq 'M'}">
				<form id="q_form_${j.index}" onsubmit="return false;"  class="">
					<input type="hidden" name="question_id" value="${q_item.question_id }">				
					<input type="hidden" name="subject_id" value="${vo.subject_id }">
					<input type="hidden" name="question_num" value="${q_item.question_num }">	
															
					<table class="table table-bordered table-margin">
						<tbody>
							<tr>
								<td class="td1">응답보기</td>
								<td colspan=3 class="left">
									<div class="answer">
										<c:forEach var="item" items="${q_item.optionVO }" varStatus="i">
											<div class=" optionList row"
												data-question_id="${item.question_id }"
												data-options_id="${item.options_id }">												

												<div class="input-group" style="float:left;">
													<input type="checkbox"/> ${item.label_front }													
												</div>
																							    
											    <div class="">
													<div id="O_fileList${item.options_id }">
														<c:forEach var="file" items="${item.fileList }">
															<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" class='img-responsive img-thumbnail'>
														</c:forEach>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</td>
							</tr>
								<tr>
								<td class="td1">옵션</td>
								<td colspan=3 class="left">
									<c:choose>
										<c:when test="${q_item.cont_type eq null }"> <span> 옵션 선택 없음 </span></c:when>
										<c:when test="${q_item.cont_type eq 'I' }"> <span style="color:red"> 이미지 있음 </span></c:when>
										<c:when test="${q_item.cont_type eq 'V' }"> <span style="color:red"> 동영상 있음 </span></c:when>
									</c:choose>
								</td>
							</tr>	
						</tbody>
					</table>
							<div class=" pull-right right" style="width:100%; margin-right:10px;"">
								<button class="btn btn-warning" onclick="fnDeleteQuestion(this.form);">삭제</button>
								<button class="btn btn-theme" onclick="getSubjectMovePage('${vo.subject_id}')">위치이동</button>
								<button class="btn btn-theme" onclick="fnQuestion('${q_item.question_id}');">편집</button>
								<button class="btn btn-theme" onclick="fnCopyQuestion('${q_item.question_id}');">복사추가</button>
							</div>
				</form>
			</c:when>


			<c:when test="${q_item.type eq 'O'}">
				<form id="q_form_${j.index}" onsubmit="return false;"  class="">
					<input type="hidden" name="question_id" value="${q_item.question_id }">				
					<input type="hidden" name="subject_id" value="${vo.subject_id }">
					<input type="hidden" name="question_num" value="${q_item.question_num }">	
															
					<table class="table table-bordered table-margin">
						<tbody>
							<tr>
								<td class="td1">응답보기</td>
								<td colspan=3 class="left">
									<div class="answer">
										<c:forEach var="item" items="${q_item.optionVO }" varStatus="i">
											<div class=" optionList row" data-question_id="${item.question_id }" data-options_id="${item.options_id }">												

												<div class="input-group" style="float:left;">
													<input type="checkbox"/> ${item.label_front }													
												</div>
																							    
											    <div class="">
													<div id="O_fileList${item.options_id }">
														<c:forEach var="file" items="${item.fileList }">
															<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" class='img-responsive img-thumbnail'>
														</c:forEach>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>

								</td>
							</tr>
								<tr>
								<td class="td1">옵션</td>
								<td colspan=3 class="left">
									<c:choose>
										<c:when test="${q_item.cont_type eq null }"> <span> 옵션 선택 없음 </span></c:when>
										<c:when test="${q_item.cont_type eq 'I' }"> <span style="color:red"> 이미지 있음 </span></c:when>
										<c:when test="${q_item.cont_type eq 'V' }"> <span style="color:red"> 동영상 있음 </span></c:when>
									</c:choose>
								</td>
							</tr>	
						</tbody>
					</table>
							<div class=" pull-right right" style="width:100%; margin-right:10px;"">
								<button class="btn btn-warning" onclick="fnDeleteQuestion(this.form);">삭제</button>
								<button class="btn btn-theme" onclick="getSubjectMovePage('${vo.subject_id}')">위치이동</button>
								<button class="btn btn-theme" onclick="fnQuestion('${q_item.question_id}');">편집</button>
								<button class="btn btn-theme" onclick="fnCopyQuestion('${q_item.question_id}');">복사추가</button>
							</div>
				</form>
			</c:when>

			<c:when test="${q_item.type eq 'R'}">
				<form id="q_form_${j.index}" onsubmit="return false;"  class="">
					<input type="hidden" name="question_id" value="${q_item.question_id }">				
					<input type="hidden" name="subject_id" value="${vo.subject_id }">
					<input type="hidden" name="question_num" value="${q_item.question_num }">	
															
					<table class="table table-bordered table-margin">
						<tbody>
							<tr>
								<td class="td1">응답보기</td>
								<td colspan=3 class="left">
									<div class="answer">
										<c:forEach var="item" items="${q_item.optionVO }" varStatus="i">
											<div class=" optionList row"
												data-question_id="${item.question_id }"
												data-options_id="${item.options_id }">												

												<div class="input-group" style="float:left;">
													<h4>${item.label_front }</h4>													
												</div>
															
															
												<div>
												
													<c:choose>
														<c:when test="${item.form eq 5}">
					
														<table class="table_five" style="width:100%">
														<tr>
															<td>
																<div class="five_text" style="width:100%">${item.label_1 }</div>
															</td>
															<td>
																<div class="five_text" style="width:100%">${item.label_2 }</div>
															</td>
															<td>
																<div class="five_text" style="width:100%">${item.label_3 }</div>
															</td>
															<td>
																<div class="five_text" style="width:100%">${item.label_4 }</div>
															</td>
															<td>
																<div class="five_text" style="width:100%">${item.label_5 }</div>
															</td>
														</tr>
														
														</c:when>
					
														<c:when test="${item.form eq 7}">
					
														<table class="table_seven" style="width:100%">
															<tr>
																<td colspan="7">
																	<table style="width:100%;">
																		<tr>
																			<td style="width:33%; text-align:left;">${item.label_1 }</td>
																			<td style="width:33%;">${item.label_2 }</td>
																			<td style="width:32%; text-align:right;">${item.label_3 }</td>
																			<td style="width:2%;"></td>
																		</tr>
																	</table>
																	
																</td>
															</tr>
														</c:when>
									
														<c:when test="${item.form eq 9}">
					
														<table class="table_nine" style="width:100%">
															<tr>
																<td colspan="9">
																	<table style="width:100%;">
																		<tr>
																			<td style="width:33%; text-align:left;">${item.label_1 }</td>
																			<td style="width:33%;">${item.label_2 }</td>
																			<td style="width:32%; text-align:right;">${item.label_3 }</td>
																			<td style="width:2%;"></td>
																		</tr>
																	</table>
																	
																</td>
															</tr>
														</c:when>
														
														<c:when test="${item.form eq 10}">
														<table class="table_ten" style="width:100%">
															<tr>
																<td colspan="10">
																	<table style="width:100%;">
																		<tr>
																			<td style="width:33%; text-align:left;">${item.label_1 }</td>
																			<td style="width:33%;">${item.label_2 }</td>
																			<td style="width:32%; text-align:right;">${item.label_3 }</td>
																			<td style="width:2%;"></td>
																		</tr>
																	</table>
																	
																</td>
															</tr>
														</c:when>
					
														<c:when test="${item.form eq 11}">
														<table class="table_eleven" style="width:100%">
															<tr>
																<td colspan="11">
																	<table style="width:100%;">
																		<tr>
																			<td style="width:33%; text-align:left;">${item.label_1 }</td>
																			<td style="width:33%;">${item.label_2 }</td>
																			<td style="width:32%; text-align:right;">${item.label_3 }</td>
																			<td style="width:2%;"></td>
																		</tr>
																	</table>
																	
																</td>
															</tr>							
														
														</c:when>
														
														<c:otherwise>
															<table class="table_three" style="width:100%">
															<tr>
																<td>
																	<div class="three_text" style="margin-left:0; width:100%">${item.label_1 }</div>
																</td>
																<td>
																	<div class="three_text" style="margin-left:0; width:100%">${item.label_2 }</div>
																</td>
																<td>
																	<div class="three_text" style="margin-left:0; width:100%">${item.label_3 }</div>
																</td>
															</tr>									
														</c:otherwise>
													</c:choose>
													
					
					
					
													<tr>
																<c:forEach var="answers" begin="1" end="${item.form}" varStatus="q">
																<td>
																	<input type="radio" name="answers_${i.index }" value="${q.index }">
																</td>
																</c:forEach>									
													</tr>
													
													</table>
																												
												</div>			
												
												<c:choose>
													<c:when test="${ i.count eq fn:length(q_item.optionVO) }">
																			
													</c:when>														
													<c:otherwise>
														<hr class="horizontal">
													</c:otherwise>							
												</c:choose>			
															
											</div>
										</c:forEach>
									</div>

								</td>
							</tr>
								<tr>
								<td class="td1">옵션</td>
								<td colspan=3 class="left">
									<c:choose>
										<c:when test="${q_item.cont_type eq null }"> <span> 옵션 선택 없음 </span></c:when>
										<c:when test="${q_item.cont_type eq 'I' }"> <span style="color:red"> 이미지 있음 </span></c:when>
										<c:when test="${q_item.cont_type eq 'V' }"> <span style="color:red"> 동영상 있음 </span></c:when>
									</c:choose>
								</td>
							</tr>	
						</tbody>
					</table>
							<div class=" pull-right right" style="width:100%; margin-right:10px;"">
								<button class="btn btn-warning" onclick="fnDeleteQuestion(this.form);">삭제</button>
								<button class="btn btn-theme" onclick="getSubjectMovePage('${vo.subject_id}')">위치이동</button>
								<button class="btn btn-theme" onclick="fnQuestion('${q_item.question_id}');">편집</button>
								<button class="btn btn-theme" onclick="fnCopyQuestion('${q_item.question_id}');">복사추가</button>
							</div>
				</form>
			</c:when>

			<c:when test="${q_item.type eq 'W'}">
				<form id="q_form_${j.index}" onsubmit="return false;"  class="">

					<input type="hidden" name="question_id" value="${q_item.question_id }">				
					<input type="hidden" name="subject_id" value="${vo.subject_id }">
					<input type="hidden" name="question_num" value="${q_item.question_num }">	
										
					<table class="table table-bordered table-margin">
						<tbody>
							<tr>
								<td class="td1">응답보기</td>
								<td colspan=3 class="left">
									<div class="answer">
										<c:forEach var="item" items="${q_item.optionVO }" varStatus="i">
											<div class=" optionList row"
												data-question_id="${item.question_id }"
												data-options_id="${item.options_id }">												

												<div class="input-group" style="float:left;">
													${item.label_front }													
												</div>

												<div class="input-group" style="float:left;">
													&nbsp;&nbsp; [ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ] &nbsp;
												</div>
														
												<div class="input-group" style="float:left;">
													${item.label_rear }													
												</div>														
																							    
											    <div class="">
													<div id="O_fileList${item.options_id }">
														<c:forEach var="file" items="${item.fileList }">
															<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" class='img-responsive img-thumbnail'>
														</c:forEach>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>

								</td>
							</tr>
								<tr>
								<td class="td1">옵션</td>
								<td colspan=3 class="left">
									<c:choose>
										<c:when test="${q_item.cont_type eq null }"> <span> 옵션 선택 없음 </span></c:when>
										<c:when test="${q_item.cont_type eq 'I' }"> <span style="color:red"> 이미지 있음 </span></c:when>
										<c:when test="${q_item.cont_type eq 'V' }"> <span style="color:red"> 동영상 있음 </span></c:when>
									</c:choose>
								</td>
							</tr>	
						</tbody>
					</table>
							<div class=" pull-right right" style="width:100%; margin-right:10px;"">
								<button class="btn btn-warning" onclick="fnDeleteQuestion(this.form);">삭제</button>
								<button class="btn btn-theme" onclick="getSubjectMovePage('${vo.subject_id}')">위치이동</button>
								<button class="btn btn-theme" onclick="fnQuestion('${q_item.question_id}');">편집</button>
								<button class="btn btn-theme" onclick="fnCopyQuestion('${q_item.question_id}');">복사추가</button>
							</div>
				</form>
			</c:when>

			<c:when test="${q_item.type eq 'B'}">
				<form id="q_form_${j.index}" onsubmit="return false;"  class="">
					<input type="hidden" name="question_id" value="${q_item.question_id }">				
					<input type="hidden" name="subject_id" value="${vo.subject_id }">
					<input type="hidden" name="question_num" value="${q_item.question_num }">			
													
					<table class="table table-bordered table-margin">
						<tbody>
								<tr>
								<td class="td1">옵션</td>
								<td colspan=3 class="left">
									<c:choose>
										<c:when test="${q_item.cont_type eq null }"> <span> 옵션 선택 없음 </span></c:when>
										<c:when test="${q_item.cont_type eq 'I' }"> <span style="color:red"> 이미지 있음 </span></c:when>
										<c:when test="${q_item.cont_type eq 'V' }"> <span style="color:red"> 동영상 있음 </span></c:when>
									</c:choose>
								</td>
							</tr>	
						</tbody>
					</table>
							<div class=" pull-right right" style="width:100%; margin-right:10px;"">
								<button class="btn btn-warning" onclick="fnDeleteQuestion(this.form);">삭제</button>
								<button class="btn btn-theme" onclick="getSubjectMovePage('${vo.subject_id}')">위치이동</button>
								<button class="btn btn-theme" onclick="fnQuestion('${q_item.question_id}');">편집</button>
								<button class="btn btn-theme" onclick="fnCopyQuestion('${q_item.question_id}');">복사추가</button>
							</div>
				</form>
			</c:when>

			<c:when test="${q_item.type eq 'T'}">
				<form id="q_form_${j.index}" onsubmit="return false;"  class="">
					<input type="hidden" name="question_id" value="${q_item.question_id }">				
					<input type="hidden" name="subject_id" value="${vo.subject_id }">
					<input type="hidden" name="question_num" value="${q_item.question_num }">	
															
					<table class="table table-bordered table-margin">
						<tbody>
							<tr>
								<td class="td1">응답보기</td>
								<td colspan=3 class="left">
									<div class="answer">
										<c:forEach var="item" items="${q_item.optionVO }" varStatus="i">
											<div class="optionList row"
												data-question_id="${item.question_id }"
												data-options_id="${item.options_id }">												

											    <div class="">
													<c:choose>
														<c:when test="${item.endpoint eq 'Y'}"> 
															<span style="color:red"> 첨부 필수 </span>
															<c:choose>
															<c:when test="${item.examrequire eq 'Y' }">
																<p style="color:red">설명 필수</p>
															</c:when>
															<c:when test="${item.examrequire ne 'Y' }">
																<p style="color:blue">설명 선택 </p>
															</c:when>
															</c:choose>
														</c:when>
                            							<c:when test="${item.endpoint ne 'Y'}"> 
                            								<span style="color:blue"> 첨부 선택</span>
                            							</c:when>														
													</c:choose>
											    </div>

												<div class="input-group" style="float:left;">
												<c:choose>
												  <c:when test="${!empty item.label_front }">
												    <span> ${item.label_front } &nbsp;&nbsp; [ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ] </span></c:when>																										
												</c:choose>	
												</div>
												

											    
											    <div class="">
													<div id="O_fileList${item.options_id }">
														<c:forEach var="file" items="${item.fileList }">
															<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" class='img-responsive img-thumbnail'>
														</c:forEach>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>

								</td>
							</tr>
								<tr>
								<td class="td1">옵션</td>
								<td colspan=3 class="left">
									<c:choose>
										<c:when test="${q_item.cont_type eq null }"> <span> 옵션 선택 없음 </span></c:when>
										<c:when test="${q_item.cont_type eq 'I' }"> <span style="color:red"> 이미지 있음 </span></c:when>
										<c:when test="${q_item.cont_type eq 'V' }"> <span style="color:red"> 동영상 있음 </span></c:when>
									</c:choose>
								</td>
							</tr>	
						</tbody>
					</table>
							<div class=" pull-right right" style="width:100%; margin-right:10px;"">
								<button class="btn btn-warning" onclick="fnDeleteQuestion(this.form);">삭제</button>
								<button class="btn btn-theme" onclick="getSubjectMovePage('${vo.subject_id}')">위치이동</button>
								<button class="btn btn-theme" onclick="fnQuestion('${q_item.question_id}');">편집</button>
								<button class="btn btn-theme" onclick="fnCopyQuestion('${q_item.question_id}');">복사추가</button>
							</div>
				</form>

			</c:when>


									
			<c:otherwise>
			</c:otherwise>		
		</c:choose>
		
	</div>

</c:forEach>
