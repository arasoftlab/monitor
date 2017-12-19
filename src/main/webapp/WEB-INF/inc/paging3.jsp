<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageUnit" value="5" />

<script type="text/javascript">
	function fnGoList(pageNum){
		var uri = "${requestScope['javax.servlet.forward.request_uri']}";
		var params = "${requestScope['javax.servlet.forward.query_string']}";
		var nParams = "";
		
		var paramArray = params.split("&");
		for(var i=0; i<paramArray.length; i++){
			if(paramArray[i].split("=")[0] != "pageNum"){
				if(i != 0){
					nParams += "&";
				}
				nParams += paramArray[i];
			}
		}
		
		nParams+="&pageNum="+pageNum;
		uri = uri+"?"+nParams;
		//alert(uri);
		location.href=uri;
	}
</script>

<div id="page-wrap" style="text-align:center;margin-top:10px">
	<ul class="pagination">

	  <fmt:parseNumber var="s_page" integerOnly="true" value="${(vo.pageNum/pageUnit)}"/>
	  <fmt:parseNumber var="e_page" integerOnly="true" value="${(vo.pageNum/pageUnit)}"/>		

	  <c:if test="${vo.pageNum > pageUnit}">
		  <li style="padding: 1px 0;margin-right:5px;"><a href="javascript:fnGoList('1');" style="margin-right:5px;">&laquo;</a></li>
	  </c:if>
	  
	  <c:if test="${vo.pageNum > 1}">
		  <li style="padding: 1px 0;"><a href="javascript:fnGoList(${vo.pageNum -1});" >◀</a></li>
	  </c:if>
	  
	  <c:forEach begin="${s_page * pageUnit }" end="${(e_page * pageUnit + pageUnit) -1}" var="pageNum" varStatus="pIndex">
		<c:set var="pn" value="${pageNum eq 0 ? 1: pageNum + 1 }" />
	  	<c:if test="${pn <= page.totalPage  }">
		  	<li class="<c:if test="${vo.pageNum eq pn }">active</c:if>" > 
		  		<a href="javascript:fnGoList('${pn }');">
		  			<div style="float: none !important;">${pn }</div>
		  		</a>
		  	</li>
		</c:if>
	
	  </c:forEach>
	  
  	  <c:if test="${vo.pageNum < page.totalPage}">
		  <li style="padding: 1px 0;"><a href="javascript:fnGoList(${vo.pageNum +1});" >▶</a></li>
	  </c:if>
	  
	  <c:if test="${page.totalPage - vo.pageNum > pageUnit}">
		  <li style="padding: 1px 0;"><a href="javascript:fnGoList('${page.totalPage }');" style="margin-left:5px;">&raquo;</a></li>
	  </c:if>
	  
	</ul>
</div>



