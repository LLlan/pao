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
		<form class="form-horizontal data-form" enctype="multipart/form-data" role="form" action="${pageContext.request.contextPath}/vhousekeeping/homemakingServiceManage/homemakingPriceManage/edit/exec" method="post" valid="true">

			<input type="hidden" id="id" name="id" value="${PAGE_DATA.id}">
			<input type="hidden" id="serviceDescriptionId" name="serviceDescriptionId" value="${PAGE_DATA.serviceDescriptionId}"/>
			<input type="hidden" id="homemakingServiceId" name="homemakingServiceId" value="${PAGE_DATA.homemakingServiceId}"/>
			<input type="hidden" id="serviceTypeId" name="serviceTypeId" value="${PAGE_DATA.serviceTypeId}"/>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="serviceDescriptionName"> 服务描述  </label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text" id="form-field-1" placeholder="服务描述 " id="serviceDescriptionName" name="serviceDescriptionName" class="col-xs-10 col-sm-5" value="${PAGE_DATA.serviceDescriptionName}" readOnly />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="descriptionRemarks"> 服务备注</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<textarea class="col-xs-10 col-sm-5" placeholder="服务备注" id="descriptionRemarks" name="descriptionRemarks" disabled="disabled">${PAGE_DATA.descriptionRemarks}</textarea>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="price"> 价格</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text" id="form-field-1" placeholder="价格" id="price" class="col-xs-10 col-sm-5" name="price" value="${PAGE_DATA.price}" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="remarks"> 价格备注</label>
				<div class="col-sm-9">
					<div class="clearfix">
						<textarea class="col-xs-10 col-sm-5" placeholder="价格备注" id="remarks" name="remarks">${PAGE_DATA.remarks}</textarea>
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
				price: {
					number: true,
					required: true
				},
				remarks: {
					maxlength: 500
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
							var serviceTypeId = $("#serviceTypeId").val();
							var homemakingServiceId = $("#homemakingServiceId").val();
							action("vhousekeeping/homemakingServiceManage/homemakingPriceManage/list?homemakingServiceId=" + homemakingServiceId + "&serviceTypeId=" + serviceTypeId);
						}
					});
				}
			});
		});
		
		
		$(".reset").on("click", function() {
			$(".data-form").formClear();
		});
	
		$(".cancel").on("click", function() {
			var serviceTypeId = $("#serviceTypeId").val();
			var homemakingServiceId = $("#homemakingServiceId").val();
			action("vhousekeeping/homemakingServiceManage/homemakingPriceManage/list?homemakingServiceId=" + homemakingServiceId + "&serviceTypeId=" + serviceTypeId);
		});
	});
	
</script>