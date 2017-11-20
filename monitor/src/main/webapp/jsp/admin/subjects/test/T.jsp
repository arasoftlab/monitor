<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<style>
.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #999;
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
</style>

<script>

var InputImage = 
 (function loadImageFile() {
    if (window.FileReader) {
        var ImagePre; 
        var ImgReader = new window.FileReader();
        var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i; 
 
        ImgReader.onload = function (Event) {
            if (!ImagePre) {
                var newPreview = document.getElementById("imagePreview");
                ImagePre = new Image();
                ImagePre.style.width = "200px";
                ImagePre.style.height = "140px";
                newPreview.appendChild(ImagePre);
            }
            ImagePre.src = Event.target.result;
            
        };
 
        return function () {
         
            var img = document.getElementById("image").files;
           
            if (!fileType.test(img[0].type)) { 
             alert("이미지 파일을 업로드 하세요"); 
             return; 
            }
            
            ImgReader.readAsDataURL(img[0]);
        }
 
    }
   
            document.getElementById("imagePreview").src = document.getElementById("image").value;
 
      
})();
 
 
</script>

<script>


function chkValidation()
{
	historyAppend('${nextpage.question_id }' , '${history_arr}', '${nextpage.question_num}');
}

function resize(obj) {
	//console.log(obj);
	
    obj.style.height = "1px";
    obj.style.height = (20+obj.scrollHeight)+"px";
}
</script>


<form name="testData">

	<input type="hidden" id="type" name="type" value="${vo.type}">
	<input type="hidden" id="q_num" name="q_num" value="${vo.question_num}">

	<div>
		<h2>
			<textarea id="bbs_cont" name="bbs_cont" onkeyup="resize(this)" readonly style="width: 100%;overflow: hidden;resize:none;font-weight: bold;border: 0px;">${vo.title }</textarea>
		</h2>
	</div>

	<div style="color:#8C8C8C">		
		<textarea id="bbs_dsc" name="bbs_dsc" onkeyup="resize(this)" readonly style="width: 100%;overflow: hidden;resize:none;font-weight: bold;border: 0px;">${vo.description }</textarea>
	</div>

	<c:forEach var="item" items="${optionList }" >
	
				<div>
					${item.label_front } </br>
					<input type="text" id="answers_text_${item.options_num}" name="answers_text_${item.options_num}" >
				</div>

				<div>
					<c:forEach var="file" items="${item.fileList }">
						<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>"
							style="width: 150px;">
					</c:forEach>
				</div>

	</c:forEach>


	<div id="imagePreview"></div><br>
	
	<div class="filebox">
	  <label for="image">업로드</label>
	  <input type="file" id="image" onchange="InputImage();">  
	</div>
</form>

	<c:choose>
		<c:when test="${vo.cont_type eq 'V'}">

		<hr class="horizontal"/>

			<c:forEach var="item" items="${settingsList }" >
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
				<hr class="horizontal"/>
		
			<c:forEach var="item" items="${settingsList }">
				<c:forEach var="file" items="${item.fileList }">
					<img src="<c:url value='${file.savePath }/${file.unqFileName }'/>" style="width: 150px;">
				</c:forEach>
			</c:forEach>

		</c:when>		
		<c:otherwise>
		
		</c:otherwise>
	</c:choose>

<jsp:include page="inc/footer_T.jsp"></jsp:include>

</body>
</html>
