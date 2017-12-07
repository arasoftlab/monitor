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
                        <li class="active"><a href="index.html">��������</a></li>
                        <li><a href="portfolio.html">����</a></li>
                        <li><a href="blog.html">����Ͱ���</a></li>
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
				<h4>��������</h4>
			
				<table class="table table-bordered table-margin">
					<tbody>
						<tr>
							<td class="td1">*��������</td>
							<td colspan=3 class="left">
								<input type="text" value="�� 11�� ���� ����(�������� ���������� ��ȭ����)" style="width:100%;">
							</td>
						</tr>
						<tr>
							<td class="td1">*��������</td>
							<td colspan=3 class="left">
								<label class="col-sm-4"><input type="radio" value="filed" name="filed" checked >&nbsp;�������(�������� ����)</label>
								<label class="col-sm-4"><input type="radio" value="survey" name="survey"  >&nbsp;��������(��������)</label>
								<label class="col-sm-4"><input type="radio" value="simple" name="simple"  >&nbsp;�ܼ�, �Ϲݰ���</label>
							</td>
						</tr>
						<tr>
							<td class="td1">*�������</td>
							<td colspan=3 class="left">
								<span>2016 �� 1�� ������� ����͸�</span>
								<div class="pull-right">
									<button class="btn" type="submit"><i class="fa fa-2x fa-pencil"></i></button>
									<button class="btn" type="submit"><i class="fa fa-2x fa-times"></i></button>
								</div>
							</td>
						</tr>
						<tr>
							<td class="td1">����� ��û�Ⱓ</td>
							<td class="left">2016/08/12 ~ 2016/08/15</td>
							<td class="td1">�������� �Ⱓ</td>
							<td class="left">2016/08/17 ~ 2016/08/31</td>
						</tr>
						<tr>
							<td class="td1">*Ȩ ���� ����</td>
							<td colspan=3 class="left">
								<label class="col-sm-4"><input type="radio" value="open" name="open" checked >&nbsp;Ȩ ����</label>
								<label class="col-sm-4"><input type="radio" value="close" name="close"  >&nbsp;Ȩ �����</label>
							</td>
						</tr>
						<tr>
							<td class="td1">*��������</td>
							<td colspan=3 class="left">
								<textarea rows="20" cols="145" id="contents" name="contents" htmlEscape="false" style="width: 100%; height: 150px;"></textarea>
							</td>
						</tr>
						<tr>
							<td class="td1">��û���</td>
							<td colspan=3 class="left">
								<textarea rows="20" cols="145" id="contents" name="contents" htmlEscape="false" style="width: 100%; height: 150px;"></textarea>
							</td>
						</tr>
						<tr>
							<td class="td1">÷������</td>
							<td colspan=3 class="left">
								<%-- <jsp:include page="/base_design/inc/fileUpload.jsp"> --%>
							</td>
						</tr>
					</tbody>
				</table>
				
			</div>
			<div class="col-lg-2 pull-right">
				<button class="btn btn-warning " type="submit">����</button>
				<button class="btn btn-theme " type="submit">����</button>
				<button class="btn btn-info " type="submit">���</button>
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


