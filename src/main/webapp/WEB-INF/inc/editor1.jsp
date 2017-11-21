<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<textarea rows="20" cols="145" id="description" name="description" htmlEscape="false" style="width: 100%; height: 150px;">${vo.description }</textarea>
<script type="text/javascript">
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "description",
	sSkinURI: "<c:url value='/js/smartEditor/SmartEditor2Skin.html'/>",	
	htParams : {
		bUseToolbar : true,
		bUseVerticalResizer : false,
		fOnBeforeUnload : function(){}
	},
	fOnAppLoad : function(){
	},
	fCreator: "createSEditor2"
});


$(function() {
	$("textarea.autosize").keyup(function() {
		$(this).css("height", "1px").css("height",(20 + $(this).prop("scrollHeight")) + "px");
	});
});
</script>
