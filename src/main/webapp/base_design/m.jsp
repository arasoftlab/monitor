<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>	
	.s_q{font-weight:bold !important;}
	.sub_q{color:#acacac; font-size:8px;}
	.horizontal{margin:5px 0; border:1px solid #ccc;}
	</style>
	<script>
		function go (){ 
			var arr_form = document.TEST; 
			var num = 0; 
	
			for(var i=0; i<arr_form.length; i++){ 
				if(arr_form[i].checked){ 
					num++; 
				} 
			} 
			if(num<3){ 
				alert('세개 이상 선택해주시기 바랍니다'); 
				return false; 
			} 
		} 
	</script>
<jsp:include page="/base_design/inc/header.jsp"></jsp:include>
	<section id="content">
	<div class="container">
	
		<div id="simple_C">
			<div class="col-lg-12">
				<label class="s_q">다음 중 현장과제는 3곳의 장소에서 수행하셔야 합니다. 과제 수행장소 3곳을 선택해 주세요</label>
				<label class="sub_q">*(옵션)필수 응답 3 지정</label>
			</div>
			
			<hr class="horizontal"/>
			<div class="col-lg-12">
				<form name="TEST" method="POST" action="" onsubmit="return chkchk(this);">
					<div class="col-sm-12"><input type="checkbox" id="chk_chg" name="no[]" value="1">시청</div>
					<div class="col-sm-12"><input type="checkbox" id="chk_chg" name="no[]" value="2">인사동</div>
					<div class="col-sm-12"><input type="checkbox" id="chk_chg" name="no[]" value="3">남산</div>
					<div class="col-sm-12"><input type="checkbox" id="chk_chg" name="no[]" value="4">청계천</div>
					<div class="col-sm-12"><input type="checkbox" id="chk_chg" name="no[]" value="5">광화문</div>
					<div class="col-sm-12"><input type="checkbox" id="chk_chg" name="no[]" value="6">창덕궁</div>				
					<button onclick="javascript:go();">전송</button>
				</form>
			</div>
			
			<hr class="horizontal"/>
		</div>
		
		
		
	</div>
	</section>
	


<jsp:include page="/base_design/inc/footer.jsp"></jsp:include>