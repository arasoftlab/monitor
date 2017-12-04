<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 비허용문자 치환 -->
<script>
function onChkESQ(obj){

	 //-- 기타 특수문자 제거 --
	 re = /[@\#\":\|]/gi; 
	 var temp=$(obj).val();
	 if(re.test(temp))
	 { 
	 	$(obj).val(temp.replace(re,""));
	 	alert("[ #, \", @, :, \| ] 문자는 사용할수 없습니다.");
	 }	
	 
	 var keyC = window.event.keyCode ? window.event.keyCode : window.event.which;

     //PC 222 ' 229 or 0 안드로이 모바일 한글문제가 없음
	if (navigator.userAgent.match("iPhone") != null || navigator.userAgent.match("Android") != null ){
	    
		//re2 = /[\']/gi;
	    //if(re2.test(temp)){ $(obj).val(temp.replace(re2, "`"));}
	    keyC = 0;
	} 
     
    if(keyC == 222 ||keyC == 0){
        //var cmp = $(obj);
        re3 = /[\']/gi;
        if(re3.test(temp)){ $(obj).val(temp.replace(re3, "`"));}
        //cmp.val(cmp.val().replace('\'', "`"));
    }

}
</script>

<c:if test="${!empty history_answer }">

	<script>	
	$(document).ready(function() {
	
		var w_temp_cnt = "${fn:length(optionList)}";
		var $txArea = $("textarea");
		$txArea.val($txArea.val().replace(/<br>/g, "\r\n"));
		
	for (var a=0; a <= w_temp_cnt; a++)
		{
			if(typeof($("#answers_"+a)) != "undefined"){
				$("#answers_"+a).val($("#answers_"+a).val().replace(/<br>/g, "\r\n"));	
			}
		}
 
	});
	</script>

</c:if>

<!-- Modal -->
<div class="modal animated fade center-block" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display:none;">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel"><i class="fa fa-clock-o"></i>잠시만 기다려 주세요.</h4>
      </div>
      <div class="modal-body">
        <p>파일업로드를 처리중입니다.</p>
        <div class="progress">
          <div class="progress-bar bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
            
          </div>
        </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->