<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="fileUpMaxCnt" value="1"/>
<c:set var="fileMaxSize" value="20"/>
<c:set var="fileObjects" value="bmp,gif,jpg,jpeg,png"/>

<script type="text/javascript">

fnCheckSession();

	var fileUpMaxCnt = "${fileUpMaxCnt}";
	var fileMaxSize = Number("${fileMaxSize}") * 1024 *1024;
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

			    	if(data.result=="success"){
						fileSize = Number(data.fileSize);
												
						if(fileSize <= fileMaxSize){
							fnFileUpload();
						}else{
							if(data.status == "508"){
				    			alert(data.result);
				    		}else{
				    			alert("파일체크가 실패하였습니다.\n관리자에게 문의하세요.");	
				    		}
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
		
		//console.log(options);
		
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
		
		var i = 0;
		
		$("input[name='fileListId']").each(function(){
			$(this).attr("checked",true);
			i ++;
		});
		
		return i;
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
	
	
	function onSave()
	{
		if ($("#title").val() == "")
		{
			alert("제목을 입력해주세요.")
			return false;		
		}
		
		if ( !fnFileChecked() ) 
		{
			alert("이미지를 올려주세요. 파일선택 후 파일등록을 클릭하셔야 합니다");ㅣ
		}
		

		
		$.ajax({
				async : true,
				type : "POST",
				url : "<c:url value='/front/community/story/save.do'/>",
				data : $("form").serialize(),
				success : function(data){
					if(data.result == "success"){
						location.href="<c:url value='/front/community/photo/photo_list.do'/>";
					}else{
						alert("저장된 데이터가 없습니다.");
					}
				},
				error : function(request,status,error) {
					//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					alert("error!!");
				}
		});
	}	
	
</script>


<form>
	<input type="hidden" name="cont_uuid" value="${vo.cont_uuid}">
	<input type="hidden" name="type" value="P">

	<div class="content_right" style="display:block">
  <h3>포토갤러리</h3>	
  
			<table class="table_02">
				<colgroup>
					<col width="25%;">
					<col width="75%;">
				</colgroup>
				<tbody>
					<tr>
						<th>제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
						<td colspan=3 class="left">
							<input type="text" name="title" id="title" value="${vo.title }" style="width:100%;">
						</td>
					</tr>
					<tr>
						<th>작&nbsp;성&nbsp;자</th>
						<td colspan=3 class="left">
							<input type="text" name="member_id" id="member_id" style="width:50%;" value="${member_id }" readonly>
						</td>
					</tr>
					<tr>
						<th>내&nbsp;&nbsp;&nbsp;&nbsp;용</th>
						<td colspan=3 class="left editor1">
							<textarea style="width:100%;" rows="5" name="description">${vo.description}</textarea>
						</td>
					</tr>
					
					<tr>
						<th>첨부파일</th>
						<td colspan=3 class="left">
								<div style="margin-bottom:1%;width:100%;">
									<div>
										<input type="file" name="file" style="width:80%;float:left;"/>
										
										<div style="width:50%; float:right;">
											<label style="float:right;"><input type="button" onclick="fnDeleteFile();" value="파일삭제"></label>
											<label style="float:right;"><input type="button" onclick="fnFileCheck();" value="파일등록" ></label>
										</div>
									</div>
								</div>
								
								
							<table class="table_02 file_table" style="margin-bottom:10px;">
								<colgroup>
									<col width="10%;">
									<col width="*;">
									<col width="20%;">
								</colgroup>
								<thead class="th_bg">
									<tr align="center">
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
							<div style="font-size:12px">
								<p>최대 업로드 개수 : <b>${fileUpMaxCnt }</b>개 (파일 용량 : <b>${fileMaxSize }</b>MB이하)</p>
								<p>업로드 가능 파일 종류 : <b>${fileObjects }</b></p>
							</div>
						</td>
					</tr>
				</tbody>
			</table>

		
		<div style="text-align:right;margin-top:20px;">
			<button type="button" class="btn btn-primary button_blue button_white" onclick="onSave()">등록</button>
			<button type="button" class="btn btn-default button_blue button_white" onclick="location.href='<c:url value='photo_list.do'/>'">취소</button>
		</div>
		
		<div class="clearfix divider_dashed7"></div>
	</div>
	
	<c:if test="${!empty vo.description }">





</c:if>

	</form>