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

	<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h4>공지사항</h4>
				
				<div id="search-box1" class="col-lg-8" style="padding:0;">
					<form id="search-form1" class="pull-left;">
						<select name="searchCategory">
							<option value="">전체</option>
							<option value="simple">단순공지</option>
							<option value="field">현장과제</option>
							<option value="survey" >설문과제</option>
						</select>
						<select name="searchCategory2">
							<option value="">선택</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
						<input type="text" id="search-text1" name="searchText">
						<input type="button" id="search-button1" value="검색" onclick="fnSearch();">
					</form>
					
				</div>
				<div class="col-lg-4" style="padding:0;">
					<button class="btn btn-theme  pull-right" type="submit">공지등록</button>
				</div>
				
				<table class="table table-bordered table-striped table2">
					<!-- <colgroup>
						<col width="%;">
						<col width="*;" >
						<col width="14%;">
						<col width="14%;">
					</colgroup> -->
					<thead>
						<tr>
							<th>No.</th>
							<th>제목</th>
							<th>공지종류</th>
							<th>등록일</th>
							<th>홈 공개</th>
							<th>신청자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>참여자 모집공고</td>
							<td>과제연동</td>
							<td>2016/08/01</td>
							<td>N</td>
							<td>보기</td>
							<td>100</td>
						</tr>
						<tr>
							<td>2</td>
							<td>참여자 모집공고</td>
							<td>과제연동</td>
							<td>2016/08/01</td>
							<td>N</td>
							<td>보기</td>
							<td>100</td>
						</tr>
						<tr>
							<td>3</td>
							<td>참여자 모집공고</td>
							<td>과제연동</td>
							<td>2016/08/01</td>
							<td>N</td>
							<td>보기</td>
							<td>100</td>
						</tr>
						<tr>
							<td>4</td>
							<td>참여자 모집공고</td>
							<td>과제연동</td>
							<td>2016/08/01</td>
							<td>N</td>
							<td>보기</td>
							<td>100</td>
						</tr>
						<tr>
							<td>5</td>
							<td>참여자 모집공고</td>
							<td>과제연동</td>
							<td>2016/08/01</td>
							<td>N</td>
							<td>보기</td>
							<td>100</td>
						</tr>
						<tr>
							<td>6</td>
							<td>참여자 모집공고</td>
							<td>과제연동</td>
							<td>2016/08/01</td>
							<td>N</td>
							<td>보기</td>
							<td>100</td>
						</tr>
						<tr>
							<td>7</td>
							<td>참여자 모집공고</td>
							<td>과제연동</td>
							<td>2016/08/01</td>
							<td>N</td>
							<td>보기</td>
							<td>100</td>
						</tr>
						<tr>
							<td>8</td>
							<td>참여자 모집공고</td>
							<td>과제연동</td>
							<td>2016/08/01</td>
							<td>N</td>
							<td>보기</td>
							<td>100</td>
						</tr>
						<tr>
							<td>9</td>
							<td>대학생, 주부, 어르신 등 특성 별 모니터 참여안내</td>
							<td>단순공지</td>
							<td>2016/08/01</td>
							<td>N</td>
							<td>보기</td>
							<td>100</td>
						</tr>
						<tr>
							<td>10</td>
							<td>제 100차 서울시청 모니터 참가 공지</td>
							<td>과제연동</td>
							<td>2016/08/01</td>
							<td>Y</td>
							<td></td>
							<td>543</td>
						</tr>
					</tbody>
				</table>
				<div id="pagination" class="center">
					<span class="all">Page 1 of 3</span>
					<span class="current">1</span>
					<a href="#" class="inactive">2</a>
					<a href="#" class="inactive">3</a>
				</div>
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


