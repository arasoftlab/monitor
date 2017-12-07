<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<style>
.col-sm-10{
	border: 1px solid #ddd;
    padding: 0;
}

</style>
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

	<section id="content" >
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h4>공지사항</h4>
			
				<table class="table table-bordered table-margin">
					<tbody>
						<tr>
							<td class="td1">*공지제목</td>
							<td colspan=3 class="left">
								<input type="text" value="제 11차 현장 과제(서울대공원 동물서식지 문화축제)" style="width:100%;">
							</td>
						</tr>
						<tr>
							<td class="td1">*공지종류</td>
							<td colspan=3 class="left">
								<label class="col-sm-4"><input type="radio" value="filed" name="filed" checked >&nbsp;현장과제(참여모집 공고)</label>
								<label class="col-sm-4"><input type="radio" value="survey" name="survey"  >&nbsp;설문과제(지정과제)</label>
								<label class="col-sm-4"><input type="radio" value="simple" name="simple"  >&nbsp;단순, 일반공지</label>
							</td>
						</tr>
						<tr>
							<td class="td1">*연결과제</td>
							<td colspan=3 class="left">
								<span>2016 제 1차 현장과제 모니터링</span>
								<div class="pull-right">
									<button class="btn" type="submit"><i class="fa fa-2x fa-pencil"></i></button>
									<button class="btn" type="submit"><i class="fa fa-2x fa-times"></i></button>
								</div>
							</td>
						</tr>
						<tr>
							<td class="td1">모니터 신청기간</td>
							<td class="left">2016/08/12 ~ 2016/08/15</td>
							<td class="td1">과제제출 기간</td>
							<td class="left">2016/08/17 ~ 2016/08/31</td>
						</tr>
						<tr>
							<td class="td1">*홈 공개 여부</td>
							<td colspan=3 class="left">
								<label class="col-sm-4"><input type="radio" value="open" name="open" checked >&nbsp;홈 공개</label>
								<label class="col-sm-4"><input type="radio" value="close" name="close"  >&nbsp;홈 비공개</label>
							</td>
						</tr>
						<tr>
							<td class="td1">*공지내용</td>
							<td colspan=3 class="left">
								<textarea rows="20" cols="145" id="contents" name="contents" htmlEscape="false" style="width: 100%; height: 150px;"></textarea>
							</td>
						</tr>
						<tr>
							<td class="td1">신청방법</td>
							<td colspan=3 class="left">
								<textarea rows="20" cols="145" id="contents" name="contents" htmlEscape="false" style="width: 100%; height: 150px;"></textarea>
							</td>
						</tr>
						<tr>
							<td class="td1">첨부파일</td>
							<td colspan=3 class="left">
								<%-- <jsp:include page="/base_design/inc/fileUpload.jsp"> --%>
							</td>
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


