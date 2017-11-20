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
				<label class="s_q">다음은 서울시청의 민원처리에 대한 각 부분별 만족도 측정입니다. 해당 분야의 만족정도를 입력해 주세요.</label>
				<label class="sub_q">*테이블형 척도</label>
			</div>
			
			<hr class="horizontal"/>
			<div class="col-lg-12">
				<table class="table_three" style="width:100%;">
					<tr>
						<td colspan="3" style="text-align:left;">시청 민원 만족도(3점)</td>
					</tr>
					<tr>
						<td><input type="radio" name="point" value="1"></td>
						<td><input type="radio" name="point" value="2"></td>
						<td><input type="radio" name="point" value="3"></td>
					</tr>
					<tr>
						<td>만족</td>
						<td>보통</td>
						<td>불만족</td>
					</tr>
				</table>
				<table class="table_five" style="width:100%;">
					<tr>
						<td colspan="5" style="text-align:left;">시청 청소 만족도(5점)</td>
					</tr>
					<tr>
						<td><input type="radio" name="point" value="1"></td>
						<td><input type="radio" name="point" value="2"></td>
						<td><input type="radio" name="point" value="3"></td>
						<td><input type="radio" name="point" value="4"></td>
						<td><input type="radio" name="point" value="5"></td>
					</tr>
					<tr>
						<td>매우만족</td>
						<td>대체로 만족</td>
						<td>보통</td>
						<td>대체로 불만</td>
						<td>매우불만</td>
					</tr>
				</table>
				<table class="table_seven" style="width:100%;">
					<tr>
						<td colspan="7" style="text-align:left;">동 주민센터 민원 만족도(7점)</td>
					</tr>
					<tr>
						<td><input type="radio" name="point" value="1"></td>
						<td><input type="radio" name="point" value="2"></td>
						<td><input type="radio" name="point" value="3"></td>
						<td><input type="radio" name="point" value="4"></td>
						<td><input type="radio" name="point" value="5"></td>
						<td><input type="radio" name="point" value="6"></td>
						<td><input type="radio" name="point" value="7"></td>
					</tr>
					<tr>
						<td colspan="7">
							<table style="width:100%;">
								<tr>
									<td style="width:33%;">만족</td>
									<td style="width:33%;">보통</td>
									<td style="width:33%;">불만족</td>
								</tr>
							</table>
						<!-- 
						<td>만족</td>
						<td colspan="2"></td>
						<td>보통</td>
						<td></td>
						<td colspan="2" style="text-align:right">불만족</td> -->
						</td>
					</tr>
				</table>
				<table class="table_nine" style="width:100%;">
					<tr>
						<td colspan="9" style="text-align:left;">도서관 이용 만족도(9점)</td>
					</tr>
					<tr>
						<td><input type="radio" name="point" value="1"></td>
						<td><input type="radio" name="point" value="2"></td>
						<td><input type="radio" name="point" value="3"></td>
						<td><input type="radio" name="point" value="4"></td>
						<td><input type="radio" name="point" value="5"></td>
						<td><input type="radio" name="point" value="6"></td>
						<td><input type="radio" name="point" value="7"></td>
						<td><input type="radio" name="point" value="8"></td>
						<td><input type="radio" name="point" value="9"></td>
					</tr>
					<tr>
						<td>만족</td>
						<td colspan="3"></td>
						<td>보통</td>
						<td colspan="2"></td>
						<td colspan="2" style="text-align:right">불만족</td>
					</tr>
				</table>
				<table class="table_ten" style="width:100%;">
					<tr>
						<td colspan="10" style="text-align:left;">보건소 이용 만족도(10점)</td>
					</tr>
					<tr>
						<td><input type="radio" name="point" value="1"></td>
						<td><input type="radio" name="point" value="2"></td>
						<td><input type="radio" name="point" value="3"></td>
						<td><input type="radio" name="point" value="4"></td>
						<td><input type="radio" name="point" value="5"></td>
						<td><input type="radio" name="point" value="6"></td>
						<td><input type="radio" name="point" value="7"></td>
						<td><input type="radio" name="point" value="8"></td>
						<td><input type="radio" name="point" value="9"></td>
						<td><input type="radio" name="point" value="10"></td>
					</tr>
					<tr>
						<td>1점</td>
						<td colspan="3"></td>
						<td>5점</td>
						<td colspan="2"></td>
						<td colspan="3" style="text-align:right">10점</td>
					</tr>
				</table>
				<table class="table_eleven" style="width:100%;">
					<tr>
						<td colspan="11" style="text-align:left;">도서관 이용 만족도(11점)</td>
					</tr>
					<tr>
						<td><input type="radio" name="point" value="1"></td>
						<td><input type="radio" name="point" value="2"></td>
						<td><input type="radio" name="point" value="3"></td>
						<td><input type="radio" name="point" value="4"></td>
						<td><input type="radio" name="point" value="5"></td>
						<td><input type="radio" name="point" value="6"></td>
						<td><input type="radio" name="point" value="7"></td>
						<td><input type="radio" name="point" value="8"></td>
						<td><input type="radio" name="point" value="9"></td>
						<td><input type="radio" name="point" value="10"></td>
						<td><input type="radio" name="point" value="11"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:left">만족</td>
						<td colspan="2"></td>
						<td colspan="2">보통</td>
						<td colspan="2"></td>
						<td colspan="3" style="text-align:right">불만족</td>
					</tr>
				</table>
			</div>
			
			<hr class="horizontal"/>
		</div>
		
		
		
	</div>
	</section>
	


<jsp:include page="/base_design/inc/footer.jsp"></jsp:include>