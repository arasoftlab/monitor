
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" var="today_date"/>

<fmt:formatDate value="${vo.poll_start_date}" pattern="yyyy-MM-dd" var="s_date"/>
<fmt:formatDate value="${vo.poll_end_date}" pattern="yyyy-MM-dd" var="e_date"/>


<script>
function onEnter_join()
{	
	if ($("input:checkbox[id='chk']").is(":checked"))
	{
		location.href="<c:url value='join_view.do'/>";		
	}else{
		alert("시정모니터링 신청에 동의해주세요.");
	}
}
</script>


<style>
	.base_table{
		width: 100%;
    	border-top: 2px #4fb3d2 solid;
    	border-bottom: 2px #4fb3d2 solid;
    	padding:5px;
    }
    .base_table td{
    	padding-left:10px;
    }
    .mypage_table th {text-align:left;padding-left: 10px;}
	.paragraph h6{color:#167be3; font-weight:bold; padding-top:20px;}    
	.mypage_table td{padding-left:10px;}
	.radioGroup{text-align:right;}
	.radioGroup input{margin: 0px 5px;}
	.monitor2 h5, .monitor{color: red;}
	.list_style li{list-style:disc;}
	.list_style{font-weight:bold; padding-left:30px;}
</style>



	<!-- 서브 콘텐츠 -->
	<div class="content_right" style="display:block">
		<!-- 게시판 시작 -->
		<div class="col-lg-12" style="padding:0;">
		 <h3>꼼꼼한 서울씨 가입</h3>
		</div>		

		<div class="paragraph">
			<h6>신청방법 및 진행과정</h6>
			<p style="color:red;">o 제 19기 모니터로 선정되신 300분(모집기간:2017. 2. 2. ~ 2017. 2. 16.)에 한해서만 가입이 가능합니다.</p>
			<p>o 제 19기 선정자 명단은 공지사항(<a href="https://research.seoul.go.kr/monitor/front/notice/all/view.do?notice_id=284"><b>클릭!!</b></a>)에서 확인해 주세요</p>
			<br>
			<p>1) 서울시 홈페이지 통합회원으로 실명인증 후 가입</p>
			<!-- p>2) 꼼꼼한 서울씨 홈페이지(https://research.seoul.go.kr/monitor/front/info/join/join_list.do/)에서 모집기간 중 신청</p -->
			<p>2) 서울시민모니터 꼼꼼한서울씨 홈페이지에서 19기로 가입</p>
			<p>3) 가입신청자 중 기선발된 19기 모니터요원 300명에 한해 정회원 승급</p>
			<p>4) 19기 활동기간 동안 모니터링 과제 수행</p>
		</div>			
		<div class="paragraph">		
		<h6 style="margin-top:20px;">개인정보 수집 및 이용 동의</h6>
		</div>
		<table class="base_table">
			<tbody>
				<tr>
					<td style="color:red;">o 서울시민모니터 : ${vo.poll_num}기 </td>
				</tr>
				<tr>
					<td style="color:red;">
						o 활동기간 : 
						<fmt:formatDate value="${vo.poll_start_date }" pattern="yyyy년 MM월 dd일" /> ~ 					
						<fmt:formatDate value="${vo.poll_end_date }" pattern="yyyy년 MM월 dd일" />
					</td>
				</tr>
				<tr>
					<td style="padding-top:20px;">o 개인정보 수집·이용 목적 : 꼼꼼한 서울씨 가입을 위해 수집·이용되며 제3자에게 제공하지 않습니다.</td>
				</tr>
				<tr>
					<td>o 수집 항목
      			<ul class="list_style">
      			  <li>ID, 성명, 생년월일, 연락처, 거주지, 이메일 : 서울시 홈페이지 가입정보에서 자동 연계</li>
    	  		  <li>성별, 직업, 상세주소지 : 꼼꼼한 서울씨 홈페이지에서 추가 입력</li>
      			</ul>					
					</td>
				</tr>
				<tr>
					<td>o 보유·이용 기간 : 회원 탈퇴 시까지 또는 법령에 따른 개인정보 보유기간 내에서</td>
				</tr>
				<tr>
					<td>o 동의 거부 권리 안내:  개인정보 수집·이용 동의를 거부할 수 있습니다. 다만, 이 경우 가입신청이 제한됩니다.</td>
				</tr>
				<tr>
					<td style="padding-top:20px;color:blue;">
						<input type="checkbox" id="chk" style="padding:0 5px;"/>
						 서울시에서 운영하는 꼼꼼한 서울씨 모니터회원에 가입하고 활용하는 것에 동의합니다.
					</td>
				</tr>
			</tbody>
		</table>
<!------ 2017/04/20 추가 ------>		
		<div class="paragraph" style="margin-top:20px;">
			<h6>19기 가입 마감 되었습니다. 19기 300분 중 미가입자 분은 하단 연락처로 문의 주시기 바랍니다.</h6>		
    </div>
<!------ 2017/04/20 주석처리
		<div style="text-align:right;margin-top:20px;">
				<c:choose>
				
					<c:when test="${(!empty member) && ( vo.poll_num eq member.poll_num) }">
						<button type="button" class="btn"  onclick="alert('이미 가입신청하셨습니다.')">시민모니터 신청 </button>
					</c:when>

					<c:when test="${member.grade eq 'nomal' && vo.poll_num ne member.poll_num }">
						<button type="button" class="btn"  onclick="onEnter_join()">시민모니터 신청 </button>						
					</c:when>

					<c:otherwise>
						<button type="button" class="btn"  onclick="onEnter_join()">시민모니터 신청 </button>				
					</c:otherwise>
				</c:choose>
			<button type="button" class="btn" onclick="location.href='<c:url value='/front/main.do'/>'">취소</button>
		</div>
--------->
		<div class="clearfix divider_dashed7"></div>
 
	</div>


</div>