<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String basePath = request.getContextPath();
	request.setAttribute("basePath",basePath);
%>

<style type="text/css">


	.input_div label {
		display:inline-block;
		width: 200px;
	}
	select{width: 260px;}
	.input_div input {
		width: 260px;
	}
	input{width: 260px;}
	#fileLogo{display:inline-block; font-size:16px;}

</style>
<h3 class="header smaller lighter blue">新增帖子目录</h3>
<!-- DataTable定义区 -->
<div class="row">
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
	<form class="form-horizontal data-form"  id="addForm"  method="post"  action="${pageContext.request.contextPath}/vestate/estate/invitationCategoryManage/add/exec" enctype="multipart/form-data" valid="true">
			<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right"
				   for="form-field-1">目录名称</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text" placeholder="目录名称" class="col-xs-10 col-sm-5" name="name" id="name" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					   for="form-field-1"> logo</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input name="fileLogo" placeholder="logo" class="col-xs-10 col-sm-5" id="fileLogo" type="file"  />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					   for="form-field-1"> 排序 </label>

				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text" placeholder="排序" class="col-xs-10 col-sm-5" name="sortNo" id="sortNo" />
					</div>
				</div>
			</div>
			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<button class="btn btn-info save" type="button">
						<i class="ace-icon fa fa-check bigger-110"></i> 提交
					</button>

					&nbsp; &nbsp; &nbsp;
					<button class="btn reset" type="button">
						<i class="ace-icon fa fa-refresh bigger-110"></i> 重置
					</button>

					&nbsp; &nbsp; &nbsp;
					<button class="btn btn-danger cancel" type="button">
						<i class="ace-icon fa fa-undo bigger-110"></i> 取消
					</button>
				</div>
			</div>
		</form>
	</div>
</div>
<script  type="text/javascript">
	$(function(){
		$(".data-form").validate(
				{
					errorElement : 'div',
					errorClass : 'help-block',
					focusInvalid : false,
					ignore : "",
					rules : {
						name : {
							required : true},
						fileLogo : {
							required : true
						}
					},
					highlight : function(e) {
						$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
					},
					success : function(e) {
						$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
						$(e).remove();
					},
					errorPlacement : function(error, element) {
						if (element.is('input[type=checkbox]')
								|| element.is('input[type=radio]')) {
							var controls = element.closest('div[class*="col-"]');
							if (controls.find(':checkbox,:radio').length > 1)
								controls.append(error);
							else
								error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
						} else if (element.is('.select2')) {
							error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
						} else if (element.is('.chosen-select')) {
							error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
						} else
							error.insertAfter(element.parent());
					},
					submitHandler : function(form) {
					},
					invalidHandler : function(form) {
					}
				});

		$(".save").on("click", function() {
			$(".data-form").form({
				success : function(res) {
					//弹窗提示
					$.messager.alert(res.msg, function() {
						if (res) {
							//提交成功,跳转回查询页面
							action("/vestate/estate/invitationCategoryManage/list");
						}
					});
				}
			})
		});
		$(".reset").on("click", function() {
			$(".data-form").formClear();
		});

		$(".cancel").on("click", function() {
			action("/vestate/estate/invitationCategoryManage/list");
		});
	});

</script>


