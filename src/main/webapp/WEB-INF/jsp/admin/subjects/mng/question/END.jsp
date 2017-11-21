<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="back_style">
	<div style="background:lightblue;border-radius: 6px 6px 0 0;">
		<table>
			<tr>
				<td style="padding-left: 20px;"><i class="fa fa-edit" style="font-size: xx-large;"></i></td>
				<td style="padding-left: 10px;"><h1> 확인 페이지</h1></td>
				<td style="padding-left: 20px;"><span>종료 메시지 작성</span></td>
			</tr>
		</table>
	</div>
	<table class="table table-bordered table-margin" style="padding-top:10px;">
		<tbody>
			<tr>
				<td class="td1">종료 메시지</td>
				<td colspan=3 class="left">
					<textarea rows="3" name="close_comment" id="close_comment" cols="145" style="width: 100%;">${vo.close_comment }</textarea>
				</td>
			</tr>
		</tbody>
	</table>

	<div class="col-lg-2 pull-right right" style="margin-right:10px;">
		<button class="btn btn-theme" onclick="fnUpdateEndpage();">저장</button>
	</div>
</div>				