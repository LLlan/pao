<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<h3 class="header smaller lighter blue">修改物业端角色信息</h3>
<!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal data-form" role="form"
			action="${pageContext.request.contextPath}/vestate/core/roleManage/edit/exec"
			method="post" valid="true">

			<input type="hidden" id="id" name="id" value="${PAGE_DATA.id }">
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 角色名称 </label>

				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text" id="form-field-1" placeholder="角色名称"
							class="col-xs-10 col-sm-5" name="name" value="${PAGE_DATA.name }" />
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 排序 </label>

				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text" id="form-field-1" placeholder="排序"
							class="col-xs-10 col-sm-5" name="sort" value="${PAGE_DATA.sort }" />
					</div>
				</div>
			</div>


			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 角色权限 </label>

				<div class="col-sm-9">
					<div class="widget-box widget-color-blue2 col-xs-10 col-sm-5">
						<div class="widget-header">
							<h4 class="widget-title lighter smaller">请勾选功能权限</h4>
						</div>
						<input id="functions" name="functions" type="hidden" value="">
						<div class="widget-body">
							<div class="widget-main padding-8">
								<ul id="tree"></ul>
							</div>
						</div>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/fuelux.tree.custom.js"></script>
<script type="text/javascript">
	$(function() {
		initTree();
	});
	$(".data-form").validate(
					{
						errorElement : 'div',
						errorClass : 'help-block',
						focusInvalid : false,
						ignore : "",
						rules : {
							name : {
								required : true,
								maxlength : 16
							},
							sort : {
								required : true,
								digits : true,
								maxlength : 11
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
		var fs = $("#tree").tree("selectedItems");
		var functions = "";
		for (var i = 0; i < fs.length; i++) {
			functions += fs[i]["id"] + ",";
		}
		$("#functions").val(functions);
		$(".data-form").form({
			success : function(res) {
				//弹窗提示
				$.messager.alert(res.msg, function() {
					if (res) {
						//提交成功,跳转回查询页面
						action("vestate/core/roleManage/list");
					}
				});
			}
		})
	});

	$(".reset").on("click", function() {
		$(".data-form").formClear();
		initTree();
	});

	$(".cancel").on("click", function() {
		action("vestate/core/roleManage/list");
	});

	function initTree() {
		$p = $('#tree').parent();
		$('#tree').remove();
		$p.html("<ul id='tree'></ul>");
		$.businAjax(
						"${pageContext.request.contextPath}/vestate/core/roleManage/queryTreeData",
						{
							"roleId" : "${PAGE_DATA.id}"
						},
						function(res) {
							if (res.code) {
								var nodes = res.data.tree;
								var dataSource1 = new TreeData(nodes);
								$('#tree').ace_tree(
												{
													dataSource : dataSource1,
													multiSelect : true,
													cacheItems : true,
													'open-icon' : 'ace-icon tree-minus',
													'close-icon' : 'ace-icon tree-plus',
													'selectable' : true,
													'selected-icon' : 'ace-icon fa fa-check',
													'unselected-icon' : 'ace-icon fa fa-times',
													loadingHTML : '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>'
												});
								$('#tree').tree("discloseAll");
								var perms = res.data.perms;
								if (perms) {
									setTimeout(function() {
										for (var i = 0; i < perms.length; i++) {
											$("#tree").tree("selectedId", {
												el : $("#tree"),
												item : perms[i]
											});
										}
									}, 50);
								}
							}
						})
	}
</script>