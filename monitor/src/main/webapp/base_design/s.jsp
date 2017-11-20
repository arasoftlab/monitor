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
		<div id="simple_S">
			<div class="col-lg-12">
				<label class="s_q">현재 귀하께서 현장과제를 수행중인 장소는 어디입니까?</label>
				<label class="sub_q">*단일응답형 2열 표현</label>
			</div>
			
			<hr class="horizontal"/>
			<div class="col-lg-12">
				<div class="col-sm-6" style="width:50%;float:left;">
					<input type="radio"/>시청
				</div>
				<div class="col-sm-6" style="width:50%;float:left;">
					<input type="radio"/>시청
				</div>
			</div>
			<div class="col-lg-12">
				<div class="col-sm-6" style="width:50%;float:left;">
					<input type="radio"/>시청
				</div>
				<div class="col-sm-6" style="width:50%;float:left;">
					<input type="radio"/>시청
				</div>
				<div class="col-lg-12">
					<input type="text" class="quest_form"/>
				</div>
			</div>
			
			<hr class="horizontal"/>
		</div>
		
		<div id="simple_imgS">
			<div class="col-lg-12">
				<label class="s_q">회원님께서는 "시민과 함께 만드는 서울시 온라인 뉴스" '톡톡'을 알고 게십니까?</label>
				<label class="sub_q">*이미지(1장)에 대한 조사</label>
			</div>
			<hr class="horizontal"/>
			<div class="col-lg-12">
				<div class="col-sm-12">
					<input type="radio" value="Y"/>있다
				</div>
				<div class="col-sm-12">
					<input type="radio" value="N"/>없다
				</div>
			</div>
			<div class="col-lg-12" style="text-align:center;">
				<img src="http://localhost:8080/seoul/base_design/inc/img/seoul.png"/>
			</div>
			<hr class="horizontal"/>
		
		</div>
		
		
		<div id="simple_imgDS">
			<div class="col-lg-12">
				<label class="s_q">서울시에는 다양한 모니터 제도가 있습니다. 다음 모니터를 알고 계십니까?</label>
				<label class="sub_q">*이미지에 대한 조사</label>
			</div>
			<hr class="horizontal"/>
			<div class="col-lg-12">
				<div class="col-sm-12">
					<input type="radio" value="Y"/>있다
				</div>
				<div class="col-sm-12">
					<input type="radio" value="N"/>없다
				</div>
			</div>
			<div class="col-lg-12" style="text-align:center;">
				<!-- Slider -->
		        <div id="main-slider" class="flexslider">
		            <ul class="slides">
		              <li>
		                <img src="http://localhost:8080/seoul/base_design/inc/img/seoul.png"/>
		              </li>
		              <li>
		                <img src="http://localhost:8080/seoul/base_design/inc/img/seoul.png"/>
		              </li>
		              <li>
		                <img src="http://localhost:8080/seoul/base_design/inc/img/seoul.png"/>
		              </li>
		            </ul>
		        </div>
				<!-- end slider -->
			</div>
			<hr class="horizontal"/>
		
		</div>
		
		<div id="simple_imgD">
			<div class="col-lg-12">
				<label class="s_q">서울시에는 다양한 모니터 제도가 있습니다. 회원님께서 다음 모니터 중 가장 참여해 보고 싶은 모니터단을 선택해 주십시오.</label>
				<label class="sub_q">* 다수 이미지를 항목으로 제시 후 선택조사</label>
			</div>
			<hr class="horizontal"/>
			<div class="col-lg-12">
				<div class="col-sm-12">
					<input type="radio" value="s"/>시청모니터
					<div class="col-lg-12" style="text-align:center;">
						<img src="http://localhost:8080/seoul/base_design/inc/img/seoul.png"/>
					</div>
				</div>
				<div class="col-sm-12">
					<input type="radio" value="m"/>물가모니터
					<div class="col-lg-12" style="text-align:center;">
						<img src="http://localhost:8080/seoul/base_design/inc/img/seoul.png"/>
					</div>
				</div>
			</div>
			
			<hr class="horizontal"/>
		
		</div>
		
		<div id="simple_imgV">
			<div class="col-lg-12">
				<label class="s_q">회원님께서는 다음의 서울시 홍보 동영상을 보신 경험이 있으십니까?</label>
				<label class="sub_q">*(옵션) 미디어->동영상데이터 선택</label>
			</div>
			<hr class="horizontal"/>
			<div class="col-lg-12">
				<div class="col-sm-12">
					<input type="radio" value="Y"/>있다
				</div>
				<div class="col-sm-12">
					<input type="radio" value="N"/>없다
				</div>
			</div>
			<div class="col-lg-12" style="text-align:center;">
				<input type="file" accept="video/*"/>
			</div>
			<hr class="horizontal"/>
		
		</div>
		
		
	</div>
	</section>
	


<jsp:include page="/base_design/inc/footer.jsp"></jsp:include>