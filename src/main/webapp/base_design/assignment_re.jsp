<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<meta charset="utf-8" />
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


<link href="css/datepicker.css" rel="stylesheet" />
<link href="css/datepicker3.css" rel="stylesheet" />
<link href="css/daterangepicker-bs3.css" rel="stylesheet" />

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
.form-control {
    border: 1px solid #ccd0d4;
    -webkit-box-shadow: none;
    box-shadow: none;
    font-size: 12px;
    border-radius: 3px;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
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
							<td class="td1">*과제제목</td>
							<td colspan=3 class="left">
								<input type="text" value="제 11차 현장 과제(서울대공원 동물서식지 문화축제)" style="width:100%;">
							</td>
						</tr>
						<tr>
							<td class="td1">의뢰부서</td>
							<td colspan=3 class="left">
								<input type="text" value="의뢰부서" style="width:100%;">
							</td>
						</tr>
						<tr>
							<td class="td1">*과제종류</td>
							<td colspan=3 class="left">
								<label class="col-sm-4"><input type="radio" value="open" name="open" checked >&nbsp;현장과제(참여모집 공고)</label>
								<label class="col-sm-4"><input type="radio" value="close" name="close"  >&nbsp;설문과제(지정과제)</label>
								<label style="font-weight:normal">&nbsp;&nbsp; * 참여자 모집 없이 아무나 참여할 수 있는 과제일 경우, 설문과제(지정과제) 선택</label>
							</td>
						</tr>
						<tr>
							<td class="td1">모니터 신청기간</td>
							<td colspan=3 class="left">
								<div class="col-sm-12" style="padding:0;">
									<label class="col-sm-3"><input type="text" class="form-control" id="monitorDate1" value="2016-08-18"/></label>
									<label class="col-sm-1">&nbsp;&nbsp;&nbsp;~</label>
									<label class="col-sm-3"><input type="text" class="form-control" id="monitorDate2" value="2016-08-18"/></label>
								</div> 
							</td>
						</tr>
						<tr>
							<td class="td1">*과제 제출기간</td>
							<td colspan=3 class="left">
								<div class="col-sm-12" style="padding:0;">
									<label class="col-sm-3"><input type="text" class="form-control" id="asmDate1" value="2016-08-18"/></label>
									<label class="col-sm-1">&nbsp;&nbsp;&nbsp;~</label>
									<label class="col-sm-3"><input type="text" class="form-control" id="asmDate2" value="2016-08-18"/></label>
								</div> 
							</td>
						</tr>
						
						<tr>
							<td class="td1">모니터링 조건</td>
							<td colspan=3 class="left">
								<label>과제 수행 수<input type="text" value="2" style="width:10%;">개</label>
								<label>
									<input type="text" value="10" style="width:10%;">조 &nbsp;X&nbsp;
								 	각 조<input type="text" value="20" style="width:10%;">명
								 	 &nbsp;=&nbsp;<input type="text" value="200" style="width:10%;">명
								 </label>
							</td>
						</tr>
						<tr>
							<td class="td1">*활동비지급</td>
							<td colspan=3 class="left">
								<label class="col-sm-4"><input type="radio" value="none" name="none" checked >&nbsp;없음</label>
								<label class="col-sm-4">
									<input type="radio" value="have" name="have"  >&nbsp;있음
									<input type="text" value="3000" style="width:25%;">원
								</label>
							</td>
						</tr>
						<tr>
							<td class="td1">활동비 입금 신청일</td>
							<td colspan=3 class="left">
								<label class="col-sm-3"><input type="text" class="form-control" id="moneyDate" value="2016-08-18"/></label>
								<label>&nbsp;&nbsp; * 과제기간 종료 후 재무과나 주무과에 입금 신청한 날을 선택</label>
							</td>
						</tr>
						
						
						
						<tr>
							<td class="td1">*조사 설명</td>
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

<script src="js/bootstrap-datepicker.js"></script>
<script src="js/bootstrap-datepicker.kr.js"></script>
<script src="js/moment.js"></script>
<script src="js/daterangepicker.js"></script>
<script type="text/javascript">
   	$("#monitorDate1").datepicker({
		language: 'kr',
		format:'yyyy-mm-dd',
		todayHighlight: true
	}).on('changeDate', function(e) {
	       return get_url_and_refresh_link();
	});
	$('#monitorDate1').datepicker('setDate', 'today');
 </script>
 <script type="text/javascript">
 
	$("#monitorDate2").datepicker({
		language: 'kr',
		format:'yyyy-mm-dd',
		todayHighlight: true
	}).on('changeDate', function(e) {
	       return get_url_and_refresh_link();
	});
	$('#monitorDate2').datepicker('setDate', 'today');
</script>	
<script type="text/javascript">
	$("#asmDate1").datepicker({
		language: 'kr',
		format:'yyyy-mm-dd',
		todayHighlight: true
	}).on('changeDate', function(e) {
	       return get_url_and_refresh_link();
	});
	$('#asmDate1').datepicker('setDate', 'today');
</script>	
<script type="text/javascript">
	$("#asmDate2").datepicker({
		language: 'kr',
		format:'yyyy-mm-dd',
		todayHighlight: true
	}).on('changeDate', function(e) {
	       return get_url_and_refresh_link();
	});
	$('#asmDate2').datepicker('setDate', 'today');
</script>
<script type="text/javascript">		
	$("#moneyDate").datepicker({
		language: 'kr',
		format:'yyyy-mm-dd',
		todayHighlight: true
	}).on('changeDate', function(e) {
	       return get_url_and_refresh_link();
	});
	$('#moneyDate').datepicker('setDate', 'today');
 </script>
</body>
</html>


