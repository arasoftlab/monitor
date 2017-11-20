<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 

<script>
fnCheckSession();

function onBankApply()
{
	if($("#bank").val() == "" )
	{
		alert("은행명을 선택해주세요.");
		return false;
	}

	if($("#bank_num").val() == "" )
	{
		alert("계좌번호를 입력해주세요.");
		return false;
	}


	
	$.ajax({
		async : true,
		type : "POST",
		url : "<c:url value='bank_apply.do'/>",
		data :	$("form").serialize(),
		success : function(data){
			if(data.result=="success")
			{
				$("#idx").val(data.idx);
				var r = confirm("전송 되었습니다. \n창을 닫으시겠습니까?");
				if (r == true) {
					window.close();
				} else {

				}
				
			}		
		},
		error : function(request,status,error) {
			//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("error!!");
		}
	});
}

</script>

<form onsubmit="return false;">
	
	<input type="hidden" name="subject_id" value="${subjectID}">
	<input type="hidden" name="idx" id="idx" value="${vo.idx}" >	
	
	<div style="width:90%;margin:0 auto;text-align:center;margin-top:10%">
	
		<!-- 상단 로고 -->
		<div style="width:100%">
			<img src=" /monitor/img/front/top_logo2.png">
		</div>
		
		<!-- 설명 -->
		<div style="width:80%;margin:30px auto;">
		
			<span>
				[전송]버튼을 누르면 작성한 과제가 전송됩니다. <br/>서울시청에 관심을 가져주셔서 감사합니다.		
			</span>
		</div>
		
		
		<!-- 운행명 & 계좌번호-->
		<table style="width:80%;margin:auto;border:none;">
			
			<tr>
				<td style="width:25%;border:none;">은행명</td>
				<td style="width:75%;border:none;text-align:left;padding:5px;">
					<select name='bank' id='bank' class='product_iinput' style="font-size: 17px;width: 100%;height: 36px;">
					      <option value="">-선택-</option>
					       <option value='SC제일은행'>SC제일은행</option>
					       <option value='경남은행'>경남은행</option>
					       <option value='광주은행'>광주은행</option>
					       <option value='국민은행'>국민은행</option>
					       <option value='굿모닝신한증권'>굿모닝신한증권</option>
					       <option value='기업은행'>기업은행</option>
					       <option value='농협중앙회'>농협중앙회</option>
					       <option value='농협회원조합'>농협회원조합</option>
					       <option value='대구은행'>대구은행</option>
					       <option value='대신증권'>대신증권</option>
					       <option value='대우증권'>대우증권</option>
					       <option value='동부증권'>동부증권</option>
					       <option value='동양종합금융증권'>동양종합금융증권</option>
					       <option value='메리츠증권'>메리츠증권</option>
					       <option value='미래에셋증권'>미래에셋증권</option>
					       <option value='뱅크오브아메리카(BOA)'>뱅크오브아메리카(BOA)</option>
					       <option value='부국증권'>부국증권</option>
					       <option value='부산은행'>부산은행</option>
					       <option value='산림조합중앙회'>산림조합중앙회</option>
					       <option value='산업은행'>산업은행</option>
					       <option value='삼성증권'>삼성증권</option>
					       <option value='상호신용금고'>상호신용금고</option>
					       <option value='새마을금고'>새마을금고</option>
					       <option value='수출입은행'>수출입은행</option>
					       <option value='수협중앙회'>수협중앙회</option>
					       <option value='신영증권'>신영증권</option>
					       <option value='신한은행'>신한은행</option>
					       <option value='신협중앙회'>신협중앙회</option>
					       <option value='에스케이증권'>에스케이증권</option>
					       <option value='에이치엠씨투자증권'>에이치엠씨투자증권</option>
					       <option value='엔에이치투자증권'>엔에이치투자증권</option>
					       <option value='엘아이지투자증권'>엘아이지투자증권</option>
					       <option value='외환은행'>외환은행</option>
					       <option value='우리은행'>우리은행</option>
					       <option value='우리투자증권'>우리투자증권</option>
					       <option value='우체국'>우체국</option>
					       <option value='유진투자증권'>유진투자증권</option>
					       <option value='전북은행'>전북은행</option>
					       <option value='제주은행'>제주은행</option>
					       <option value='키움증권'>키움증권</option>
					       <option value='하나대투증권'>하나대투증권</option>
					       <option value='하나은행'>하나은행</option>
					       <option value='하이투자증권'>하이투자증권</option>
					       <option value='한국씨티은행'>한국씨티은행</option>
					       <option value='한국투자증권'>한국투자증권</option>
					       <option value='한화증권'>한화증권</option>
					       <option value='현대증권'>현대증권</option>
					       <option value='홍콩상하이은행'>홍콩상하이은행</option>
					      </select>
				</td>
			</tr>
			<tr>
				<td style="width:25%;border:none;">계좌번호</td>
				<td style="width:75%;border:none;text-align:left;padding:5px;">
					<input type="text" name="bank_num" id="bank_num" style="width:100%" value="${vo.bank_num}">
				</td>
			</tr>
		
		</table>
		
	
		<div style="width:80%;margin:auto; text-align:right;">
			<button class="btn btn-theme" onclick="onBankApply()">전송</button>
		</div>
	
	</div>

</form>
