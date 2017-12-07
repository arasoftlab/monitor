<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>	
	.s_q{font-weight:bold !important;}
	.sub_q{color:#acacac; font-size:8px;}
	.horizontal{margin:5px 0; border:1px solid #ccc;}
	</style>
<jsp:include page="/base_design/inc/header.jsp"></jsp:include>
	<section id="content">
	<div class="container">
	
		<div id="simple_C">
			<div class="col-lg-12">
				<label class="s_q">오늘 받은 아리수 스토리텔링 강의에 만족하셨습니까?</label>
				<label class="sub_q">*분기응답형</label>
			</div>
			
			<hr class="horizontal"/>
			<div class="col-lg-12">
				<div class="col-sm-12">
					<input type="radio" value="Y"/>만족했다->문6으로
				</div>
				<div class="col-sm-12">
					<input type="radio" value="N"/>만족하지 못했다->문7로
				</div>
			</div>
			
			<hr class="horizontal"/>
		</div>
		
		
		
	</div>
	</section>
	


<jsp:include page="/base_design/inc/footer.jsp"></jsp:include>