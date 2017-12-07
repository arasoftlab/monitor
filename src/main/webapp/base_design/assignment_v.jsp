<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="http://bootstraptaste.com" />
<!-- css -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="css/jcarousel.css" rel="stylesheet" />
<link href="css/flexslider.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />

<!-- Theme skin -->
<link href="skins/default.css" rel="stylesheet" />

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>
<body>
	<div id="wrapper">
	<!-- start header -->
	<header>
        <div class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand"><span>S</span>eoul</a>
                </div>
                <div class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.html">공지사항</a></li>
                        <li><a href="portfolio.html">과제</a></li>
                        <li><a href="blog.html">모니터관리</a></li>
                    </ul>
                </div>
            </div>
        </div>
	</header>
	<!-- end header -->
	
	<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<button class="btn btn-theme btn_top" type="submit">기본정보</button>
				<button class="btn btn-theme btn_top" type="submit">신청자</button>
				<button class="btn btn-theme btn_top" type="submit">과제관리</button>
				<button class="btn btn-theme btn_top" type="submit">응답목록</button>
				<button class="btn btn-theme btn_top" type="submit">통계</button>
				<button class="btn btn-theme btn_top" type="submit">활동비관리</button>
			</div>
		</div>
	</div>
	</section>

	<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
			
				<table class="table table-bordered table-margin">
					<tbody>
						<tr>
							<td class="td1">과제제목</td>
							<td colspan=3 class="left"> &nbsp;2016 제 1차 현장과제 묀터링</td>
						</tr>
						<tr>
							<td class="td1">의뢰부서</td>
							<td colspan=3 class="left"> &nbsp;</td>
						</tr>
						<tr>
							<td class="td1">과제종류</td>
							<td colspan=3 class="left">
								<label class="col-sm-4"><input type="radio" value="open" name="open" checked disabled>&nbsp;현장과제(참여모집 공고)</label>
								<label class="col-sm-4"><input type="radio" value="close" name="close"  disabled>&nbsp;설문과제(지정과제)</label>
							</td>
						</tr>
						<tr>
							<td class="td1">모니터 신청기간</td>
							<td colspan=3 class="left"><label> 2016/08/05 ~ 2016/08/11</label></td>
						</tr>
						<tr>
							<td class="td1">보고서 제출기간</td>
							<td colspan=3 class="left"><label> 2016/08/12 ~ 2016/08/15</label></td>
						</tr>
						<tr>
							<td class="td1">모니터링 조건</td>
							<td colspan=3 class="left"> &nbsp; 과제 수행 수 2개 &nbsp;&nbsp;&nbsp;&nbsp;10조 X 각 조 20명 = 200명</td>
						</tr>
						<tr>
							<td class="td1">활동비 지급</td>
							<td colspan=3 class="left">
								<label class="col-sm-4"><input type="radio" value="none" name="none" checked disabled>&nbsp;없음</label>
								<label class="col-sm-4"><input type="radio" value="have" name="have"  disabled>&nbsp;있음 (3000 원)</label>
							</td>
						</tr>
					
						
						<tr>
							<td class="td1">활동비 입금일</td>
							<td colspan=3 class="left">
								<div class="col-sm-12" style="padding:0;">
									<label class="col-sm-2" style="padding-left:0;">2016/08/20</label>
									<label>*과제기간 종료 후 재무과나 주무과에 입금 신청한 날은 선택</label>
								</div>
							</td>
						</tr>
						<tr>
							<td class="td1">조사 설명</td>
							<td colspan=3 class="left">(내용)</td>
						</tr>
						<tr>
							<td class="td1">이미지 첨부</td>
							<td colspan=3 class="left">(파일)</td>
						</tr>
					</tbody>
				</table>
				
			</div>
			<div class="col-lg-2 pull-right">
				<button class="btn btn-warning " type="submit">삭제</button>
				<button class="btn btn-theme " type="submit">수정</button>
				<button class="btn btn-info " type="submit">목록</button>
			</div>
		</div>
	</div>
	</section>
	
</div>
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
<!-- javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.fancybox.pack.js"></script>
<script src="js/jquery.fancybox-media.js"></script>
<script src="js/google-code-prettify/prettify.js"></script>
<script src="js/portfolio/jquery.quicksand.js"></script>
<script src="js/portfolio/setting.js"></script>
<script src="js/jquery.flexslider.js"></script>
<script src="js/animate.js"></script>
<script src="js/custom.js"></script>
<script src="js/validate.js"></script>
</body>
</html>


