/**
 * 배열 인덱스 요소 제거
 * @param index
 * @returns {Array}
 */
Array.prototype.removeElement = function(index){
	this.splice(index,1);
	return this;
}

/**
 * 배열 비우기
 * @returns {Array}
 */
Array.prototype.clear = function(){
	while(this.length>0){
		this.pop();
	}
	return this;
}

/**
 * lpad
 * @param str
 * @param num
 * @param chr
 * @returns
 */
function lpad(str, num, chr){
	if(isNumber(str)) str = String(str);
	if(!str || !chr || str.length >= Number(num)){
		return str;
	}
	
	var max = num-str.length;
	for(var i=0; i<max; i++){
		str = chr+str;
	}
	return str;
}

/**
 * 숫자여부
 * @param str
 * @returns {Boolean}
 */
function isNumber(str) {
	str += '';
	str = str.replace(/^\s*|\s*$/g, '');
	if (str == '' || isNaN(str)) return false;
	return true;
}

/**
 * 값 null 유무
 * @param obj
 * @returns {Boolean}
 */
function isNull(obj){
	var returnVal = false;
	
	if(obj == null){
		return true;
	}
	
	if(obj == ""){
		return true;
	}
	
	if(typeof obj == "undefined"){
		return true;
	}
}

/**
 * 필수입력 체크
 * @returns {Boolean}
 */
function fnCheckRequired(){
	var returnVal = true;
	
	$("input[type=text]").each(function(){
		if($(this).data("required") == "required"){
			if($(this).val() == ""){
				alert($(this).data("label")+"은(는) 필수 입력 입니다.");
				$(this).focus();
				returnVal = false;
				return false;
			}
		}
	});
	
	if(!returnVal) return;
	
	$("textarea").each(function(){
		if($(this).data("required") == "required"){
			if($(this).val() == ""){
				alert($(this).data("label")+"은(는) 필수 입력 입니다.");
				$(this).focus();
				returnVal = false;
				return false;
			}
		}
	});
	
	if(!returnVal) return;
	
	$("select").each(function(){
		if($(this).data("required") == "required"){
			if($(this).val() == ""){
				alert($(this).data("label")+"을(를) 선택하세요.");
				$(this).focus();
				returnVal = false;
				return false;
			}
		}
	});
	
	if(!returnVal) return;
	
	return returnVal;
}

/**
 * object element null 체크
 * @param el
 * @returns
 */
function isEmpty(el){
    return ( el == null  || el == "" ) ? true : false;
}

/**
 * 개별 파일 다운로드.
 * 첨부파일을 개별로 다운로드
 * @param fileId
 */
function fnFileDown(fileId, url){
	
	var frm = document.fileDown;	
	if (isEmpty(frm)){
		var divObj = document.createElement("div");
		var innerStr = "<form id='fileDown' method='post' name='fileDown' action='"+url+"'>";
		innerStr += "<input type='hidden' name='file_id' />";
		innerStr += "</form>";
		divObj.innerHTML = innerStr;
		document.body.appendChild(divObj);
	}

	document.fileDown.file_id.value=fileId;
	document.fileDown.submit();
}


function fnFileDownFromUFN(fileId, url){

	var frm = document.fileDown;	
	if (isEmpty(frm)){
		var divObj = document.createElement("div");
		var innerStr = "<form id='fileDown' method='post' name='fileDown' action='"+url+"'>";
		innerStr += "<input type='hidden' name='file_id' />";
		innerStr += "</form>";
		divObj.innerHTML = innerStr;
		document.body.appendChild(divObj);
	}

	document.fileDown.file_id.value=fileId;
	document.fileDown.submit();
}

/**
 * 이벤트의 연속동작을 방지하기 위해 기본 이벤트를 동작하지 못하도록 하는 기능
 * @param
 * 2017 12 14
 */
function stopEvent(e){
	//var eCheck = 
	//console.log(e);
	
	e.preventDefault ? e.preventDefault() : (e.returnValue = false);
/*	if(typeof eCheck === 'undefined' ){
		e.returnValue = false;
	}else{
		e.preventDefault();
	}*/
}
