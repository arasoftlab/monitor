<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  
<footer style="background:none; text-align:-webkit-center;">
	<div class="col-xs-12" style="text-align:center">

<!--
		<button class="btn btn-theme" onclick="historyDelete('${vo.question_id}','${history_arr}'  ,'${history_params}')"><i class="fa fa-2x fa-caret-square-o-left" ></i><br/><span style="font-size:8pt;">이전</span></button>
  
		<button class="btn btn-theme"><i class="fa fa-2x fa-bars"></i><br/><span style="font-size:8pt;">목록</span></button>
		<button class="btn btn-theme"><i class="fa fa-2x fa-check-square"></i><br/><span style="font-size:8pt;">저장</span></button>
-->
		<button class="btn btn-theme" onclick="chkValidation()"><i class="fa fa-2x fa-caret-square-o-right"></i><br/><span style="font-size:8pt;">다음</span></button>
	</div>
	

</footer>


