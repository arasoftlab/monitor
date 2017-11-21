<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <div>
 <!-- 메인콘텐츠 02 -->
<div class="clearfix"></div>
<div class="copyright_info four">
<div class="container">
    
    <div class="two_third">
     <!-- PC화면 -->    
		<table style="width:100%;" class="foot1">
			<tr>
				<td rowspan="2"> <img src="<c:url value='/img/front/b_logo_w.png'/>"/></td>
				<td style="color: #000;">04524 서울특별시 중구 세종대로 110 서울특별시청 시민소통담당관</td>
			</tr>	
			<tr>	
				<td style="margin-left: 0%;color: #000;"><b>Tel </b> 2133-6441, 6432 &nbsp;&nbsp; ⓒ Seoul Metropolitan Government all rights reserved
				</td>					
			</tr>	
			</tr>
		</table>
		
	 <!-- 모바일 -->
		<table style="width:100%;" class="foot2">
			<tr>
				<td style="color: #000;">04524 서울특별시 중구 세종대로 110 서울특별시청</td>
			</tr>
			<tr>
				<td style="color:#000;"><b>시민소통담당관 Tel 02) 2133-6441, 6432</b></td>
			</tr>
			<tr>
				<td style="color:#000;">ⓒ Seoul Metropolitan Government all rights reserved</td>
			</tr>
		</table>

    </div>
    
    <div class="one_third last">
        
        <ul class="three" style="color:#fff;">
            <li><a style="font-weight: bold;color: blue;" href="http://www.seoul.go.kr/v2007/help/privacy.html?Sid=601_01" target="blank">개인정보 처리방침</a> | 
            <a href="http://www.seoul.go.kr/v2007/help/email.html" target="blank">이메일무단수집거부</a></li>            
        </ul>
            
    </div>
    
</div>
</div><!-- end copyright info -->
</div>

<!-- for image popup -->
<div id="image-gallery" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-body">
            <img src="//placehold.it/1000x600" class="img-responsive">
        </div>
    	<div class="modal-footer">
                <div class="col-md-2">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                </div>
        </div>    
    </div>
  </div>
</div>

<!-- for loading -->
<div class="loadding"><!-- Place at bottom of page --></div>
<div class="progress">
    <div class="bar"></div >
    <div class="percent">0%</div >
</div>


