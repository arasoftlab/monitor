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
<link href="../css/bootstrap.min.css" rel="stylesheet" />
<link href="../css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="../css/flexslider.css" rel="stylesheet" />
<link href="../css/style.css" rel="stylesheet" />
<!-- Theme skin -->
<link href="../skins/default.css" rel="stylesheet" />

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    
    
    
<script type="text/javascript">

function popupS(){
	var popUrl = "s.jsp";	//팝업창에 출력될 페이지 URL
	var popOption = "width=360, height=630, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
function popupC(){
	var popUrl = "c.jsp";	//팝업창에 출력될 페이지 URL
	var popOption = "width=360, height=630, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
function popupM(){
	var popUrl = "m.jsp";	//팝업창에 출력될 페이지 URL
	var popOption = "width=360, height=630, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
function popupO(){
	var popUrl = "o.jsp";	//팝업창에 출력될 페이지 URL
	var popOption = "width=360, height=630, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
function popupR(){
	var popUrl = "r.jsp";	//팝업창에 출력될 페이지 URL
	var popOption = "width=360, height=630, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
function popupW(){
	var popUrl = "w.jsp";	//팝업창에 출력될 페이지 URL
	var popOption = "width=360, height=630, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
function popupB(){
	var popUrl = "b.jsp";	//팝업창에 출력될 페이지 URL
	var popOption = "width=360, height=630, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
function popupT(){
	var popUrl = "t.jsp";	//팝업창에 출력될 페이지 URL
	var popOption = "width=360, height=630, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
function popupStart(){
	var popUrl = "start.jsp";	//팝업창에 출력될 페이지 URL
	var popOption = "width=360, height=630, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
function popupEnd(){
	var popUrl = "end.jsp";	//팝업창에 출력될 페이지 URL
	var popOption = "width=360, height=630, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
</script>

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
                        <li><a href="index.html">공지사항</a></li>
                        <li class="active"><a href="portfolio.html">과제</a></li>
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
							<th>과제유형</th>
							<th>type</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>0</td>
							<td><a href="javascript:popupStart();" >start</a></td>
							<td>start</td>
						</tr>
						<tr>
							<td>1</td>
							<td><a href="javascript:popupS();" >단일응답형</a></td>
							<td>S</td>
						</tr>
						<tr>
							<td>2</td>
							<td><a href="javascript:popupC();" >분기응답형</a></td>
							<td>C</td>
						</tr>
						<tr>
							<td>3</td>
							<td><a href="javascript:popupM();" >중복(복수)응답형</a></td>
							<td>M</td>
						</tr>
						<tr>
							<td>4</td>
							<td><a href="javascript:popupO();" >서열(순서)응답형</a></td>
							<td>O</td>
						</tr>
						<tr>
							<td>5</td>
							<td><a href="javascript:popupR();" >척도응답형</a></td>
							<td>R</td>
						</tr>
						<tr>
							<td>6</td>
							<td><a href="javascript:popupW();" >서술응답형</a></td>
							<td>W</td>
						</tr>
						<tr>
							<td>7</td>
							<td><a href="javascript:popupB();" >게시판(정보제공)형</a></td>
							<td>B</td>
						</tr>
						<tr>
							<td>8</td>
							<td><a href="javascript:popupT();" >파일응답형</a></td>
							<td>T</td>
						</tr>
						<tr>
							<td>9</td>
							<td><a href="javascript:popupEnd();" >END</a></td>
							<td>END</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</section>
	
</div>
<!-- javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="../js/jquery.js"></script>
<script src="../js/jquery.easing.1.3.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.fancybox.pack.js"></script>
<script src="../js/jquery.fancybox-media.js"></script>
<script src="../js/google-code-prettify/prettify.js"></script>
<script src="../js/animate.js"></script>
<script src="../js/custom.js"></script>
<script src="../js/validate.js"></script>
</body>
</html>


