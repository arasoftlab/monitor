	var fileUpMaxCnt = "3";
	var fileMaxSize = Number("20") * 2048 *1024;
	var fileObjects = "{bmp,gif,jpg,jpeg,png,txt,xls,xlsx,doc,docx,hwp,ppt,pptx,pdf,mp4,zip}";
	
	
	/*
	 * 작성자 : JINX
	 * 주석이유 : 다 받아오는걸 기본으로 하기때문에 주석으로 걸어놨으며 나중에 js 격 uuid가 필요할때 끌어쓰면 됨 
	 * 
	function guid() {
	    function s4() {
	      return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
	    }
	    return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
	}
	*/
	
	/* 
	 * 파일 업데이트 
	 * */
	
	function O_fnFileCheck_update(prefix,uuid,opener_prefix){
		
		var fileSize;
		var $progress = $('#progressModal');
		var options = {  
			    url: "/monitor/file/fileSize.do",
			    dataType: 'json',
			    success: function(data) {
			    	if(data.result=="success"){
						fileSize = Number(data.fileSize);
						if(fileSize <= fileMaxSize){
							
							O_fnFileUpdate(prefix,uuid,opener_prefix);
						}else{
							alert("파일 용량으로 인하여 업로드를 할 수 없습니다.");
						}			    		
			    	}
			    },
			    error: function(xhr, textStatus, errorThrown){
			    	alert(xhr.status);
			    	alert(xhr.responseText);
			    	alert("fileCheck Error!!!");
			    }
			};
				
		if($(":input:file[name=O_file_set"+prefix+"]").val().length < 1){			
			alert("파일을 선택 하세요.");
			return;
		}
		
		if(!O_checkFileExtension(prefix)){
			alert("업로드가 가능한 파일이 아닙니다");
			return;	
		}
		
		
		if($("#O_fileList"+prefix+"").find("tr").length >= fileUpMaxCnt){
			alert("최대 업로드 개수는 "+fileUpMaxCnt+"개 입니다.");
			$(":input:file[name=O_file_set"+prefix+"]").val("");
			return;
		}
		
		$("#q_form"+opener_prefix+"").attr("method","POST").attr("enctype","multipart/form-data").ajaxSubmit(options);
	}
	
		
	function O_fnFileUpdate(prefix,uuid,opener_prefix){

			var data_id = uuid;
			var options = {
				    url: "/monitor/file/fileUpdate.do",
				    data: { "data_id" : data_id }, 
				    dataType: 'json',			    
				    success: function(data) {
				    	if(data.result == "success"){

				    		var file = data.fileVO;
				    		var html = "<img src='/monitor"+file.savePath+"/"+file.unqFileName+"' style='width: 150px;'>";
							$("#O_fileList"+prefix+"").html(html);
							$(":input:file[name=O_file_set"+prefix+"]").val("");
				    	}else{
				    		alert("등록에 실패하였습니다.\n관리자에게 문의하세요.");
				    	}
				    	
				    },
				    error: function(request,status,error) {
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						alert(request.status);
				    	alert("fileUpload Error!!!");
				    },
			};
			
			$("#q_form"+opener_prefix+"").attr("method","POST").attr("enctype","multipart/form-data").ajaxSubmit(options);
		}
		
	/* 
	 *  최초 인서트  img
	 * */
	
	function O_fnFileCheck(prefix,uuid,opener_prefix){

		var fileSize;
		var $progress = $('#progressModal');
		var options = {  
			    url: "/monitor/file/fileSize.do",
			    dataType: 'json',
			    success: function(data) {
			    	if(data.result=="success"){
						fileSize = Number(data.fileSize);
						if(fileSize <= fileMaxSize){
							
							O_fnFileUpload(prefix,uuid,opener_prefix);
						}else{
							alert("파일 용량으로 인하여 업로드를 할 수 없습니다.");
						}			    		
			    	}
			    },
			    error: function(xhr, textStatus, errorThrown){
			    	alert(xhr.status);
			    	alert(xhr.responseText);
			    	alert("fileCheck Error!!!");
			    }
			};
				
		if($(":input:file[name=O_file_set"+prefix+"]").val().length < 1){			
			alert("파일을 선택 하세요.");
			return;
		}
		
		if(!O_checkFileExtension(prefix)){
			alert("업로드가 가능한 파일이 아닙니다");
			return;	
		}
		
		
		if($("#O_fileList"+prefix+"").find("tr").length >= fileUpMaxCnt){
			alert("최대 업로드 개수는 "+fileUpMaxCnt+"개 입니다.");
			$(":input:file[name=O_file_set"+prefix+"]").val("");
			return;
		}
		
		
		
		$("#q_form"+opener_prefix+"").attr("method","POST").attr("enctype","multipart/form-data").ajaxSubmit(options);
	}
	
	function O_fnFileUpload(prefix,uuid,opener_prefix){

		var data_id = uuid;
		var options = {
			    url: "/monitor/file/fileUpload.do",
			    data: { "data_id" : data_id }, 
			    dataType: 'json',
			    success: function(data) {
			    	if(data.result == "success"){
			    			
			    		var file = data.fileVO;
			    		var html = "";
			    		if(!prefix.match('V'))
			    		{
			    			html = "<img src='/monitor"+file.savePath+"/"+file.unqFileName+"' style='width: 150px;'>";
			    		}
			    		else
			    		{
			    			html += "<video width='250px' controls='controls' class='video-js vjs-default-skin' data-setup='{}'";
			    			html += "<source src='/monitor"+file.savePath+"/"+file.unqFileName+"' type='video/mp4' ";			    			
			    		}
			    		$("#O_fileList"+prefix+"").append(html);
						$(":input:file[name=O_file_set"+prefix+"]").val("");
			    	}else{
			    		alert("등록에 실패하였습니다.\n관리자에게 문의하세요.");
			    	}
			    	
			    },
			    error: function(request,status,error) {
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					alert(request.status);
			    	alert("fileUpload Error!!!");
			    }
		};
		
		$("#q_form"+opener_prefix+"").attr("method","POST").attr("enctype","multipart/form-data").ajaxSubmit(options);
	}
	
	function O_fnDeleteFile(prefix){
		if($("#O_fileList"+prefix+"").find("tr").length < 1){
			alert("등록된 파일이 없습니다.");
			return;
		}
		
		if($("input[name='O_fileListId"+prefix+"']:checkbox:checked").length == 0){
			alert("삭제할 파일을 선택 해 주세요.");
			return;
		}
		
		var fileListId = new Array();
		$("input[name='O_fileListId"+prefix+"']:checked").each(function(){
			fileListId.push($(this).val());
		});
		
		$.ajax({
			async : true,
			type : "POST",
			url : "<c:url value='/file/deleteFile.do'/>",
			data : "fileListId="+fileListId,
			dataType: 'json',
			success : function(data){
				if(data.result == "success"){
					$("input[name='O_fileListId"+prefix+"']:checked").each(function(){
						$(this).parent().parent().remove();
					});
				}else{
					alert("파일을 삭제 하는데 실패하였습니다.\n관리자에게 문의하세요.");
				}
			},
			error : function(request,status,error) {
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("error!!");
			}
		});
		
	}
	
	function O_fnFileChecked(prefix){
		$("input[name='O_fileListId"+prefix+"']").each(function(){
			$(this).attr("checked",true);
		});
	}
	
	//파일 확장자 검사
	function O_checkFileExtension(prefix){
		var fileExt = $(":input:file[name=O_file_set"+prefix+"]").val().substring($(":input:file[name=O_file_set"+prefix+"]").val().lastIndexOf('.') + 1).toLowerCase();
		console.log(fileExt);
		var validExtensions = fileObjects.split(",");
		for(var i = 0; i < validExtensions.length; i++) {  
			if(fileExt == validExtensions[i])  
				return true;  
		}  		 		
		return false;
	}
