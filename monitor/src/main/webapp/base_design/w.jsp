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
		<div id="simple_SW">
			<div class="col-lg-12">
				<label class="s_q">이번 과제를 수행하면서 좋았던 점과 부족했던 점을 자유롭게 기술해 주세요.</label>
				<label class="sub_q">*2개의 의견기술</label><br/>
				<label class="sub_q">*앞라벨이 있을 경우 표현</label>
			</div>
			
			<hr class="horizontal"/>
			<div class="col-lg-12">
				<label>좋았던 점</label>
				<div class="col-sm-12"><input type="text" style="width:100%;"/></div>
				<label>싫었던 점</label>
				<div class="col-sm-12"><input type="text" style="width:100%;"/></div>
			</div>
			
			<hr class="horizontal"/>
		</div>
		<div id="simple_MW">
			<div class="col-lg-12">
				<label class="s_q">이번 과제를 수행하면서 좋았던 점을 자유롭게 기술해 주세요.</label>
				<label class="sub_q">*앞,뒷 라벨이 생략된 경우 표현</label>
			</div>
			
			<hr class="horizontal"/>
				<div class="col-sm-12"><input type="text" style="width:100%;"/></div>
			<hr class="horizontal"/>
		</div>
		<div id="simple_W">
			<div class="col-lg-12">
				<label class="s_q">서술형 응답의 여러가지 응답 유형입니다. 빈칸에 알맞게 입력해 주세요</label>
			</div>
			
			<hr class="horizontal"/>
			<div class="col-lg-12">
				<table style="width:100%;">
					<colgroup>
						<col width="80%;">
						<col width="20%;" >
					</colgroup>
					<tr>
						<td colspan="2" style="text-align:left;"><label>성명</label></td>
					</tr>
					<tr>
						<td><input type="text" style="width:100%;"/></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:left;"><label>거래은행</label></td>
					</tr>
					<tr>
						<td><input type="text" style="width:100%;"/></td>
						<td><label>(은행)</label></td>
					</tr>
					<tr>
						<td><input type="text" style="width:100%;"/></td>
						<td><label>(지점)</label></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:left;"><label>숫자형 자판 노출</label></td>
					</tr>
					<tr>
						<td><input type="number" style="width:100%;" pattern="[0-9]*"/></td>
						<td><label>점</label></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:left;"><label>숫자형 자판 노출</label></td>
					</tr>
					<tr>
						<td><input type="number" style="width:100%;" pattern="[0-9]*"/></td>
						<td><label>%</label></td>
					</tr>
				</table>
			</div>
			<hr class="horizontal"/>
		</div>
		<div id="simple_DW">
			<div class="col-lg-12">
				<label class="s_q">다음 요인의 중요도에 따라 합계까 100%가 되도록 입력해 주세요.</label>
				<label class="sub_q">*서술형 응답형(정합서술형)</label>
				<label class="sub_q">*(옵션) 입력합 100지정</label>
			</div>
			
			<hr class="horizontal"/>
				<table style="width:100%;">
					<colgroup>
						<col width="80%;">
						<col width="20%;" >
					</colgroup>
					<tr>
						<td colspan="2" style="text-align:left;"><label>첫인사</label></td>
					</tr>
					<tr>
						<td><input type="number" style="width:100%;"pattern="[0-9]*"/></td>
						<td>(%)</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:left;"><label>업무처리</label></td>
					</tr>
					<tr>
						<td><input type="number" style="width:100%;"pattern="[0-9]*"></td>
						<td><label>(%)</label></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:left;"><label>친절성</label></td>
					</tr>
					<tr>
						<td><input type="number" style="width:100%;"pattern="[0-9]*"/></td>
						<td><label>(%)</label></td>
					</tr>
				</table>
			<hr class="horizontal"/>
		</div>
	</div>
	</section>
	


<jsp:include page="/base_design/inc/footer.jsp"></jsp:include>