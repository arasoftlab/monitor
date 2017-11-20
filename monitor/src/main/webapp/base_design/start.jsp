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
		<div class="col-lg-12">
			<label class="s_q">이번 서울시청 모니터 앱 현장과제에 참여하실 수 있으십니까?</label>
			<label class="sub_q">*응답분기형 중 응답자 선택 등에 사용됨</label>
		</div>
		
		<hr class="horizontal"/>
		<div class="col-lg-12">
			<input type="radio" value="Y"> 있다 -> 조사계속
		</div>
		<div class="col-lg-12">
			<input type="radio" value="N" data-toggle="modal" data-target=".bs-example-modal-sm"> 없다 -> 중단메세지 확인
		</div>	
			
		<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		    <div class="modal-content" style="text-align:center;top:250px;border-radius:0;background:slategrey">
				<div class="col-lg-12"><label class="s_q" style="color:#fff">서울시청 모니터</label></div>
				<div class="col-lg-12"><label style="color:#fff">다음 조사에는 꼭 참여해 주세요~!</label></div>
				<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
		    </div>
		  </div>
		</div>
		
		
		<hr class="horizontal"/>
	</div>
	</section>
	


<jsp:include page="/base_design/inc/footer.jsp"></jsp:include>