<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>	
	.s_q{font-weight:bold !important;}
	.sub_q{color:#acacac; font-size:8px;}
	.horizontal{margin:5px 0; border:1px solid #ccc;}
	</style>
	<script src="../js/jquery.js"></script>
	<script>
		function fchk(){
			var chk_obj = document.getElementsByName("no[]");
			var chk_leng = chk_obj.length;
			var checked=0;
			for(i=0;i<chk_leng;i++){
				if(chk_obj[i].checked==true){
					checked +=1;
					alert(chk_obj[i].value);
				}
			}
			if(checked == 0){
				alert("선택된 정보가 없습니다.");
				return;
			}else{
				alert(checked+"개 선택");
				return;
			}
		}
	
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
				<form name="TEST" method="POST" action="" onsubmit="return fchk();">
					<div class="col-sm-12"><input type="checkbox" id="chk_chg" name="no[]" value="1">시청<label class="number"></label></div>
					<div class="col-sm-12"><input type="checkbox" id="chk_chg" name="no[]" value="2">인사동<label class="number"></label></div>
					<div class="col-sm-12"><input type="checkbox" id="chk_chg" name="no[]" value="3">남산<label class="number"></label></div>
					<div class="col-sm-12"><input type="checkbox" id="chk_chg" name="no[]" value="4">청계천<label class="number"></label></div>
					<div class="col-sm-12"><input type="checkbox" id="chk_chg" name="no[]" value="5">광화문<label class="number"></label></div>
					<div class="col-sm-12"><input type="checkbox" id="chk_chg" name="no[]" value="6">창덕궁<label class="number"></label></div>				
					<button onclick="javascript:go();">전송</button>
				</form>
			</div>
			
			<hr class="horizontal"/>
		</div>
		
		
		
	</div>
	</section>
	


<jsp:include page="/base_design/inc/footer.jsp"></jsp:include>




