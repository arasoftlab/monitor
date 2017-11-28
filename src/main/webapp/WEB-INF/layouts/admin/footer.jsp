<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
/* 
	.modal{text-align:center;padding:0 !important; display:none;}
	.modal:before{content:'';display:inline-block;height:100%;vertical-align:middle;margin-right:-4px;}
	.modal-dialog{display:inline-block;text-align:left;vertical-align:middle;}
	
 */	
 	.img-responsive{ max-height: calc(100vh - 225px);}	
</style>

<!-- Modal -->
<div class="modal animated fade center-block" id="progressModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display:none;">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel"><i class="fa fa-clock-o"></i>잠시만 기다려 주세요.</h4>
      </div>
      <div class="modal-body">
        <p>파일업로드를 처리중입니다.</p>
        <div class="progress">
          <div class="progress-bar bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
            
          </div>
        </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->