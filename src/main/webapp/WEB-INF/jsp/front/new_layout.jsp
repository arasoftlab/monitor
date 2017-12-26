<html lang="en" class="js"><head>
	<meta http-equiv="Content-Type" content="text/html; content=&quot;no&quot; charset=utf-8; imagetoolbar;">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta name="author" content="http://bootstraptaste.com">
	<title>꼼꼼한 서울씨</title>
	<link href="/monitor/css/front/css/reset.css" rel="stylesheet">
	<link href="/monitor/css/front/css/style.css" rel="stylesheet">
	<link href="/monitor/css/front/css/font-awesome.min.css" rel="stylesheet">
	<link href="/monitor/css/front/css/responsive-leyouts.css" rel="stylesheet">
	<link href="/monitor/css/front/css/animations.min.css" rel="stylesheet">
	<link href="/monitor/css/front/css/slate.css" rel="stylesheet">
	
	<link href="/monitor/css/front/css/stickytwo.css" rel="stylesheet">
	<link href="/monitor/css/front/css/bootstrap.min.css" rel="stylesheet">
	<link href="/monitor/css/front/css/demo.css" rel="stylesheet">
	<link href="/monitor/css/front/css/menu.css" rel="stylesheet">
	
	<link href="/monitor/css/front/css/responsive-tabs3.css" rel="stylesheet">
	<link href="/monitor/css/front/css/skin.css" rel="stylesheet">
	<link href="/monitor/css/front/css/ui.progress-bar.css" rel="stylesheet">
	
	<link href="/monitor/css/front/css/jcarousel.responsive.css" rel="stylesheet">
	<link href="/monitor/css/front/css/base.css" rel="stylesheet">

	<script src="/monitor/js/jquery.js"></script>

	
</head>
<body>
	



<script>

$(document).ready(function() {
	fnCheckSession_idView();
});

