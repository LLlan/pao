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
		<form class="form-horizontal data-form" role="form" valid = "true" action="${pageContext.request.contextPath}/vestate/estate/estateUserManage/add/exec">
			<!-- #section:elements.form -->
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 用户名 </label>

				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text" id="username" placeholder="用户名"
							class="col-xs-10 col-sm-5" name="username" />
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 昵称 </label>

				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text" id="nickName" placeholder="昵称"
							class="col-xs-10 col-sm-5" name="nickName" />
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 密码 </label>

				<div class="col-sm-9">
					<div class="clearfix">
						<input type="password" id="password" placeholder="密码"
							class="col-xs-10 col-sm-5" name="password" />
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 角色 </label>

				<div class="col-sm-9">
					<div class="clearfix">
						<select id="roleId" name="roleId">
							<c:forEach var="item" items="${requestScope.list}">
								<option value="${item.id}">${item.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			
			
			<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 小区 </label>
			<div class="col-sm-9">
				<select multiple="" class="chosen-select form-control" id="villageChoose" name="villageChooseN" data-placeholder="请选择">
				<c:forEach var="item" items="${requestScope.village}" varStatus="vs">
					<option value="${item.id}">${item.villageName}</option>
				</c:forEach>
				</select>
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

<script type="text/javascript">
	$(function() {
		$(".data-form").validate(
						{
							errorElement : 'div',
							errorClass : 'help-block',
							focusInvalid : false,
							ignore : "",
							rules : {
								username : {
									required : true,
									digits:true,
									maxlength : 11,
									minlength : 11
								},
								password : {
									required : true,
									minlength : 6
								},
								nickName : {
									required : true,
									maxlength : 16
								},
								roleId : {
									required : true,
									minlength : 1
								}
							},
							highlight : function(e) {
								$(e).closest('.form-group').removeClass(
										'has-info').addClass('has-error');
							},
							success : function(e) {
								$(e).closest('.form-group').removeClass(
										'has-error');//.addClass('has-info');
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
							action("vestate/estate/estateUserManage/list");
						}
					});
				}
			});
		});

		$(".reset").on("click", function() {
			$(".data-form").formClear();
		});

		$(".cancel").on("click", function() {
			action("vestate/estate/estateUserManage/list");
		});
		
		
		$('.chosen-select').chosen({allow_single_deselect:true}); 
		//resize the chosen on window resize
		$(window).off('resize.chosen').on('resize.chosen', function() {
			$('.chosen-select').each(function() {
				 var $this = $(this);
				 $this.next().css({'width': $this.parent().width()});
			})
		}).trigger('resize.chosen');
		//resize chosen on sidebar collapse/expand
		$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
			if(event_name != 'sidebar_collapsed') return;
			$('.chosen-select').each(function() {
				 var $this = $(this);
				 $this.next().css({'width': $this.parent().width()});
			})
		});
	});
</script>