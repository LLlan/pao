<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>
<h3 class="header smaller lighter blue">基本信息</h3>

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal data-form" enctype="multipart/form-data" role="form" action="${pageContext.request.contextPath}/vmanage/homemakingManage/edit/exec" method="post" valid="true">

			<input type="hidden" id="id" name="id" value="${PAGE_DATA.id}">
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="account"> 家政公司账号 </label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text" id="form-field-1" placeholder="家政公司账号" id="account" class="col-xs-10 col-sm-5" name="account" value="${PAGE_DATA.account}" readOnly/>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="name"> 家政公司名称</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text" id="form-field-1" placeholder="家政公司名称" id="name" class="col-xs-10 col-sm-5" name="name" value="${PAGE_DATA.name}" />
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="name"> 家政公司logo </label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input type="file" id="file" name="file"/>
						<input type="hidden" id="hidFile" name="hidFile" value="${PAGE_DATA.logoFile}"/>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="balance"> 账户余额 </label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text" id="form-field-1" placeholder="账户余额" id="balance" class="col-xs-10 col-sm-5" name="balance" value="${PAGE_DATA.balance}" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="homemakingGrade"> 星级评分 </label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text" id="form-field-1" placeholder="星级评分" id="homemakingGrade" class="col-xs-10 col-sm-5" name="homemakingGrade" value="${PAGE_DATA.homemakingGrade}" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="phoneNumber"> 联系电话</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text" id="form-field-1" placeholder="联系电话" id="phoneNumber" class="col-xs-10 col-sm-5" name="phoneNumber" value="${PAGE_DATA.phoneNumber}" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="introduction"> 介绍</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<textarea class="col-xs-10 col-sm-5" placeholder="介绍" id="introduction" name="introduction">${PAGE_DATA.introduction}</textarea>
					</div>
				</div>
			</div>
			
			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<button class="btn btn-info save" type="button">
						<i class="ace-icon fa fa-check bigger-110"></i> 提交
					</button>

					&nbsp; &nbsp; &nbsp;
					<button class="btn reset" type="reset">
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/fuelux.tree.custom.js"></script>
<script type="text/javascript">
	$(function() {
		$(".data-form").validate({
			errorElement: 'div',
			errorClass: 'help-block',
			focusInvalid: false,
			ignore: "",
			rules: {
				account: {
					required: true,
					maxlength: 16
				},
				name: {
					required: true,
					maxlength: 16
				},
				balance: {
					number: true,
					required: true
				},
				hidFile: {
					required: true
				},
				homemakingGrade: {
					number: true,
					required: true
				},
				phoneNumber: {
					required: true,
					maxlength: 16
				},
				introduction: {
					maxlength: 256			
				}
			},
			highlight: function (e) {
				$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
			},
			success: function (e) {
				$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
				$(e).remove();
			},
			errorPlacement: function (error, element) {
				if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
					var controls = element.closest('div[class*="col-"]');
					if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
					else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
				}
				else if(element.is('.select2')) {
					error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
				}
				else if(element.is('.chosen-select')) {
					error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
				}
				else error.insertAfter(element.parent());
			},
			submitHandler: function (form) {
			},
			invalidHandler: function (form) {
			}
		});
		$(".save").on("click", function() {
			$(".data-form").form({
				success:function(res) {
					//弹窗提示
					$.messager.alert(res.msg, function() {
						if(res.code) {
							//提交成功,跳转回查询页面
							action("vmanage/homemakingManage/list");
						}
					});
				}
			});
		});
		
		
		$(".reset").on("click", function() {
			$(".data-form").formClear();
		});
	
		$(".cancel").on("click", function() {
			action("vmanage/homemakingManage/list");
		});

		$("#file").ace_file_input({
			style: 'well',
			btn_choose: '点击或将图片拖拽至此上传!',
			btn_change: null,
			no_icon: 'ace-icon fa fa-cloud-upload',
			droppable: true,
			thumbnail: 'small', //large | fit,
			allowExt:  ['jpg', 'jpeg', 'png', 'gif', 'tif', 'tiff', 'bmp'],
			allowMime: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif', 'image/tif', 'image/tiff', 'image/bmp'],
			maxSize: 10000000,
			before_remove: function() {
				$("#hidFile").val("");
				return true;
			},
			preview_error: function(filename, error_code) {
				console.log(error_code)
			}
		}).on('change', function(){
			$("#hidFile").val($(this).data('ace_input_files')[0]);
		});
		$("#file").ace_file_input('show_file_list', ['${PAGE_DATA.logoFile}']);
		
		$(".ace-file-input").addClass("col-xs-10 col-sm-5");
	});
	
</script>