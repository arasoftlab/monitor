<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<c:set var="fileUpMaxCnt" value="1"/>
<c:set var="fileMaxSize" value="20"/>

<c:set var="fileObjects" value="bmp,gif,jpg,jpeg,png"/>

<c:set var="fileObjects_t" value="txt,xls,xlsx,doc,docx,hwp,ppt,pptx,pdf"/>
    
<style>
.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: black;
  font-weight: bold;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

.filebox input[type="file"] {  /* 파일 필드 숨기기 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}

#imagePreview {
	padding: 10px;
}

.img-responsive{ max-height: calc(100vh - 225px);}	
</style>

<script>

	var fileUpMaxCnt = "${fileUpMaxCnt}";
	var fileMaxSize = Number("${fileMaxSize}") * 2048 *1024;

	var uptype = "${optionList[0].label_1}";
	
	var fileObjects ="";
	
	if (uptype == "img"){  
		fileObjects ="${fileObjects}";
	}
	else
	{
		fileObjects ="${fileObjects_t}";
	}

	
	function guid() {
	    function s4() {
	      return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
	    }
	    return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
	}
		
	function fnFileCheck(){

		var fileSize =0;
		var $progress = $('#myModal');
		var options = {  
			    url: "<c:url value='/file/fileSize.do'/>",
			    dataType: 'json',
			    beforeSend: function(){
			    	$progress.css('display', 'block');
					$progress.modal({backdrop: 'static', show: true});
					$progress.modal('show');
			    },
			    success: function(data){

					if( data.result == "success" ){
						fileSize = Number(data.fileSize);

						if(fileSize <= fileMaxSize){

							fnFileUpload();							
						}						
						
					}else{
						
						if(data.status == "508"){
			    			alert(data.result);
			    			return;
			    		}else{
			    			alert("파일체크 오류 입니다.");
			    			return;
			    		}
					}

			    },
			    error: function(xhr, textStatus, errorThrown){
			    	alert("사용하신 브라우저의 버전은 인터넷 익스플로러 " + $.browser.version + "입니다. \n상위버전을 사용해 주세요.!!");
			    	return;
			    },
			    complete: function(xhr){
			    	
			    }
			};
		
	
		$("form").attr("method","POST").attr("enctype","multipart/form-data").ajaxSubmit(options);

	}
	
	
	
	function fnFileUpload(){
		

		data_id = guid();
		var $progress = $('#myModal');
		var $bar = $progress.find('.progress-bar');
		var $percent = $('.percent');
		
		var options = {
			    url: "<c:url value='/file/fileUpload.do' />",
			    data: { "data_id" : data_id },
			    dataType: 'json',
			    beforeSend: function(){
			    	var percentVal = '0%';
			    	$bar.width(percentVal);
			    	$percent.html(percentVal);
			    },
			    uploadProgress: function(event, position, total, percentComplete){
			    	var percentVal = percentComplete + '%';
			    	$bar.width(percentVal);
			    	$percent.html(percentVal);
			    },
			    success: function(data){
			    	var file = null;

					if(data.status != "508" && data.result == "success"){
			    		var file = data.fileVO;
			    		var fimg = $("#file_img");
			    		fimg.attr("src" ,"/monitor/"+file.savePath + "/"+ file.unqFileName);
						fimg.css("display" , "block");
						fimg.addClass("img-responsive");
						fimg.addClass("img-thumbnail");
						fimg.addClass("center-block");
						fimg.css("padding", "5px");
						
						$("#files").val("/monitor/"+file.savePath + "/"+ file.unqFileName);
						
						$("input[type='file']").val("");
						
						if($("#files").val().length < 1){			
							alert("파일을 선택 하세요.");
							return;
						}
						
						if(!checkFileExtension()){
							alert("업로드가 가능한 파일이 아닙니다");
							return;	
						}
						
						if($("#fileList").find("tr").length >= fileUpMaxCnt){
							alert("최대 업로드 개수는 "+fileUpMaxCnt+"개 입니다.");
							$("input[type='file']").val("");
							return;
						}
						
						
			    		var html = 	"<tr>";
						html += 		"<input type='hidden' id='fileListId' value='"+file.file_id+"' checked>";
						html += 		"<td class='text-left'>"+file.orgFileName+"</td>";
						html += 	"</tr>";
						$("#fileList").append(html);

						$("input[type='file']").val("");
						
												
			    	}else{
			    		if(data.status == "508"){
			    			alert(data.result);
			    		}else{
			    			alert("등록에 실패하였습니다.\n관리자에게 문의하세요.");	
			    		}
			    		return;
			    	}
					var percentVal='100%';
					$bar.width(percentVal);
					$percent.html(percentVal);
					
			    },
			    error: function(xhr, status, err){
			    	alert("등록에 실패하였습니다.\n정상파일로 다시시도해 주세요.");
			    	return;
			    },
			    complete: function(xhr){
			    	$progress.modal('hide');
			    	$progress.css('display','none');
			    }
		};
				
		$("form").attr("method","POST").attr("enctype","multipart/form-data").ajaxSubmit(options);
		
	}
	
	function fnDeleteFile(){
		if($("#fileList").find("tr").length < 1){
			alert("등록된 파일이 없습니다.");
			return;
		}
		
		if($("input[id='fileListId']:checkbox:checked").length == 0){
			alert("삭제할 파일을 선택 해 주세요.");
			return;
		}
		
		var fileListId = new Array();
		$("input[id='fileListId']:checked").each(function(){
			fileListId.push($(this).val());
		});
		
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/file/deleteFile.do'/>",
			data : "fileListId="+fileListId,
			dataType:'json',
			success : function(data){
				if(data.result == "success"){
					$("input[id='fileListId']:checked").each(function(){
						$(this).parent().parent().remove();
					});
				}else{
					if(data.status == "508"){
		    			alert(data.result);
		    		}else{
		    			alert("파일을 삭제 하는데 실패하였습니다.\n관리자에게 문의하세요.");	
		    		}
				}
			}
		});
		
	}
	
	function fnFileChecked(){
		
		var i = 0;
		
		$("input[id='fileListId']").each(function(){
			$(this).attr("checked",true);
			i ++;
		});
		
		return i;
	}
	
	//파일 확장자 검사
	function checkFileExtension(){
		//var fileExt = $("input[type='file']").val().substring($("input[type='file']").val().lastIndexOf('.') + 1).toLowerCase();
		var fileExt = $("#files").val().substring($("#files").val().lastIndexOf('.') + 1).toLowerCase();
		var validExtensions = fileObjects.split(",");
		for(var i = 0; i < validExtensions.length; i++) {  
			if(fileExt == validExtensions[i])  
				return true;  
		}  		 		
		return false;
	}	
 
</script>

<script>

function chkValidation()
{
	var chk= '${optionList[0].endpoint }';
	
	var file_type_chk = '${optionList[0].label_1 }';
	
	var examrequirechk = '${optionList[0].examrequire}';
	
	
	if (chk == "Y")
	{
		if ( !fnFileChecked() ) 
		{
			if ($("#files").val() != "" && file_type_chk == "img" )
			{
				$("#answers_1").val($("#answers_1").val().replace(/\n/g, "<br>"));
				$("#answers_1").val($("#answers_1").val().replace(/\r\n/g, "<br>"));
				
				//alert(examrequirechk);
				//alert($("textarea").val());
				
				if(examrequirechk =='Y'){
					if($("textarea").val().length < 1){
						alert("설명이 필수여서 기록해 주셔야 합니다.");
						$("textarea").focus();
						return;
					}

				}
				
				historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}',0 ,'${history_params}');		
			}else{
				alert("첨부파일을 등록해야 진행 할 수 있습니다.");
			}
		}else{			
			$("#answers_1").val($("#answers_1").val().replace(/\n/g, "<br>"));		
			$("#answers_1").val($("#answers_1").val().replace(/\r\n/g, "<br>"));
			historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}',0 ,'${history_params}');		
		}
		
	}else{
		$("#answers_1").val($("#answers_1").val().replace(/\n/g, "<br>"));
		$("#answers_1").val($("#answers_1").val().replace(/\r\n/g, "<br>"));
		historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}',0 ,'${history_params}');		
	}
	
	

}

function resize(obj) {
	////console.log(obj);
	
    obj.style.height = "1px";
    obj.style.height = (20+obj.scrollHeight)+"px";
}




// for mobile camera
function chkMob() {
	
	if (navigator.userAgent.match("iPhone") != null || navigator.userAgent.match("Android") != null ){
		
	    $('#camera').css("display","block"); 
	    
	} else {
	    $('#camera').css("display","none");
	    $('.filebox').removeAttr("style");
	    $('.filebox').css("width","95%");
	    $('.filebox').css("margin", "0 auto");
	}
}

chkMob();

</script>





	<div style="background: lightblue;
    border-radius: 6px 6px 0 0;padding:15px;">
		<div style="width: 100%;font-size: 14pt;font-weight: bold;border: 0px;">
			${vo.question_num}. 
			${vo.title }
		</div>
		
		<div style="color:#8C8C8C;padding-top:5px;padding-bottom:5px">		
			${vo.description }
		</div>
	</div>

<form name="testData" style="padding-top:10px; padding-bottom:10px; width:100%">

	<input type="hidden" id="type" name="type" value="${vo.type}">
	<input type="hidden" id="q_num" name="q_num" value="${vo.question_num}">

<div style="font-size:10pt;padding-left: 10px;width:100%; padding-top:5px;padding-bottom:5px;">	

	<c:forEach var="item" items="${optionList }">
	
		<div style="font-size:10pt;padding-bottom:10px">
			<b>${item.label_front }</b> <br>
<!--  
			<input onkeydown="return captureReturnKey(event)" type="text" id="answers_${item.options_num}" name="answers_${item.options_num}" style="width:97%" value="${history_answer[i.index+1]}" >
-->
			<textarea style="width:98%;margin-top:10px;margin-right:10px;" onKeyUp="onChkESQ(this)" id="answers_${item.options_num}" name="answers_${item.options_num}" rows="3" >${history_answer[i.index+1]}</textarea>
			
		</div>

	</c:forEach>
</div>
		<c:choose>
	
			<c:when test="${empty t_type_img }">
				<c:if test="${optionList[0].label_1 ne 'file'}">
			
					<div id="imagePreview">
						<img src="${t_type_img }" id="file_img" class="img-responsive img-thumbnail center-block"/>
					</div><br>
				</c:if>
				<input type="hidden" id="files" name="files" value="">
			</c:when>
			
			<c:otherwise>
				<c:if test="${!empty optionList[0].label_1 && optionList[0].label_1 ne 'file'}">
				 
					<div id="imagePreview">
						<img src="${t_type_img }" id="file_img" class="img-responsive img-thumbnail center-block" />
					</div><br>
				</c:if>					
					<input type="hidden" id="files" name="files" value="${t_type_img }">

			</c:otherwise>
		</c:choose>

				<c:if test="${empty optionList[0].label_1 || optionList[0].label_1 eq 'file'}">
								<table class="table table-bordered"> 
									<colgroup>
										<col width="*;">
									</colgroup>
									<thead class="th_bg">
										<tr>
											<td>파일이름</td>
										</tr>
									</thead>
									<tbody id="fileList">
									
									</tbody>
								</table>
				</c:if>
	
	
	<c:choose>
		<c:when test="${optionList[0].label_1 eq 'img'}">
			<div id="camera">
			<div class="filebox" style="width: 49%; float:left">
			  <label for="cam" style="text-align:center;width: 100%;background: lightblue;border-radius: 6px 6px 6px 6px;">[사진촬영] <br>보내기</label>
			  <input type="file" name="cam" id="cam" accept="image/*" capture="camera"  onchange="fnFileCheck();">  
			</div>
			</div>
			<div class="filebox" style="width: 49%; float: right">
			  <label for="image" style="text-align:center;width: 100%;background: lightblue;border-radius: 6px 6px 6px 6px;">[사진등록] <br>보내기</label>
			  <input type="file" name="image"  id="image" accept="image/*" onchange="fnFileCheck();">  
			</div>			
			
		</c:when>
		
		<c:otherwise>
			<div class="filebox" style="width: 100%;">
			  <label for="image" style="text-align:center;width: 100%;background: lightblue;border-radius: 6px 6px 6px 6px;">텍스트 선택해서 <br>보내기</label>
			  <input type="file" name="image" id="image" onchange="fnFileCheck();">  
			</div>
		</c:otherwise>
	</c:choose>
		
	<div style="min-height: 70px;">

		<div class="mobile_notice_table" style="display:none;width: 100%;margin-top:20px;">
		  <label style="text-align:center;width: 100%;background: lightblue;border-radius: 6px 6px 6px 6px;" onclick="alert('준비중')">사진 찍어서 <br>보내기</label>
		</div>
	</div>

<div style="width:100%;float:left;margin-left:10px;text-align:center">		
	<c:choose>
		<c:when test="${vo.cont_type eq 'V'}">

			<c:forEach var="item" items="${settingsList }">
				<c:forEach var="file" items="${item.fileList }">
					<div style="width:100%;text-align:center;">
						<video width="250px" controls="controls"
							class="video-js vjs-default-skin" data-setup="{}"> 
							<source	src="<c:url value='${file.savePath }/${file.unqFileName }'/>"
							type="video/mp4" /> 
						</video>
					</div>
	
				</c:forEach>
			</c:forEach>
		</c:when>
		
		<c:when test="${vo.cont_type eq 'I'}">
		
			<c:forEach var="item" items="${settingsList }">
				<c:forEach var="file" items="${item.fileList }">
					<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" style="max-width:80%">
				</c:forEach>
			</c:forEach>

		</c:when>		
		<c:otherwise>
		
		</c:otherwise>
	</c:choose>
</div>
	
</form>


<%@ include file="inc/footer_common.jsp" %>

<jsp:include page="inc/footer_T.jsp"></jsp:include>




