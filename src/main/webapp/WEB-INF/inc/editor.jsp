<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="<c:url value='/js/smartEditor/js/HuskyEZCreator.js'/>"></script>
<textarea rows="20" cols="145" id="contents" name="contents" htmlEscape="false" style="width: 100%; height: 150px;">${vo.contents }</textarea>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "contents",
	sSkinURI: "<c:url value='/js/smartEditor/SmartEditor2Skin.html'/>",	
	htParams : {bUseToolbar : true,
		fOnBeforeUnload : function(){
		}
	},
	fOnAppLoad : function(){
	},
	fCreator: "createSEditor2"
});
</script>