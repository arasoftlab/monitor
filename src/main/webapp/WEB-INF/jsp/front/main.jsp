<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
.mask{height:auto !important;}
.item {width:31%; height:70px;}
</style>

<%
	Object m_infos_tmp = session.getAttribute("grade");
	String m_infos = (String)m_infos_tmp;
%>
<div class="fusection8">
	<div class="container">
		<div style="text-align:center;position:relative;" class="mgt30">
			<img src="<c:url value='/img/front/main.jpg'/>" style="width:100%;padding-bottom:10px;"/>
		</div>
		<div style="text-align:center;position:relative;"class="main_title">
			<img src="<c:url value='/img/front/s_main_title.png'/>" style="width:50%;"/>
		</div>
	</div>
</div>

<!-- 메인콘텐츠 02 -->
<div class="fusection8" style="margin-bottom:10px;padding-bottom: 0;">
	<div class="container">
		<div class="one_fourth animate notice_left index" data-anim-type="fadeIn" data-anim-delay="300">
     
			<div class="info">
				<div class="message-box-wrap">
					<strong style="color:indigo;">공지사항</strong>
					<a href="<c:url value='/front/notice/all/list.do'/>"><span style="float:right;color:navy;"><b>more</b></span></a>
				</div>
			</div>
             
			  <!-- 게시판 시작 -->
			<div class="notice_bg">
				<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF" class='board_output '>
					<tr>
						<td>
							<table border='0' cellspacing='0' cellpadding='0' width='100%' class='board_output'>
								<c:choose>
									<c:when test="${!empty n_list }">
										<c:forEach var="item" items="${n_list }">
											<tr class='board_output_1_tr'>
												<td width='1%'>
													<img alt='' src='<c:url value='/img/front/output_ol.gif'/>' border='0' align='absmiddle'>
												</td>
												<td width='99%' style='word-break:break-all;overflow:hidden;' class='bd_out1'>
													<a href='<c:url value='/front/notice/all/view.do?notice_id=${item.notice_id }'/>'>${item.title }</a>
												</td>
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>								
							</table>
						</td>
					</tr>
				 <!--more-->
				</table>
				<!-- 게시판 끝 -->
		
			</div>
		
		</div><!-- end section -->



        
		<div class="one_fourth animate index" data-anim-type="fadeIn" data-anim-delay="250">
    
			<div class="info">
				<div class="message-box-wrap">
					<strong style="color:indigo;">모니터링 과제</strong>
					<a href="<c:url value='/front/monitoring/monitoring/list.do'/>"><span style="float:right;color:navy;"><b>more</b></span></a>
				</div>
			</div>
			
         
			<div class="tabs-content3 two">
        
				<div id="example-4-tab-1" class="tabs-panel3">
					

					<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF" class='board_output'>
						<tr>
							<td>
								<table border='0' cellspacing='0' cellpadding='0' width='100%' class='board_output pc_table'>
									<c:choose>
										<c:when test="${!empty s_list }">
											<c:forEach var="sitem" items="${s_list }">
												<tr class='board_output_1_tr'>
													<td width='1%'>
														<img alt='' src='<c:url value='/img/front/output_ol.gif'/>' border='0' align='absmiddle'>
													</td>
													<td style='word-break:break-all;overflow:hidden;' class='bd_out1'>

																
																
														<%
														if (m_infos == null){
														%>
															${sitem.title }
														<%
														}else{
														%>
	
																<c:choose>
																	<c:when test="${sitem.status eq '02' }">
																		<a href='javascript:alert("공지사항에서 상세내용을 확인 후 신청해 주세요.");'>${sitem.title }</a>
																	</c:when>																	
																	<c:otherwise>
																		<a href='<c:url value='/front/monitoring/monitoring/view.do?subject_id=${sitem.subject_id }'/>'>${sitem.title }</a>
																	</c:otherwise>
																</c:choose>															
														<%													
														}
															
														%>	
													</td>
													
													<td width="2%"></td>
													<td align='center' style='word-break:break-all;overflow:hidden;width:25%;'>
														<c:choose>

															<c:when test="${sitem.status eq '01' }">

															</c:when>
															<c:when test="${sitem.status eq '02' }">
																<img src="<c:url value='/img/front/btn_done2.png'/>">
															</c:when>
															<c:when test="${sitem.status eq '03' }">
																<img src="<c:url value='/img/front/btn_done3.png'/>">
															</c:when>
															<c:when test="${sitem.status eq '04' }">
																<img src="<c:url value='/img/front/btn_done4.png'/>">
															</c:when>
															<c:when test="${sitem.status eq '05' }">
																<img src="<c:url value='/img/front/btn_done5.png'/>">
															</c:when>
															<c:when test="${sitem.status eq '06' }">
																<img src="<c:url value='/img/front/btn_done6.png'/>">
															</c:when>
															<c:when test="${sitem.status eq '07' }">
																<img src="<c:url value='/img/front/btn_done7.png'/>">
															</c:when>

														</c:choose>


													</td>													
												</tr>
											</c:forEach>
										</c:when>
									</c:choose>																	
								</table>
							</td>
						</tr>
					 <!--more-->
					</table>
					<!-- 현장과제 끝 -->
				</div><!-- end tab 1 -->
			</div>
		</div><!-- end section -->




    
		<div class="one_fourth last animate index" data-anim-type="fadeIn" data-anim-delay="200" style="min-height:220px">
     
			<div class="info">
				<div class="message-box-wrap">
					<strong style="color:indigo;">이야기방</strong>
					<a href="<c:url value='/front/community/story/story_list.do'/>"><span style="float:right;color:navy;"><b>more</b></span></a>
				</div>
			</div>
             
			  <!-- 이야기방 게시판 시작 -->
			<div class="notice_bg">
				<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF" class='board_output'>
					<tr>
						<td>
							<table border='0' cellspacing='0' cellpadding='0' width='100%' class='board_output'>
									<c:choose>
										<c:when test="${!empty c_list }">
											<c:forEach var="citem" items="${c_list }">
												<tr class='board_output_1_tr'>
													<td width='1%'>
														<img alt='' src='<c:url value='/img/front/output_ol.gif'/>' border='0' align='absmiddle'>
													</td>
													<td style='word-break:break-all;overflow:hidden;' class='bd_out1'>
														<a href='<c:url value='/front/community/story/view.do?cont_uuid=${citem.cont_uuid }'/>'>${citem.title }</a>
													</td>																									
												</tr>
											</c:forEach>
										</c:when>
									</c:choose>																								
							</table>
						</td>
					</tr>
				 <!--more-->
				</table>
				<!-- 게시판 끝 -->

			</div>
		</div>
		<!-- end section -->
				
		<div class="one_fourth animate notice_left " data-anim-type="fadeIn" data-anim-delay="300">

			<div class="notice_bg" style="padding:0;">
  		  <!-- 여론조사 배너 -->
				<div id="left_banner" class="left_menu_banner" >
					<div style="padding-top:10px;text-align:center;">
						<a href="http://research.seoul.go.kr/" target="blank">
							<img src="<c:url value='/img/front/ban_search.jpg'/>" style="width:90%;height: 65px;"/>
						</a>
					</div> 
					
		   <!-- 서울사랑 배너 -->
				</div>
				<div id="left_banner" class="left_menu_banner" >
					<div style="padding-top:10px;text-align:center;">
						<a href="http://love.seoul.go.kr/" target="blank">
							<img src="<c:url value='/img/front/banner_loveseoul.jpg'/>" style="width:90%;height: 65px;"/>
						</a>
					</div> 
				</div>
				
				
				<!-- class=left_menu_banner2->display:none -->
				  <!-- 여론조사 배너 -->
				<div id="left_banner" class="left_menu_banner2" >
					<div style="padding-top:10px;text-align:center;">
						<a href="http://research.seoul.go.kr/" target="blank">
							<img src="<c:url value='/img/front/ban_search.jpg'/>" />
						</a>
					</div> 
				</div>
		   <!-- 서울사랑 배너 -->				
				<div id="left_banner" class="left_menu_banner2" >
					<div style="padding-top:10px;text-align:center;">
						<a href="http://love.seoul.go.kr/" target="blank">
							<img src="<c:url value='/img/front/banner_loveseoul.jpg'/>" />
						</a>
					</div> 

				</div>
			</div>
		
		</div><!-- end section -->


        
		<div class="one_fourth animate" data-anim-type="fadeIn" data-anim-delay="250">
    
			<div class="info">
				<div class="message-box-wrap">
					<strong style="color:indigo;">자율모니터링</strong>
				</div>
			</div>
			
         
			<div class="tabs-content3 two">
				<div id="example-4-tab-2" >
					<div class="col-md-12" style="margin-top:10px;">
						<div class="col-sm-6" style="text-align:center;padding:0;float:left;">
							<a href="http://oasis.seoul.go.kr/" target="blank">
								<img src="<c:url value='/img/front/oasis2.png'/>"/>
							</a>
							<br/>
						
						</div>
						<div class="col-sm-6" style="text-align:center;padding:0;float:left;">
							<a href="http://eungdapso.seoul.go.kr/" target="blank">
								<img src="<c:url value='/img/front/wifi2.png'/>"/>
							</a>
							<br/>
							
						</div>

					</div>
				</div>
			</div>
		</div><!-- end section -->


    
		<div class="one_fourth last animate" data-anim-type="fadeIn" data-anim-delay="200">
     
			<div class="info">
				<div class="message-box-wrap">
					<strong style="color:indigo;">포토갤러리</strong>
					<a href="<c:url value='/front/community/photo/photo_list.do'/>"><span style="float:right;color:navy;"><b>more</b></span></a>
				</div>
			</div>
             
			  <!-- 포토갤러리 게시판 시작 -->
			<link rel="StyleSheet" href="<c:url value='/css/front/css/board_1.css'/>" type="text/css">
			<div class="notice_bg">
				<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF" class='board_output'>
					<tr>
						<td>
							<table border='0' cellspacing='0' cellpadding='0' width='100%' class='board_output'>
								<tr>
									<td colspan="2" style=" text-align:center;">

										<div style="width:100%">
										<c:choose>
											<c:when test="${!empty p_list }">
												<c:forEach var="p_item" items="${p_list }" varStatus="img_c">
													<c:if test="${img_c.index < 3}">
														<div class="item">
															<div>
																<a href="<c:url value='/front/community/photo/view.do?cont_uuid=${p_item.cont_uuid }'/>">
																	<img src="<c:url value='${p_item.fileList[0].savePath }/${p_item.fileList[0].unqFileName }'/>" style="width: 100%; height:70px;">
																</a>
															</div>
														</div>
													</c:if>
												</c:forEach>
											</c:when>
										</c:choose>
										</div>

									</td>
								</tr>
							</table>
						</td>
					</tr>
				 <!--more-->
				</table>
				<!-- 게시판 끝 -->

			</div>

			
  
		</div><!-- end section -->
    
	</div>
</div><!-- end features section 8 -->