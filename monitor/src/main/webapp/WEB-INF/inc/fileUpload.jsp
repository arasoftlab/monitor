<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="fileUpMaxCnt" value="3"/>
<c:set var="fileMaxSize" value="20"/>
<c:set var="fileObjects" value="bmp,gif,jpg,jpeg,png,txt,xls,xlsx,doc,docx,hwp,ppt,pptx,pdf,zip,mp4"/>

<script type="text/javascript">
	var fileUpMaxCnt = "${fileUpMaxCnt}";
	var fileMaxSize = Number("${fileMaxSize}") * 2048 *1024;
	var fileObjects = "${fileObjects}";

	function guid() {
	    function s4() {
	      return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
	    }
	    return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
	}

	
	function fnFileCheck(){
		
		var fileSize;
		
		var options = {  
			    url: "<c:url value='/file/fileSize.do'/>",
			    dataType:'json',
			    success: function(data) {
			    	console.log(data);
			    	if(data.result=="success"){
						fileSize = Number(data.fileSize);
												
						if(fileSize <= fileMaxSize){
							fnFileUpload();
						}else{
							alert("파일 용량으로 인하여 업로드를 할 수 없습니다.");
						}			    		
			    	}else{
			    		if(data.status == "508"){
			    			alert(data.result);
			    		}else{
			    			alert("파일체크가 실패하였습니다.\n관리자에게 문의하세요.");	
			    		}
			    	}
			    }
			};
		

		
		if($("input[type='file']").val().length < 1){			
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

		$("form").attr("method","POST").attr("enctype","multipart/form-data").ajaxSubmit(options);
		
	}
	
	function fnFileUpload(){
		
		var data_id = "${vo.cont_uuid }";
		
		if (!data_id) 
		{
			data_id = guid();
		}
		
		var options = {
			    url: "<c:url value='/file/fileUpload.do' />",
			    data: { "data_id" : data_id },
			    dataType:'json',
			    success: function(data) {
			    	console.log(data);
			    	if(data.result == "success"){
			    		var file = data.fileVO;
			    		var html = 	"<tr>";
						html += 		"<td><input type='checkbox' name='fileListId' value='"+file.file_id+"' checked></td>";
						html += 		"<td class='text-left'>"+file.orgFileName+"</td>";
						html += 		"<td class='right'>"+file.fileSizeMB+" [MB]</td>";
						html += 	"</tr>";
						$("#fileList").append(html);
						$("input[type='file']").val("");
			    	}else{
			    		if(data.status == "508"){
			    			alert(data.result);
			    		}else{
			    			alert("등록에 실패하였습니다.\n관리자에게 문의하세요.");	
			    		}
			    		
			    	}
			    }
		};
		
		$("form").attr("method","POST").attr("enctype","multipart/form-data").ajaxSubmit(options);
	}
	
	function fnDeleteFile(){
		if($("#fileList").find("tr").length < 1){
			alert("등록된 파일이 없습니다.");
			return;
		}
		
		if($("input[name='fileListId']:checkbox:checked").length == 0){
			alert("삭제할 파일을 선택 해 주세요.");
			return;
		}
		
		var fileListId = new Array();
		$("input[name='fileListId']:checked").each(function(){
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
					$("input[name='fileListId']:checked").each(function(){
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
		$("input[name='fileListId']").each(function(){
			$(this).attr("checked",true);
		});
	}
	
	//파일 확장자 검사
	function checkFileExtension(){
		var fileExt = $("input[type='file']").val().substring($("input[type='file']").val().lastIndexOf('.') + 1).toLowerCase();
		var validExtensions = fileObjects.split(",");
		for(var i = 0; i < validExtensions.length; i++) {  
			if(fileExt == validExtensions[i])  
				return true;  
		}  		 		
		return false;
	}	
</script>


<form id="submitForm" enctype="multipart/form-data">

<div class="col-sm-12"  style="margin-bottom:1%;">
	
	<input type="file" name="file" class="col-sm-8"/>
		
	<!--  
	<input type="file" id="choose" multiple="multiple" />
	<div id="uploadPreview"></div>
	-->
	
	<div class="col-sm-4 pull-right right">
		<label><input type="button" onclick="fnFileCheck();" value="파일등록" ></label>
		<label><input type="button" onclick="fnDeleteFile();" value="파일삭제"></label>
		<!-- <input type="button" onclick="fnFileCheck();" value="파일등록">
		<input type="button" onclick="fnDeleteFile();" value="파일삭제"> -->
	</div>
</div>

</form>

<table class="table table-bordered">
	<colgroup>
		<col width="10%;">
		<col width="*;">
		<col width="20%;">
	</colgroup>
	<thead class="th_bg">
		<tr>
			<td></td>
			<td>파일이름</td>
			<td>사이즈</td>
		</tr>
	</thead>
	<tbody id="fileList">
	
		<c:forEach var="file" items="${vo.fileList }">
			<tr>
				<td><input type="checkbox" name="fileListId" value="${file.file_id }"></td>
				<td class="text-left">${file.orgFileName }</td>
				<td class="right">${file.fileSizeMB } [MB]</td> 
			</tr>
		</c:forEach>
	</tbody>
</table>
<div>
	<p class="small">파일 최대 업로드 개수는 <b>${fileUpMaxCnt }</b>개 입니다.</p>
	<p class="small">업로드 가능한 파일의 용량은 <b>${fileMaxSize }</b>MB이하입니다.</p>
	<p class="small">업로드 가능한 파일의 종류는 <b>${fileObjects }</b> 입니다.</p>
	<p class="small">파일 삭제 버튼 선택시 해당 파일은 자동 삭제 됩니다.</p>
</div>