function fnCheckSession_idView(){
	$.ajax({
		async : true,
		type : "POST",
		url : "/monitor/member/checkSession.do",
		success : function(data){
			if(data.result == "success"){


                                if(data.grade == "admin"){
                                        location.href="https://www2.seoul.go.kr/monitor/sso/logout.jsp";
                                }


				$("#account_id").text(data.account.id);
				
				$("#login_form").css("display" , "none");
				$("#logout_form").css("display" , "block");
				
			}
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

function fnCheckSession(){

	$.ajax({
		async : false,
		type : "POST",
		url : "/monitor/member/checkSession.do",
		success : function(data){
			if(data.result == "success"){
								
				$("#account_id").text(data.account.name);
				
				$("#login_form").css("display" , "none");
				$("#logout_form").css("display" , "block");
			}else{
				$('html').css('display','none');
				location.href="https://www2.seoul.go.kr/monitor/front/main.do";
				alert("세션이 끊겼습니다.\n로그인 후 이용하세요.");
			}
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			
		}
	});
}

</script>

<div class="site_wrapper">

<style type="text/css">
	.content_right img {max-width: 100% !important; height: auto !important;}
	.logout_form{display:none;}
</style>


<header id="header">
 
	<div id="trueHeader">
    
		<div class="wrapper">
    
    
			<div id="m_hidden" class="logoarea">
				<div class="container">
    
					<!-- Logo -->
					<div id="m_hidden" class="logo">
						<a href="http://www.seoul.go.kr/main/index.html" id="logo" target="blank"></a>
						<ul class="sub_title">
							<li style="float:left; margin-right:10px;">
								<a href="http://www.seoul.go.kr/story/autumn/" target="blank"><img src="/monitor/img/front/new.png">
									<div style="margin-top:-27px;margin-left:30px;">
										<span style="margin-left:5px;font-size:xx-small">가을엔 길에서 놀자'서울거리예술축제'</span>
									</div>
								</a>
							</li>
							<li><a href="https://www.seoul.go.kr/HomepageCorrect/index.html" target="blank"><img src="/monitor/img/front/baro.png"></a></li>
						</ul>
					</div>
    
					<div id="m_hidden" class="right_links">
        
						<ul class="login_form" id="login_form">  
							<li class="link"><a href="/monitor/front/sitemap.do"><i class="fa fa-edit"></i> 사이트맵</a></li>
							<li class="link"><a href="https://www.seoul.go.kr/seoul/jsp/member/UserLogin.jsp?SITE_GB=GB002&amp;refresh_url=https://www2.seoul.go.kr/monitor/sso/index.jsp"><i class="fa fa-edit"></i> 로그인</a></li>            
						</ul>
						<ul class="logout_form" id="logout_form">
							<li> <label id="account_id"></label> 님  </li>            
							<li class="link"><a href="/monitor/front/sitemap.do"><i class="fa fa-edit"></i> 사이트맵</a></li>
							<li class="link"><a href="/monitor/sso/logout.jsp"><i class="fa fa-edit"></i> 로그아웃</a></li>            
						</ul>
						
					</div><!-- end right links -->
    
    
				</div>
			</div>
  
			<!-- Menu -->
			<div class="menu_main" style="
    margin-top: 16px;
">
    
				<div class="container">
					
					<div class="navbar yamm navbar-default">
    
						<div class="container" style="z-index:9;">
							<div class="navbar-header">
								<div style="padding-bottom:15px;" class="navbar-toggle .navbar-collapse .pull-right ">
									<a href="/monitor/front/main.do" style="z-index:99999999;">
										<img src="/monitor/img/front/top_logo2.png" class="s_logo" style="width: 20%;"></a>
									<button type="button" data-toggle="collapse" data-target="#navbar-collapse-1" class="collapsed"> <i class="fa fa-bars"></i>
									</button>
								</div>
						  </div>
						  
							<div id="navbar-collapse-1" class="navbar-collapse collapse" style="z-index: 99; height: 0px;">
								<a href="/monitor/front/main.do" style="padding:0 10px;float:left;" class="logo"><img src=" /monitor/img/front/top_logo2.png" style="
    width: 100%;
"></a>
								<ul class="nav navbar-nav">
									<li class="first"><a href="/monitor/front/info/join/info_list.do" class=""><b>꼼꼼한 서울씨</b></a></li>
			                        <li><a href="/monitor/front/notice/all/list.do" class=""><b>공지사항</b></a></li>
			                        <li><a href="/monitor/front/monitoring/monitoring/list.do" class=""><b>모니터링 과제</b></a></li>
			                        <li><a href="/monitor/front/community/photo/photo_list.do" class=""><b>게시판</b></a></li>
			                        <li><a href="/monitor/front/mypage/history/list.do" class=""><b>마이페이지</b></a></li>
									
								</ul>      
        
            
							</div>
						</div>
					</div>
     
				</div>
			</div><!-- end menu -->
        
		</div>
    
	</div>
    
</header>

	


	





<style>
.mask{height:auto !important;}
</style>

<div class="fusection8" style="
    /* margin-top: -32px; */
    padding-bottom: 0px;
">
	<div class="container" style="
    /* margin-top: -32px; */
    /* display: none; */
">
		<div style="text-align:center;position:relative;" class="mgt30">
			<img src="/monitor/img/front/main.jpg" style="width:100%;margin-top: -109px;">
		</div>
		<div style="text-align:center;position:relative;" class="main_title">
			<img src="/monitor/img/front/s_main_title.png" style="width: 47%;margin-top: 72px;">
		</div>
	</div>
</div>

<!-- 메인콘텐츠 02 -->
<div class="fusection8" style="margin-bottom: 10px;padding-bottom: 0;">
	<div class="container">
	
	
	

		<div class="one_fourth animate notice_left index fadeIn" data-anim-type="fadeIn" data-anim-delay="300">
     
			<div class="info">
				<div class="message-box-wrap" style="
    border-style: solid;
    border-bottom: 4px solid #EAEAEA;
">
					<strong style="color:indigo;">공지사항</strong>
					<a href="/monitor/front/notice/all/list.do"><span style="float:right;color:navy;"><b>more</b></span></a>
				</div>
			</div>
             
			  <!-- 게시판 시작 -->
			<div class="notice_bg">
				<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF" class="board_output ">
					<tbody><tr>
						<td>
							<table border="0" cellspacing="0" cellpadding="0" width="100%" class="board_output">
								
									
										
											<tbody><tr class="board_output_1_tr">
												<td width="1%">
													<img alt="" src="/monitor/img/front/output_ol.gif" border="0" align="absmiddle">
												</td>
												<td width="99%" style="word-break:break-all;overflow:hidden;" class="bd_out1">
													<a href="/monitor/front/notice/all/view.do?notice_id=121">신규과제 및 응답 테스트</a>
												</td>
											</tr>
										
											<tr class="board_output_1_tr">
												<td width="1%">
													<img alt="" src="/monitor/img/front/output_ol.gif" border="0" align="absmiddle">
												</td>
												<td width="99%" style="word-break:break-all;overflow:hidden;" class="bd_out1">
													<a href="/monitor/front/notice/all/view.do?notice_id=102">리눅스 서버 이미지 올리기</a>
												</td>
											</tr>
										
											<tr class="board_output_1_tr">
												<td width="1%">
													<img alt="" src="/monitor/img/front/output_ol.gif" border="0" align="absmiddle">
												</td>
												<td width="99%" style="word-break:break-all;overflow:hidden;" class="bd_out1">
													<a href="/monitor/front/notice/all/view.do?notice_id=81">현장과제 진행 연결 공지</a>
												</td>
											</tr>
										
											<tr class="board_output_1_tr">
												<td width="1%">
													<img alt="" src="/monitor/img/front/output_ol.gif" border="0" align="absmiddle">
												</td>
												<td width="99%" style="word-break:break-all;overflow:hidden;" class="bd_out1">
													<a href="/monitor/front/notice/all/view.do?notice_id=82">설문과제 연결 공지</a>
												</td>
											</tr>
										
											<tr class="board_output_1_tr">
												<td width="1%">
													<img alt="" src="/monitor/img/front/output_ol.gif" border="0" align="absmiddle">
												</td>
												<td width="99%" style="word-break:break-all;overflow:hidden;" class="bd_out1">
													<a href="/monitor/front/notice/all/view.do?notice_id=83">단순공지1</a>
												</td>
											</tr>
										
									
																
							</tbody></table>
						</td>
					</tr>
				 <!--more-->
				</tbody></table>
				<!-- 게시판 끝 -->
		
			</div>
		
		</div><!-- end section -->



        
		<div class="one_fourth animate index fadeIn" data-anim-type="fadeIn" data-anim-delay="250">
    
			<div class="info">
				<div class="message-box-wrap" style="
    border-style: solid;
    border-bottom: 4px solid #EAEAEA;
">
					<strong style="color:indigo;">모니터링 과제</strong>
					<a href="/monitor/front/monitoring/monitoring/list.do"><span style="float:right;color:navy;"><b>more</b></span></a>
				</div>
			</div>
			
         
			<div class="tabs-content3 two">
        
				<div id="example-4-tab-1" class="tabs-panel3">
					

					<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF" class="board_output">
						<tbody><tr>
							<td>
								<table border="0" cellspacing="0" cellpadding="0" width="100%" class="board_output pc_table">
									
										
											
												<tbody><tr class="board_output_1_tr">
													<td width="1%">
														<img alt="" src="/monitor/img/front/output_ol.gif" border="0" align="absmiddle">
													</td>
													<td style="width:255px;word-break:break-all;overflow:hidden;" class="bd_out1">
														<a href="/monitor/front/monitoring/monitoring/view.do?notice_id=221">신규과제 및 응답 테스트</a>
													</td>
													
													<td width="2%"></td>
													<td align="center" style="word-break:break-all;overflow:hidden;width:17%;">
														<img src="/monitor/img/front/btn_done.png">
													</td>													
												</tr>
											
												<tr class="board_output_1_tr">
													<td width="1%">
														<img alt="" src="/monitor/img/front/output_ol.gif" border="0" align="absmiddle">
													</td>
													<td style="width:255px;word-break:break-all;overflow:hidden;" class="bd_out1">
														<a href="/monitor/front/monitoring/monitoring/view.do?notice_id=202">서열형 테스트 </a>
													</td>
													
													<td width="2%"></td>
													<td align="center" style="word-break:break-all;overflow:hidden;width:17%;">
														<img src="/monitor/img/front/btn_done.png">
													</td>													
												</tr>
											
												<tr class="board_output_1_tr">
													<td width="1%">
														<img alt="" src="/monitor/img/front/output_ol.gif" border="0" align="absmiddle">
													</td>
													<td style="width:255px;word-break:break-all;overflow:hidden;" class="bd_out1">
														<a href="/monitor/front/monitoring/monitoring/view.do?notice_id=201">테스트22</a>
													</td>
													
													<td width="2%"></td>
													<td align="center" style="word-break:break-all;overflow:hidden;width:17%;">
														<img src="/monitor/img/front/btn_done.png">
													</td>													
												</tr>
											
												<tr class="board_output_1_tr">
													<td width="1%">
														<img alt="" src="/monitor/img/front/output_ol.gif" border="0" align="absmiddle">
													</td>
													<td style="width:255px;word-break:break-all;overflow:hidden;" class="bd_out1">
														<a href="/monitor/front/monitoring/monitoring/view.do?notice_id=181">bank test</a>
													</td>
													
													<td width="2%"></td>
													<td align="center" style="word-break:break-all;overflow:hidden;width:17%;">
														<img src="/monitor/img/front/btn_done.png">
													</td>													
												</tr>
											
												<tr class="board_output_1_tr">
													<td width="1%">
														<img alt="" src="/monitor/img/front/output_ol.gif" border="0" align="absmiddle">
													</td>
													<td style="width:255px;word-break:break-all;overflow:hidden;" class="bd_out1">
														<a href="/monitor/front/monitoring/monitoring/view.do?notice_id=161">종료된 과제 1</a>
													</td>
													
													<td width="2%"></td>
													<td align="center" style="word-break:break-all;overflow:hidden;width:17%;">
														<img src="/monitor/img/front/btn_done.png">
													</td>													
												</tr>
											
										
																										
								</tbody></table>
							</td>
						</tr>
					 <!--more-->
					</tbody></table>
					<!-- 현장과제 끝 -->
				</div><!-- end tab 1 -->
			</div>
		</div><!-- end section -->




    
		<div class="one_fourth last animate index fadeIn" data-anim-type="fadeIn" data-anim-delay="200">
     
			<div class="info">
				<div class="message-box-wrap" style="
    border-style: solid;
    border-bottom: 4px solid #EAEAEA;
">
					<strong style="color:indigo;">이야기방</strong>
					<a href="/monitor/front/community/story/story_list.do"><span style="float:right;color:navy;"><b>more</b></span></a>
				</div>
			</div>
             
			  <!-- 게시판 시작 -->
			<div class="notice_bg">
				<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF" class="board_output">
					<tbody><tr>
						<td>
							<table border="0" cellspacing="0" cellpadding="0" width="100%" class="board_output">
									
										
											
												<tbody><tr class="board_output_1_tr">
													<td width="1%">
														<img alt="" src="/monitor/img/front/output_ol.gif" border="0" align="absmiddle">
													</td>
													<td style="word-break:break-all;overflow:hidden;" class="bd_out1">
														<a href="/monitor/front/community/story/view.do?cont_uuid=9c7b1c2f-dbd8-4735-b5ca-eb9f5a34ae0f">낄낄낄 테스트 잘됨</a>
													</td>
																									
												</tr>
											
												<tr class="board_output_1_tr">
													<td width="1%">
														<img alt="" src="/monitor/img/front/output_ol.gif" border="0" align="absmiddle">
													</td>
													<td style="word-break:break-all;overflow:hidden;" class="bd_out1">
														<a href="/monitor/front/community/story/view.do?cont_uuid=f7156ab0-6759-4081-b38a-51dc03f0e9d3">test</a>
													</td>
																									
												</tr>
											
												<tr class="board_output_1_tr">
													<td width="1%">
														<img alt="" src="/monitor/img/front/output_ol.gif" border="0" align="absmiddle">
													</td>
													<td style="word-break:break-all;overflow:hidden;" class="bd_out1">
														<a href="/monitor/front/community/story/view.do?cont_uuid=714490be-12f7-4727-91cb-59e66f231e69">이야기방 11</a>
													</td>
																									
												</tr>
											
										
																																	
							</tbody></table>
						</td>
					</tr>
				 <!--more-->
				</tbody></table>
				<!-- 게시판 끝 -->

			</div>

			
  
		</div><!-- end section -->
		
		<div>
			<img src="/monitor/img/front/line.JPG" style="visibility: hidden;width:100%;">
		</div>
		
		<div class="one_fourth animate notice_left  fadeIn" data-anim-type="fadeIn" data-anim-delay="300">
                  
			<div class="notice_bg" style="padding: 0;">
				<div id="left_banner" class="left_menu_banner">
					<div style="padding-top:10px;text-align:center;">
						<a href="http://research.seoul.go.kr/panelWebList.do" target="blank">
							<img src="/monitor/img/front/ban_search.jpg" style="width: 90%;height: 65px;">
						</a>
					</div> 
					
				  <!-- 여론조사 배너 -->
				</div>

				<div id="left_banner" class="left_menu_banner2">
					<div style="padding-top:10px;text-align:center;">
						<a href="http://research.seoul.go.kr/panelWebList.do" target="blank">
							<img src="/monitor/img/front/ban_search.jpg" style="width:100%; height: 65px;">
						</a>
					</div> 
					
				  <!-- 여론조사 배너 -->
				</div>
			</div>


			<!-- 내손안에 서울로 바뀌어야함. 링크 & 이미지 -->
			
			<div class="notice_bg" style="padding: 0;">
				<div id="left_banner" class="left_menu_banner">
					<div style="text-align:center;">
						<a href="http://research.seoul.go.kr/panelWebList.do" target="blank">
							<img src="/monitor/img/front/ban_search.jpg" style="width: 90%;height: 65px;">
						</a>
					</div> 
					
				  <!-- 여론조사 배너 -->
				</div>

				<div id="left_banner" class="left_menu_banner2">
					<div style="text-align:center;">
						<a href="http://research.seoul.go.kr/panelWebList.do" target="blank">
							<img src="/monitor/img/front/ban_search.jpg" style="width:100%; height: 65px;">
						</a>
					</div> 
					
				  <!-- 여론조사 배너 -->
				</div>
			</div>

		
		</div><!-- end section -->



        
		<div class="one_fourth animate fadeIn" data-anim-type="fadeIn" data-anim-delay="250">
    
			<div class="info">
				<div class="message-box-wrap" style="
    border-style: solid;
    border-bottom: 4px solid #EAEAEA;
">
					<strong style="color:indigo;">자율모니터링</strong>
				</div>
			</div>
			
         
			<div class="tabs-content3 two">
				<div id="example-4-tab-2">
					<div class="col-md-12" style="margin-top:10px;">
						<div class="col-sm-6" style="text-align:center;padding:0;float:left;">
							<a href="http://oasis.seoul.go.kr/" target="blank">
								<img src="/monitor/img/front/oasis2.png">
							</a>
							<br>
							

						</div>
						<div class="col-sm-6" style="text-align:center;padding:0;float:left;">
							<a href="http://eungdapso.seoul.go.kr/" target="blank">
								<img src="/monitor/img/front/wifi2.png">
							</a>
							<br>
							

						</div>

					</div>
				</div>
			</div>
		</div><!-- end section -->




    
		<div class="one_fourth last animate fadeIn" data-anim-type="fadeIn" data-anim-delay="200">
     
			<div class="info">
				<div class="message-box-wrap" style="
    border-style: solid;
    border-bottom: 4px solid #EAEAEA;
">
					<strong style="color:indigo;">포토갤러리</strong>
					<a href="/monitor/front/community/photo/photo_list.do"><span style="float:right;color:navy;"><b>more</b></span></a>
				</div>
			</div>
             
			  <!-- 게시판 시작 -->
			<link rel="StyleSheet" href="/monitor/css/front/css/board_1.css" type="text/css">
			<div class="notice_bg">
				<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF" class="board_output">
					<tbody><tr>
						<td>
							<table border="0" cellspacing="0" cellpadding="0" width="100%" class="board_output">
								<tbody><tr>
									<td colspan="2" style=" text-align:center;">

										<div id="carouseltest" class="carousel_wrap">
										
											
												
													<div class="mask" style="position:relative; overflow:hidden; width:100%; height:23px;"><div class="innerWrapper" style="position: relative; width: 625px; left: 0px;"><div class="item">
														<div>
															<img src="/monitor/upload/201612/1480588719807.jpg" style="width: 100%;">
														</div>
													</div><div class="item">
														<div>
															<img src="/monitor/upload/201612/1480588582699.jpg" style="width: 100%;">
														</div>
													</div><div class="item">
														<div>
															<img src="/monitor/" style="width: 100%;">
														</div>
													</div><div class="item">
														<div>
															<img src="/monitor/" style="width: 100%;">
														</div>
													</div><div class="item">
														<div>
															<img src="/monitor/" style="width: 100%;">
														</div>
													</div></div></div>
												
													
												
													
												
													
												
													
												
											
										



										<div class="left-nav-btn"></div><div class="right-nav-btn"></div></div>
									</td>
								</tr>
							</tbody></table>
						</td>
					</tr>
				 <!--more-->
				</tbody></table>
				<!-- 게시판 끝 -->

			</div>

			
  
		</div><!-- end section -->
    
	</div>
</div><!-- end features section 8 -->
	

<!-- 
<div class="space" style="background-color: white;"></div>
<div id="footer">
	<div>
		<div class="otherLink">
			<ul style="float: left; width: 100%;margin-top:-5px;">
				<li><a href="/monitor/personlist.do">개인정보취급방침</a></li>
				<li><a href="/monitor/email.do">이메일무단수집거부</a></li>
				<li><a href="/monitor/sitemap.do">사이트맵</a></li>
			</ul>
		</div>
	
		<div class="siteinfo">
			<div class="secinfo" style="width: 960px;">
				<ul class="phonenumbs">
					<li>서울특별시 용산구 청파로 47길 100(청파동 2가, 숙명여자대학교 이과대학)</li><li>|</li>
					<li class="p_num">대표전화: 02-710-9199</li><li>|</li>
					<li class="p_num">팩스번호: 02-2077-7322</li><li>|</li>
					<li class="p_num">이메일 : life_sys@sm.ac.kr</li>
				</ul>
			</div>
		</div>
	</div>
</div>
 -->
 <div>
 <!-- 메인콘텐츠 02 -->
<div class="clearfix"></div>

<div class="copyright_info four">
<div class="container">
    
    <div class="two_third">
		<table style="width:100%;" class="foot1">
			<tbody><tr>
				<td rowspan="2"> <img src="/monitor/img/front/bot_logo.png"></td>
				<td style="margin-left: 24%;color: #000;margin-top: -8px;"><p><b>서울특별시 시민 소통담당관</b></p></td>
			</tr>
				
			<tr>
				<td style="margin-left: 24%;color: #000;margin-top: -8px;">
					<p>서울시 중구 세종대로110 &nbsp;&nbsp;&nbsp;<b>Tel </b> 2130-6441  &nbsp;&nbsp;&nbsp;<b>Fax </b> 2133-0787</p>
				</td>
			</tr>
		</tbody></table>
		<table style="width:100%;" class="foot2">
			<tbody><tr>
				<td rowspan="4" style="width:25%;"> <img src="/monitor/img/front/bot_logo.png"></td>
				<td style="margin-left: 24%;color: #000;margin-top: -8px;"><p><b>서울특별시 시민소통담당관</b></p></td>
			</tr>
				
			<tr>
				<td style="text-align:left;color: #000;margin-top: -8px;">
					<p>서울시 중구 세종대로110  &nbsp;&nbsp;&nbsp;</p>
				</td>
			</tr>
			<tr>
				<td style="text-align:left;color: #000;margin-top: -8px;">
					<b>Tel </b> 2130-6441 
				</td>
			</tr>
			<tr>
				<td style="text-align:left;color: #000;margin-top: -8px;">
					<b>Fax </b> 2133-0787
				</td>
			</tr>
		</tbody></table>


        
    </div>
    
    <div class="one_third last">
        
        <ul class="three" style="color:#fff;">
            <li><a href="http://www.seoul.go.kr/v2007/help/privacy.html?Sid=601_01" target="blank">서울시 개인정보 처리방침</a> | <a href="http://www.seoul.go.kr/v2007/help/email.html" target="blank">이메일무단수집거부</a> </li>            
        </ul>
            
    </div>
    
</div>
</div><!-- end copyright info -->
</div>
	
	

	<script src="/monitor/css/front/js/custom-1.js"></script>
	<script src="/monitor/css/front/js/custom.js"></script>
	<script src="/monitor/css/front/js/waltzerjs.js"></script>
	<script src="/monitor/css/front/js/jquery.flexslider.js"></script>
	<script src="/monitor/css/front/js/responsive-tabs.min.js"></script>
	<script src="/monitor/css/front/js/totop.js"></script>
	<script src="/monitor/css/front/js/jquery.jcarousel.min.js"></script>
	<script type="text/javascript">

		$(document).ready(function() {
	
			$('#carouseltest').waltzer({scroll:1});
	
		});
	
	</script>
	
	<script src="/monitor/css/front/js/jcarousel.responsive.js"></script>
	<script src="/monitor/css/front/js/animations.min.js"></script>
	
	
	
	
	<script src="/monitor/js/bootstrap.min.js"></script>

</div></body></html>