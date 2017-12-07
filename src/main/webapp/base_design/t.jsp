<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>	
	.s_q{font-weight:bold !important;}
	.sub_q{color:#acacac; font-size:8px;}
	.horizontal{margin:5px 0; border:1px solid #ccc;}
	</style>
	<script>
	
	</script>
<jsp:include page="/base_design/inc/header.jsp"></jsp:include>
	<section id="content">
	<div class="container">
		<div id="simple_T">
			<div class="col-lg-12">
				<label class="s_q">이번 과제를 수행하면서 좋았던 점과 함께 사진을(첨부)해서 전송해 주십시오.</label>
			</div>
			
			<hr class="horizontal"/>
			<div class="col-lg-12">
				<label>좋았던 점</label>
				<div class="col-sm-12"><input type="text" style="width:100%;"/></div>
			</div>
			<table style="width:100%;">
				<colgroup>
					<col width="50%;">
					<col width="50%;" >
				</colgroup>
				<tr>
					<td>
						<input type="file" style="width:100%;filter:alpha(opacity:0); opacity:0; " accept="image/*"/>
						<label style="margin-top: -20px;">앨범에서 가져오기</label>
					</td>
					<td>
						<input type="file" style="width:100%;filter:alpha(opacity:0); opacity:0;" accept="image/*" capture="camera"/>
						<label style="margin-top: -20px;">사진찍어서 가져오기</label>
					</td>
				</tr>
			</table>
			
			<hr class="horizontal"/>
		</div>
		
	</div>
	</section>
	


<jsp:include page="/base_design/inc/footer.jsp"></jsp:include>